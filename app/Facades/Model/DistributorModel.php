<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class DistributorModel extends \App\Dao\Models\Distributor
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}