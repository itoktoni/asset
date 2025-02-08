<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait AssetEntity
{
    public static function field_code()
    {
        return 'asset_code';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_status()
    {
        return 'asset_status';
    }

    public function getFieldStatusAttribute()
    {
        return $this->{$this->field_status()};
    }

    public static function field_naming()
    {
        return self::field_penamaan_id();
    }

    public function getFieldNamingAttribute()
    {
        return $this->{$this->field_naming()};
    }

    public static function field_image()
    {
        return 'asset_gambar';
    }

    public function getFieldImageAttribute()
    {
        return $this->{$this->field_image()};
    }

    public static function field_penamaan_id()
    {
        return 'asset_id_penamaan';
    }

    public function getFieldPenamaanIdAttribute()
    {
        return $this->{$this->field_penamaan_id()};
    }

    public static function field_department_id()
    {
        return 'asset_id_department';
    }

    public function getFieldDepartmentIdAttribute()
    {
        return $this->{$this->field_department_id()};
    }

    public static function field_location_id()
    {
        return 'asset_id_location';
    }

    public function getFieldLocationIdAttribute()
    {
        return $this->{$this->field_location_id()};
    }
}
