<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class Level3Model extends \App\Dao\Models\Level3
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}