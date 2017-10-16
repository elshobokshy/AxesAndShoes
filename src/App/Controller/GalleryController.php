<?php

namespace App\Controller;

use Slim\Http\Request;
use Slim\Http\Response;

class GalleryController extends Controller
{
    public function gallery(Request $request, Response $response, Array $data = [])
    {
        $data['f'] = [
            'minSize' => $request->getParam('minSize') ?: \Product::getMinSize(),
            'maxSize' => $request->getParam('maxSize') ?: \Product::getMaxSize(),
            'minPrice' => $request->getParam('minPrice') ?: \Product::getMinPrice(),
            'maxPrice' => $request->getParam('maxPrice') ?: \Product::getMaxPrice(),
            'materials' => $request->getParam('materials') ?: \Material::getAll(),
            'waterproof' => $request->getParam('waterproof') ?: 0, //if yes waterproof only
            'colors' => $request->getParam('colors') ?: \Color::getAll()
        ];

       /* $p = \Product::


            ->orderBy('')

*/





        $projets = \ModProjets::where('ext_projet.id_statut', 1)//en cours
        ->leftjoin('ext_saisie_temps', function ($j) use ($idu) {
            $j->on('ext_projet.id_projet', 'ext_saisie_temps.id_projet');
            $j->where('ext_saisie_temps.id_user', $idu);
        })
            ->leftjoin('ext_tache', function ($j) use ($idu) {
                $j->on('ext_projet.id_projet', 'ext_tache.id_projet');
                $j->where(function ($q) use ($idu) {
                    $q->where('ext_tache.a_qui', $idu)
                        ->orwhere('ext_tache.de_qui', $idu);
                });
            })
            ->leftjoin('ext_client', 'ext_projet.id_client', 'ext_client.id_client')//Pour des renseignement du tab
            ->where(function ($q) use ($idu) {
                $q->where('ext_tache.a_qui', $idu)//Ou une tache de ce projet m'est assignée
                ->orwhere('ext_tache.de_qui', $idu)//Ou j'ai assigné une tache de ce projet
                ->orwhere('ext_saisie_temps.id_user', $idu)//Un temp a été rentré au projet avec moi
                ->orwhere('ext_projet.id_user_chef_projet', $idu);
            })
            ->groupBy('ext_projet.id_projet')
            ->orderBy('date_echeance_projet', 'DESC');





        $data['post'] = $_POST;
        $data['get'] = $_GET;
        $data['p'] = 'bleu';

        $data['req'] = $request;
        $data['res'] = $response;
        return $this->view->render($response, 'Gallery/gallery.twig', $data);
    }
}