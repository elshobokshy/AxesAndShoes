<?php

namespace App\Controller;

use Respect\Validation\Validator as V;
use Slim\Http\Request;
use Slim\Http\Response;
use App\Model\Color;
use App\Model\Material;
use App\Model\Product;

class AppController extends Controller
{
    public function home(Request $request, Response $response)
    {
        return $this->view->render($response, 'App/home.twig');
    }

    public function profile(Request $request, Response $response)
    {
        if ($this->auth->guest()) {
            return $this->view->render($response, 'Auth/login.twig');
        }
        return $this->view->render($response, 'App/profile.twig');
    }

    public function detail(Request $request, Response $response, $id)
    {
        if (!($product = Product::find($id)))
            return $this->view->render($response, 'App/detail.twig', array('isNull' => true));

        $json = json_decode($product->image)->img;

        $img = array();
        for($i = 0 ; $i < sizeof($json) ; $i++)
        {
            array_push($img, "img/" . $json[$i]->url); 
        }

        $data = array(
            'id' => $product->id,
            'logged' => $this->auth->check(),
            'title' => $product->title,
            'desc' => $product->description,
            'color' => $product->color,
            'material' => $product->material,
            'size' => $product->size,
            'waterproof' => $product->waterproof,
            'img' => $img,
            'price' => $product->price
        );

        if($request->isPost())
        {
            $date = $request->getParam("date");

            $this->validator->request($request, [
                "date" => V::intVal()->positive()
            ]);
    
            if($this->validator->isValid())
            {   
                $product->update(
                    [
                        "dateToRent" => date('Y-m-d', strtotime( "$product->dateToRent + $date day" ))
                    ]
                );

                return $this->redirect($response, 'profile');
            }
        }
        
        return $this->view->render($response, 'App/detail.twig', $data);
    }

    public function add(Request $request, Response $response)
    {

        if ($request->isPost()) {
            $title = $request->getParam('title');
            $description = $request->getParam('description');
            $size = $request->getParam('size');
            $waterproof = $request->getParam('waterproof'); // 'Yes' or 'No'
            $price = $request->getParam('price');
            $material = $request->getParam('material');
            $color = $request->getParam('color');

            $cnt = count($_FILES['image']);

            $allowed = ['gif', 'png', 'jpg', 'jpeg'];
            $noErrors = 1;

            // Loop to make sure every item uploaded is an image with an extension in $allowed
            for ($i = 0; $i < $cnt; $i++) {
                if (isset($_FILES['image']['name'][$i])) {
                    $filename = $_FILES['image']['name'][$i];
                    $ext = pathinfo($filename, PATHINFO_EXTENSION);
                    if (!in_array($ext, $allowed, true)) {
                        $noErrors = 0;
                    }
                }
            }

            if (!$noErrors) {
                $this->validator->addError('image', 'Image needs to only have these extensions : gif, png, jpg, jpeg.');
            }

            $this->validator->request($request, [
                'title' => V::notEmpty()->alpha()->length(3, 25),
                'description' => V::notEmpty()->length(5, 1000)->alpha(),
                'size' => V::notEmpty()->noWhitespace()->numeric()->positive()->between(1, 255),
                'price' => V::notEmpty()->noWhitespace()->numeric()->positive()->between(1, 999),
                'waterproof' => V::notEmpty()->noWhitespace()->length(1, 3),
                'material' => V::notEmpty()->length(3, 20),
                'color' => V::notEmpty()->length(3, 20),
            ]);

            // img folder
            $img = $_SERVER['DOCUMENT_ROOT'] . '/img/';
            $conc = '';

            // Changing the name of each file uploaded and uploading it in img folder
            if ($noErrors = 1) {
                for ($i = 0; $i < $cnt; $i++) {
                    $name = uniqid('img-' . date('Ymd') . '-' . pathinfo($_FILES['image']['name'][$i], PATHINFO_EXTENSION), true);
                    if (isset($_FILES['image']['tmp_name'][$i])) {
                        if (move_uploaded_file($_FILES['image']['tmp_name'][$i], $img . $name) === true) {
                            $conc = $conc . ',{' . '"url":"' . $name . '"}';
                        }
                    }
                }
                $jsonImgs = '{"img":[{' . substr($conc, 2) . ']}';
            }

            if (Product::where('title', '=', $title)->exists()) {
                $this->validator->addError('title', 'Title already exists. Please use a unique title.');
            }

            if ($this->validator->isValid()) {
                $product = new Product();

                $product->dateToRent = date('Y-m-d');
                $product->title = $title;
                $product->description = $description;
                $product->size = $size;
                $product->waterproof = $waterproof;
                $product->price = $price;
                $product->color = $color;
                $product->material = $material;
                $product->image = $jsonImgs;
                $product->save();

                $this->flash('success', 'Your shoes has been put to rent to the public.');

                return $this->redirect($response, 'add');
            }
        }

        $data = [
            'colors' => Color::all(),
            'materials' => Material::all(),
        ];

        return $this->view->render($response, 'App/add.twig', $data);
    }

