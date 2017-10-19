<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/profile', 'app.controller:profile')->setName('profile');
<<<<<<< 639f634667805bd4c70962adab8cc88a5f2caf77
$app->get('/product/{id}', 'app.controller:product');
$app->get('/add', 'app.controller:add')->setName('add');
$app->post('/add', 'app.controller:add');
=======
$app->get('/detail/{id}', 'app.controller:detail');
>>>>>>> Renaming the "product" page "detail"
$app->get('/search', 'app.controller:search')->setname('search');
