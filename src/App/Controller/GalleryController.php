<?php

namespace App\Controller;

use App\Model\Color;
use App\Model\Material;
use App\Model\Product;
use Slim\Http\Request;
use Slim\Http\Response;

class GalleryController extends Controller
{
    public function gallery(Request $request, Response $response, Array $data = [])
    {
        $data['f'] = [
            'minSize' => $request->getParam('minSize') ?: Product::getMinSize(),
            'maxSize' => $request->getParam('maxSize') ?: Product::getMaxSize(),
            'minPrice' => $request->getParam('minPrice') ?: Product::getMinPrice(),
            'maxPrice' => $request->getParam('maxPrice') ?: Product::getMaxPrice(),
            'materials' => $request->getParam('materials') ?: Material::all(),
            'waterproof' => $request->getParam('waterproof') ?: 0, //if true waterproof only
            'colors' => $request->getParam('colors') ?: Color::all()
        ];

        $q = Product::getToRent();
        $request->getParam('minSize') ? $q->where('size', '>=', $request->getParam('minSize')) : '';
        $request->getParam('maxSize') ? $q->where('size', '<=', $request->getParam('maxSize')) : '';
        $request->getParam('minPrice') ? $q->where('size', '>=', $request->getParam('minPrice')) : '';
        $request->getParam('maxPrice') ? $q->where('size', '<=', $request->getParam('maxPrice')) : '';
        $request->getParam('materials') ? $q->where('size', '<=', $request->getParam('maxPrice')) : '';


        $data['post'] = $_POST;
        $data['get'] = $_GET;

        $data['req'] = $request;
        $data['res'] = $response;

        return $this->view->render($response, 'Gallery/gallery.twig', $data);
    }
}