<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait OpnameEntity
{
    public static function field_user_id()
    {
        return 'opname_created_by';
    }

    public function getFieldUserIdAttribute()
    {
        return $this->{$this->field_user_id()};
    }

    public static function field_location_id()
    {
        return 'opname_id_lokasi';
    }

    public function getFieldLocationIdAttribute()
    {
        return $this->{$this->field_location_id()};
    }

    public static function field_code()
    {
        return 'opname_key';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_status()
    {
        return 'opname_status';
    }

    public function getFieldStatusAttribute()
    {
        return $this->{$this->field_status()};
    }

    public static function field_start_date()
    {
        return 'opname_mulai';
    }

    public function getFieldStartDateAttribute()
    {
        return $this->{$this->field_start_date()};
    }

    public static function field_end_date()
    {
        return 'opname_selesai';
    }

    public function getFieldEndDateAttribute()
    {
        return $this->{$this->field_end_date()};
    }

    public static function field_capture_date()
    {
        return 'opname_capture';
    }

    public function getFieldCaptureDateAttribute()
    {
        return $this->{$this->field_capture_date()};
    }
}
