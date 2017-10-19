<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/profile', 'app.controller:profile')->setName('profile');
<<<<<<< 639f634667805bd4c70962adab8cc88a5f2caf77
$app->get('/product/{id}', 'app.controller:product');
<<<<<<< 4a7a42d1efcddd7ff1cd18b2f7a8fbdb95e6714b
$app->get('/add', 'app.controller:add')->setName('add');
$app->post('/add', 'app.controller:add');
=======
$app->get('/detail/{id}', 'app.controller:detail');
>>>>>>> Renaming the "product" page "detail"
=======
>>>>>>> commit before rebase
$app->get('/search', 'app.controller:search')->setname('search');
