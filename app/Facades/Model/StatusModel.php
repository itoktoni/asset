<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class StatusModel extends \App\Dao\Models\Status
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}