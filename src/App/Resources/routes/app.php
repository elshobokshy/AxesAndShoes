<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/product/{id}', 'app.controller:product');
