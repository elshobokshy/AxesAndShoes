<?php
/**
 * Created by PhpStorm.
 * User: mathias
 * Date: 09/10/17
 * Time: 16:26
 */

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Color extends Model{

    protected $table = 'color';
    protected $primaryKey = 'id';
    public $timestamps = false;


}