<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait MovementEntity
{
    public static function field_user_id()
    {
        return 'movement_created_by';
    }

    public function getFieldUserIdAttribute()
    {
        return $this->{$this->field_user_id()};
    }

    public static function field_asset_id()
    {
        return 'movement_id_asset';
    }

    public function getFieldAssetIdAttribute()
    {
        return $this->{$this->field_asset_id()};
    }

    public static function field_from_id()
    {
        return 'movement_id_from';
    }

    public function getFieldFromIdAttribute()
    {
        return $this->{$this->field_from_id()};
    }


    public static function field_to_id()
    {
        return 'movement_id_to';
    }

    public function getFieldToIdAttribute()
    {
        return $this->{$this->field_to_id()};
    }

    public static function field_approved_id()
    {
        return 'movement_approved_by';
    }

    public function getFieldApprovedIdAttribute()
    {
        return $this->{$this->field_approved_id()};
    }

    public static function field_code()
    {
        return 'movement_key';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_status()
    {
        return 'movement_status';
    }

    public function getFieldStatusAttribute()
    {
        return $this->{$this->field_status()};
    }

    public static function field_date()
    {
        return 'movement_date';
    }

    public function getFieldDateAttribute()
    {
        return $this->{$this->field_date()};
    }
}
