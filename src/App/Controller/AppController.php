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
    
    public function product(Request $request, Response $response, $id)
    {
        $product = $this->container->db->table('product')->find($id);

        if($product == NULL)
            return $this->view->render($response, 'App/product.twig', array("isNull" => true));

        $val = $this->auth->check() ? true : false;

        $color = $this->container->db->table('color')->find($product->color_id);
        $material = $this->container->db->table('material')->find($product->material_id);

        $json = json_decode($product->image)->img;

        $img = array();
        for($i = 0 ; $i < sizeof($json) ; $i++)
        {
            array_push($img, $_SERVER['REQUEST_URI'] . "/../../img/" . $json[$i]->url);
        }

        $data = array(
            "logged" => $val,
            "title" => $product->title,
            "desc" => $product->description, 
            "color" => $color->colorName, 
            "material" => $material->materialName,
            "size" => $product->size,
            "waterproof" => $product->waterproof ? "Yes" : "No",
            "img" => $img
        );

        return $this->view->render($response, 'App/product.twig', $data);
    }
}