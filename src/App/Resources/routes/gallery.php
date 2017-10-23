<?php

$app->map(['GET', 'POST'], '/gallery', 'gallery.controller:gallery')->setName('gallery');