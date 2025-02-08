<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class PenamaanModel extends \App\Dao\Models\Penamaan
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}