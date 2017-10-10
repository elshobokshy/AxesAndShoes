<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/profile', 'app.controller:profile')->setName('profile');

