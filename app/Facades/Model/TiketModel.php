<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class TiketModel extends \App\Dao\Models\Tiket
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}