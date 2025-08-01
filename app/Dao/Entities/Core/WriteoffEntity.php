<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait WriteoffEntity
{
    public static function field_user_id()
    {
        return 'writeoff_created_by';
    }

    public function getFieldUserIdAttribute()
    {
        return $this->{$this->field_user_id()};
    }

    public static function field_asset_id()
    {
        return 'writeoff_id_asset';
    }

    public function getFieldAssetIdAttribute()
    {
        return $this->{$this->field_asset_id()};
    }

    public static function field_location_id()
    {
        return 'writeoff_id_lokasi';
    }

    public function getFieldLocationIdAttribute()
    {
        return $this->{$this->field_location_id()};
    }

    public static function field_approved_id()
    {
        return 'writeoff_approved_by';
    }

    public function getFieldApprovedIdAttribute()
    {
        return $this->{$this->field_approved_id()};
    }

    public static function field_code()
    {
        return 'writeoff_key';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_status()
    {
        return 'writeoff_status';
    }

    public function getFieldStatusAttribute()
    {
        return $this->{$this->field_status()};
    }

    public static function field_date()
    {
        return 'writeoff_date';
    }

    public function getFieldDateAttribute()
    {
        return $this->{$this->field_date()};
    }
}