    public function search(Request $request, Response $response)
    {
        if ($searching = $request->getParam('search')) {
            $products = Product::where('title', 'like', '%' . $searching . '%')->get();
            $product_list = [];

            foreach ($products as $p) {
                $json = json_decode($p->image)->img;
                $url = 'img/' . $json[0]->url;
                $product_list[] = [
                    'id' => $p->id,
                    'title' => $p->title,
                    'img' => $url,
                    'price' => $p->price];
            }
        }

        return $this->view->render($response, 'App/search.twig', ['products' => $product_list]);
    }

    public function editProfile(Request $request, Response $response)
    {
        if(isset($_POST["change_details"])) {
            if ($request->isPost()) {
                $email = $request->getParam('email');
                $first_name = $request->getParam('first_name');
                $last_name = $request->getParam('last_name');
                $birthdate = $request->getParam('birthdate');
                $city = $request->getParam('city');
                $country = $request->getParam('country');
                
                $this->validator->request($request, [
                    'email' => V::noWhitespace()->email(),
                    'first_name' => V::length(1, 25)->alpha()->noWhitespace(),
                    'last_name' => V::length(1, 25)->alpha(),
                    'city' => V::length(1, 25)->alpha()->noWhitespace(),
                    'country' => V::length(1, 25)->alpha()->noWhitespace(),
                    'birthdate' => V::Date('Y-m-d')
                ]);

                if ($this->validator->isValid()) {

                    $credentials = [
                        'email' => $email,
                        'first_name' => $first_name,
                        'last_name' => $last_name,
                        'city' => $city,
                        'country' => $country,
                        'birthdate' => $birthdate,
                    ];
                    
                    $this->auth->update($this->auth->getUser()->id, $credentials);

                    $this->flash('success', 'Your account has been updated.');

                    return $this->redirect($response, 'profile');
                }
                return $this->view->render($response, 'App/profile.twig');
            }
        }
        else if(isset($_POST["change_pw"])) {
            if ($request->isPost()) {
                $password = $request->getParam('password');
                $passwordOld = $request->getParam('password_old');

                $verify = [
                    'password' => $passwordOld,
                ];

                if (!$this->auth->validateCredentials($this->auth->getUser(), $verify)) {
                    $this->validator->addError('password', 'The old password isn\'t correct. Please try again.');
                }
                
                $this->validator->request($request, [
                    'password' => [
                        'rules' => V::noWhitespace()->length(6, 25),
                        'messages' => [
                            'length' => 'The password length must be between {{minValue}} and {{maxValue}} characters'
                        ]
                    ],
                    'password_confirm' => [
                        'rules' => V::equals($password),
                        'messages' => [
                            'equals' => 'Passwords don\'t match'
                        ]
                    ],
                ]);

                if ($this->validator->isValid()) {
                    $role = $this->auth->findRoleByName('User');

                    $credentials = [
                        'password' => $password,
                    ];
                    
                    $this->auth->update($this->auth->getUser()->id, $credentials);

                    $this->flash('success', 'Your password has been updated.');

                    return $this->redirect($response, 'profile');
                }
                return $this->view->render($response, 'App/profile.twig');
            }

        }
    }
}