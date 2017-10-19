<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/profile', 'app.controller:profile')->setName('profile');
<<<<<<< e68d9af617e9edd242d6500169578758c29b6eda
<<<<<<< a05df651fb50e307d059dac23205b0fcd1d76d8c
<<<<<<< 639f634667805bd4c70962adab8cc88a5f2caf77
$app->get('/product/{id}', 'app.controller:product');
<<<<<<< 38375fb6be378e7e2b4f4b89b1e6c4ad29941701
<<<<<<< 4a7a42d1efcddd7ff1cd18b2f7a8fbdb95e6714b
$app->get('/add', 'app.controller:add')->setName('add');
$app->post('/add', 'app.controller:add');
=======
$app->get('/detail/{id}', 'app.controller:detail');
>>>>>>> Renaming the "product" page "detail"
=======
>>>>>>> commit before rebase
=======
$app->get('/detail/{id}', 'app.controller:detail');
>>>>>>> Renaming the "product" page "detail"
=======
$app->get('/detail/{id}', 'app.controller:detail');
>>>>>>> Renaming the "product" page "detail"
$app->get('/search', 'app.controller:search')->setname('search');
$app->post('/search', 'app.controller:search')->setname('search');
=======
$app->get('/search', 'app.controller:search')->setname('search');
>>>>>>> commit before rebase
