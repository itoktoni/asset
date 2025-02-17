<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class Level2Model extends \App\Dao\Models\Level2
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}