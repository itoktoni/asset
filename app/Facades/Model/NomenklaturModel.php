<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class NomenklaturModel extends \App\Dao\Models\Nomenklatur
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}