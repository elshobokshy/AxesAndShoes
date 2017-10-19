<?php

namespace App\Controller;

use Slim\Http\Request;
use Slim\Http\Response;

class AppController extends Controller
{
    public function home(Request $request, Response $response)
    {
        return $this->view->render($response, 'App/home.twig');
    }

    public function profile(Request $request, Response $response)
    {
        if($this->auth->guest()) {
            return $this->view->render($response, 'Auth/login.twig');
        } else if ($user = $this->auth->getUser()) {
            return $this->view->render($response, 'App/profile.twig');
        }
    }
    
    public function detail(Request $request, Response $response, $id)
    {
        $product = $this->container->db->table('product')->find($id);

        if($product == NULL)
            return $this->view->render($response, 'App/detail.twig', array("isNull" => true));

        $val = $this->auth->check() ? true : false;

        $color = $this->container->db->table('color')->find($product->color_id);
        $material = $this->container->db->table('material')->find($product->material_id);

        $json = json_decode($product->image)->img;

        $main_img = $_SERVER['REQUEST_URI'] . "/../../img/" . $json[0]->url;

        if(sizeof($json) > 1)
        {
            $img = array();
            for($i = 0 ; $i < sizeof($json) ; $i++)
            {
                array_push($img, $_SERVER['REQUEST_URI'] . "/../../img/" . $json[$i]->url);
            }
        }

        $data = array(
            "logged" => $val,
            "title" => $product->title,
            "desc" => $product->description, 
            "color" => $color->colorName, 
            "material" => $material->materialName,
            "size" => $product->size,
            "waterproof" => $product->waterproof ? "Yes" : "No",
            "main_img" => $main_img,
            "img" => $img, 
            "price" =>$product->price
        );

        return $this->view->render($response, 'App/detail.twig', $data);
    }

    public function search(Request $request, Response $response)
    {
        $searching = $request->getParam('search');
        if($searching)
        {
            $products = $this->container->db->table('product')->where('title',  'like',  '%' . $searching . '%')->get();      
            $product_list = [];
            
            foreach ($products as $p)
            {   
                $json = json_decode($p->image)->img;
                $url = "img/" . $json[0]->url;
                array_push($product_list, [
                                            "id" => $p->id,
                                            "title" => $p->title, 
                                            "img" => $url, 
                                            "price" => $p->price]);
            }
        }

        return $this->view->render($response, 'App/search.twig', ["products" => $product_list]);
    }
}