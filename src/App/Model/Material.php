<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Material extends Model
{
    protected $table = 'material';
    protected $primaryKey = 'id';
    public $timestamps = false;

    public function products()
    {
        return $this->hasMany('Product', 'id', 'color_id');
    }
}