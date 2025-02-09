<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class AreaModel extends \App\Dao\Models\Area
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}