<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/profile', 'app.controller:profile')->setName('profile');
$app->post('/profile', 'app.controller:editProfile');
$app->get('/add', 'app.controller:add')->setName('add');
$app->post('/add', 'app.controller:add');
$app->get('/detail/{id}', 'app.controller:detail')->setName('detail');
$app->post('/detail/{id}', 'app.controller:detail');
$app->get('/search', 'app.controller:search')->setname('search');
$app->post('/search', 'app.controller:search');
$app->get('/dashboard', 'app.controller:dashboard')->setname('dashboard');
$app->get('/delete/{id}', 'app.controller:delete')->setname('delete');
$app->get('/checkout/{id}', 'app.controller:checkout')->setname('checkout');
$app->post('/checkout/{id}', 'app.controller:checkout');