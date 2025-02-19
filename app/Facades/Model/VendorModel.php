<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class VendorModel extends \App\Dao\Models\Vendor
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}