<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class LocationModel extends \App\Dao\Models\Location
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}