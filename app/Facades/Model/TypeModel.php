<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class TypeModel extends \App\Dao\Models\Type
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}