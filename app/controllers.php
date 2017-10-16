<?php

$controllers = [
    'app.controller' => 'App\Controller\AppController',
    'auth.controller' => 'App\Controller\AuthController',
    'gallery.controller' => 'App\Controller\GalleryController'
];

foreach ($controllers as $key => $class) {
    $container[$key] = function ($container) use ($class) {
        return new $class($container);
    };
}
