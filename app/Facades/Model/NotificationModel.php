<?php

namespace App\Facades\Model;

use Illuminate\Support\Facades\Facade;

class NotificationModel extends \App\Dao\Models\Notification
{
    protected static function getFacadeAccessor()
    {
        return getClass(__CLASS__);
    }
}