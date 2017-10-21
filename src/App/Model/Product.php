<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';

    protected $primaryKey = 'id';

    public function colors()
    {
        return $this->hasMany('Color', 'id', 'id')->orderBy('name', 'ASC');
    }

    public function materials()
    {
        return $this->hasMany('Material', 'id', 'id')->orderBy('name', 'ASC');
    }

    public function getToRent()
    {
        return Product::where('dateToRent', '<=', date('Y-m-d'))->orderBy('dateToRent','DESC');
    }

    public function getMinSize()
    {
        return Product::min('size');
    }

    public function getMaxSize()
    {
        return Product::max('size');
    }

    public function getMinPrice()
    {
        return Product::min('price');
    }

    public function getMaxPrice()
    {
        return Product::max('price');
    }
}
