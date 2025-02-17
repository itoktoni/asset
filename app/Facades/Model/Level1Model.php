<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class Level1Model extends \App\Dao\Models\Level1
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}