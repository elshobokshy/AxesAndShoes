<?php

namespace App\Model;

class Product extends Model
{
    protected $table = 'product';

    protected $primaryKey = 'id';

    protected $casts = [
        'pictures' => 'pictures',
    ];

    protected $config_pictures = [
        "pictures" => [
            "dir" => "/pictures/products/"
        ]];

    public function colors()
    {
        return $this->hasMany('Color', 'id', 'id')->orderBy('name', 'ASC');
    }

    public function materials()
    {
        return $this->hasMany('Material', 'id', 'id')->orderBy('name', 'ASC');
    }
}
