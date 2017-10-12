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
    
    public function product(Request $request, Response $response)
    {
        return $this->view->render($response, 'App/product.twig');
    }
}