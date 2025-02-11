<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait NotificationEntity
{
    public static function field_address()
    {
        return 'notification_alamat';
    }

    public function getFieldAddressAttribute()
    {
        return $this->{$this->field_address()};
    }

    public static function field_message()
    {
        return 'notification_pesan';
    }

    public function getFieldMessageAttribute()
    {
        return $this->{$this->field_message()};
    }

    public static function field_status()
    {
        return 'notification_status';
    }

    public function getFieldStatusAttribute()
    {
        return $this->{$this->field_status()};
    }
}
