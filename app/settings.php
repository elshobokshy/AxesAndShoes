<?php

return [
    'env' => 'prod',
    'settings' => [

        'displayErrorDetails' => false,

        'view' => [
            'templates_path' => dirname(__DIR__) . '/src/App/Resources/views',
            'twig' => [
//                'cache' => dirname(__DIR__) . '/var/cache/twig',
                'cache' => false,
            ]
        ],

        'monolog' => [
            'name' => 'app',
            'path' => dirname(__DIR__) . '/var/logs/prod.log'
        ]

    ]
];
