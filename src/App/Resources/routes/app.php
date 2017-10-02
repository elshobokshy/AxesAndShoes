<?php

$app->get('/', 'app.controller:home')->setName('home');
$app->get('/test', 'app.controller:test');
