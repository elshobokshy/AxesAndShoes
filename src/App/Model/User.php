<?php

namespace App\Model;

use Cartalyst\Sentinel\Users\EloquentUser;

class User extends EloquentUser
{
    protected $table = 'user';

    protected $primaryKey = 'id';

    protected $fillable = [
        'username',
        'email',
        'password',
        'last_name',
        'first_name',
        'birthdate',
        'country',
        'city',
        'permissions',
    ];

    protected $loginNames = ['username', 'email'];

    public function product() {
        return $this->hasMany('Product');
    }
}
