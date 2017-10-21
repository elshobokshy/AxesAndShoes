<?php

return [
    'env' => 'prod',
    'settings' => [
        'displayErrorDetails' => false,

        'view' => [
            'templates_path' => dirname(__DIR__) . '/src/App/Resources/views',
            'twig' => [
<<<<<<< HEAD
                'cache' => dirname(__DIR__) . '/var/cache/twig'
=======
                'cache' => dirname(__DIR__) . '/var/cache/twig',
>>>>>>> 1fb9277c1b85b7c08fce7ba2183808c529a08423
            ]
        ],

        'monolog' => [
            'name' => 'app',
            'path' => dirname(__DIR__) . '/var/logs/prod.log'
        ]

    ]
];
