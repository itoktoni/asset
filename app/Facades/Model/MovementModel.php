<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class MovementModel extends \App\Dao\Models\Movement
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}