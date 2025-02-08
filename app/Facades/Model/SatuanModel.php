<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class SatuanModel extends \App\Dao\Models\Satuan
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}