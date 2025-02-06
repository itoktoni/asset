<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class ProductModel extends \App\Dao\Models\Product
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}