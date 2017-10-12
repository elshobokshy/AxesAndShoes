<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/profile', 'app.controller:profile')->setName('profile');
$app->get('/gallery', 'app.controller:gallery')->setName('gallery');

