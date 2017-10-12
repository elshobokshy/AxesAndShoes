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

    public function product(Request $request, Response $response)
    {
        $val = $this->auth->check() ? true : false;
        
        $data = array("logged" => $val);
        return $this->view->render($response, 'App/product.twig', $data);
    }
}