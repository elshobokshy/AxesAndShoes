<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $table = 'product';

    protected $primaryKey = 'id';

    protected $fillable = [
        'title',
        'description',
        'size',
        'waterproof',
        'price',
        'material',
        'color',
        'image',
    ];

    public $timestamps = false;

    public function getImgUrl() {
        $array = json_decode($this->image);
        foreach ($array->img as $item) {
            $tmp[] = $item;
        }
        return $tmp;
    }
}
