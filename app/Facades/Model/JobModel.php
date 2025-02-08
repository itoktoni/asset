<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class JobModel extends \App\Dao\Models\Job
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}