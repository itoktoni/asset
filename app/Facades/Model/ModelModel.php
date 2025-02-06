<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class ModelModel extends \App\Dao\Models\Model
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}