<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class BrandModel extends \App\Dao\Models\Brand
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}