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
        foreach (Material::all() as $material) {
            $data['materials'][] = $material->materialName;
        }

        foreach (Color::all() as $color) {
            $data['colors'][] = $color->colorName;
        }

        $data['f'] = [
            'minSize' => $request->getParam('minSize') ?: Product::getMinSize(),
            'maxSize' => $request->getParam('maxSize') ?: Product::getMaxSize(),
            'minPrice' => $request->getParam('minPrice') ?: Product::getMinPrice(),
            'maxPrice' => $request->getParam('maxPrice') ?: Product::getMaxPrice(),
            'waterproof' => $request->getParam('waterproof') ?: 0,
            'materials' => $request->isPost() ? $request->getParam('materials') ?: [] : $data['materials'],
            'colors' => $request->isPost() ? $request->getParam('colors') ?: [] : $data['colors']
        ];

        $q = Product::getToRent();
        $request->getParam('minSize') ? $q->where('size', '>=', $request->getParam('minSize')) : '';
        $request->getParam('maxSize') ? $q->where('size', '<=', $request->getParam('maxSize')) : '';
        $request->getParam('minPrice') ? $q->where('price', '>=', $request->getParam('minPrice')) : '';
        $request->getParam('maxPrice') ? $q->where('price', '<=', $request->getParam('maxPrice')) : '';
        $request->getParam('waterproof') ? $q->where('waterproof') : ''; //TODO
        foreach (array_diff($data['colors'], $data['f']['colors']) as $color) {
            $q->where('color', '!=', $color);
        }
        foreach (array_diff($data['materials'], $data['f']['materials']) as $material) {
            $q->where('material', '!=', $material);
        }

        $data['products'] = $q->get();

        $data['post'] = $_POST;
        $data['get'] = $_GET;

        $data['req'] = $request;
        $data['res'] = $response;

        $data['url'] = $_SERVER['REQUEST_URI'];
        /*foreach ($data['products'] as $product) {
            $data['images'][$product->id] = $product->getImgUrl();
        }*/


        $data['test'] = array_diff($data['colors'], $data['f']['colors']);

        return $this->view->render($response, 'Gallery/gallery.twig', $data);
    }
}