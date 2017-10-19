<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/profile', 'app.controller:profile')->setName('profile');
$app->get('/product/{id}', 'app.controller:product');
$app->get('/add', 'app.controller:add')->setName('add');
$app->post('/add', 'app.controller:add');
$app->get('/search', 'app.controller:search')->setname('search');
