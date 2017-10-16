<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Material extends Model
{
    protected $table = 'material';
    protected $primaryKey = 'id';

    protected $fillable = [
        'materialName'
    ];

    public $timestamps = false;

    public function products()
    {
        return $this->hasMany('Product', 'id', 'color_id');
    }
}