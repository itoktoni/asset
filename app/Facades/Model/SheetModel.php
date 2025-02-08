<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class SheetModel extends \App\Dao\Models\Sheet
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}