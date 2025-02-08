<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class SaranModel extends \App\Dao\Models\Saran
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}