<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class DepartmentModel extends \App\Dao\Models\Department
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}