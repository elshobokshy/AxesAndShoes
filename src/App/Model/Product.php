<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';
    

    protected $fillable = [
        'dateToRent',
        'title',
        'description',
        'size',
        'waterproof',
        'price',
        'material',
        'color',
        'image',
        'dateToRent',
        'user_id',
        'rented_by',
    ];

    public $timestamps = false;

    public function getImgUrl()
    {
        $array = json_decode($this->image);
        foreach ($array->img as $item) {
            $tmp[] = $item;
        }
        return $tmp;
    }

    public function getMainImg()
    {
        $a = $this->getImgUrl();
        return $a[0];
    }

    public function user() {
        return $this->belongsTo('User');
    }
    
    public static function getToRent()
    {
        return Product::where('dateToRent', '<=', date('Y-m-d'))->orderBy('dateToRent', 'DESC');
    }

    public static function getMinSize()
    {
        return Product::min('size');
    }

    public static function getMaxSize()
    {
        return Product::max('size');
    }

    public static function getMinPrice()
    {
        return Product::min('price');
    }

    public static function getMaxPrice()
    {
        return Product::max('price');
    }
}
