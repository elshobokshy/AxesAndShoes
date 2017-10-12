<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/product', 'app.controller:product');
