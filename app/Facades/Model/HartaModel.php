<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class HartaModel extends \App\Dao\Models\Harta
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}