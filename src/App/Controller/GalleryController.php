<?php

namespace App\Controller;

use Slim\Http\Request;
use Slim\Http\Response;

class GalleryController extends Controller
{
    public function gallery(Request $request, Response $response, Array $data = [] )
    {
        $data[ 'res'] = $request;
        $data[ 'req' ]= $response;
        return $this->view->render($response, 'Gallery/gallery.twig', $data);
    }
}