<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/profile', 'app.controller:profile')->setName('profile');
$app->get('/detail/{id}', 'app.controller:detail');
$app->get('/search', 'app.controller:search')->setname('search');
$app->post('/search', 'app.controller:search')->setname('search');
