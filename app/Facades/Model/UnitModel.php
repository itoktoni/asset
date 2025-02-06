<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class UnitModel extends \App\Dao\Models\Unit
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}