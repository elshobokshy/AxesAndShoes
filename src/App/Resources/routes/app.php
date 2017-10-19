<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/profile', 'app.controller:profile')->setName('profile');
$app->get('/product/{id}', 'app.controller:product');
$app->get('/search', 'app.controller:search')->setname('search');
