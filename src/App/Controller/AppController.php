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
        } else if ($user = $this->auth->getUser()) {
            return $this->view->render($response, 'App/profile.twig');
        }
    }
    
    public function detail(Request $request, Response $response, $id)
    {
        $product = $this->container->db->table('product')->find($id);

        if ($product == NULL)
            return $this->view->render($response, 'App/product.twig', array("isNull" => true));

        $val = $this->auth->check() ? true : false;

        $json = json_decode($product->image)->img;


        $img = [];
        for ($i = 0; $i < sizeof($json); $i++) {
            array_push($img, $_SERVER['REQUEST_URI'] . "/../../img/" . $json[$i]->url);
        }

        $data = array(
            "logged" => $val,
            "title" => $product->title,
            "desc" => $product->description,
            "color" => $product->color, 
            "material" => $product->material,
            "size" => $product->size,
            "waterproof" => $product->waterproof,
            "img" => $img
        );

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

            $imgs = [];
            $cnt = count($_FILES['image']);

            $allowed =  array('gif','png' ,'jpg', 'jpeg');
            $noErrors = '1';
            
            // Loop to make sure every item uploaded is an image with an extension in $allowed
            for($i = 0 ; $i < $cnt ; $i++) {
                if(isset($_FILES['image']['name'][$i])) {
                    $filename = $_FILES['image']['name'][$i];      
                    $ext = pathinfo($filename, PATHINFO_EXTENSION);
                    if( !in_array($ext,$allowed) ) {
                        $noErrors = '0';
                    }
                }
            }

            if( $noErrors = '0' ) {
                $this->validator->addError('image', 'Image needs to only have these extensions : gif, png, jpg, jpeg.');
            }
            
            
            $this->validator->request($request, [
                'title' => V::notEmpty()->alpha()->length(3, 25),
                'description' => V::notEmpty()->length(5, 1000)->alpha(),
                'size' => V::notEmpty()->noWhitespace()->Numeric()->positive()->between(1, 255),
                'price' => V::notEmpty()->noWhitespace()->Numeric()->positive()->between(1, 999),
                'waterproof' => V::notEmpty()->noWhitespace()->length(1, 3),
                'material' => V::notEmpty()->length(3, 20),
                'color' => V::notEmpty()->length(3, 20),
            ]);

            // img folder
            $img = $_SERVER['DOCUMENT_ROOT'] . '/img/';
            $conc = '';

            // Changing the name of each file uploaded and uploading it in img folder
            if( $noErrors = '1' ) {
                for($i = 0 ; $i < $cnt ; $i++) {
                    $name = uniqid('img-'.date('Ymd').'-');
                    if(isset($_FILES['image']['tmp_name'][$i]) ) {
                        if (move_uploaded_file($_FILES['image']['tmp_name'][$i], $img . $name) === true) {
                            $ext = pathinfo($_FILES['image']['name'][$i], PATHINFO_EXTENSION);
                            $conc = $conc . ',{' . '"url":"'. $name . '.' . $ext . '"}';
                        }
                    }
                }
                $jsonImgs = '{"img":[{'. substr($conc,2) .']}';
            }

            if (Product::where('title', '=', $title)->exists()) {
                $this->validator->addError('title', 'Title already exists. Please use a unique title.');
            }

            if ($this->validator->isValid()) {
                $product = new Product();

                $credentials = [

                    'title' => $title,
                    'description' => $description,
                    'size' => $password,
                    'waterproof' => $waterproof,
                    'price' => $price,
                    'material' => $material,
                    'color' => $color,
                    'image' => $files
                ];
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
            "colors" => Color::all(),
            "materials" => Material::all(),
        ];

        return $this->view->render($response, 'App/add.twig', $data);
    }
    
    public function search(Request $request, Response $response)
    {
        $searching = $request->getParam('search');
        if($searching)
        {
            $products = $this->container->db->table('product')->where('title',  'like',  '%' . $searching . '%')->get();      
            $data = ["products" => []];
            
            foreach ($products as $p)
            {   
                print_r($p->title);
                
            }
        }

        return $this->view->render($response, 'App/search.twig');
    }
}