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
<<<<<<< HEAD
<<<<<<< HEAD
=======
    }

    public function gallery(Request $request, Response $response)
    {
        return $this->view->render($response, 'App/gallery.twig');
>>>>>>> c31f6b62468ff7a6173f55cb2dd50e218eed8a06
=======
>>>>>>> 6e2ac13d74e88a748a974e36fdbbc30eb30128ac
    }
}