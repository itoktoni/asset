<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class OpnameModel extends \App\Dao\Models\Opname
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}