<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait AssetDetailEntity
{
    public static function field_banyak()
    {
        return 'asset_detail_banyak';
    }

    public function getFieldBanyakAttribute()
    {
        return $this->{$this->field_banyak()};
    }

    public static function field_asset_id()
    {
        return 'asset_detail_id_asset';
    }

    public function getFieldAssetIdAttribute()
    {
        return $this->{$this->field_asset_id()};
    }

    public static function field_setiap()
    {
        return 'asset_detail_setiap';
    }

    public function getFieldSetiapAttribute()
    {
        return $this->{$this->field_setiap()};
    }

    public static function field_code()
    {
        return 'asset_detail_code';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_start()
    {
        return 'asset_detail_start';
    }

    public function getFieldStartAttribute()
    {
        return $this->{$this->field_start()};
    }

    public static function field_end()
    {
        return 'asset_detail_end';
    }

    public function getFieldEndAttribute()
    {
        return $this->{$this->field_end()};
    }

    public static function field_waktu()
    {
        return 'asset_detail_waktu';
    }

    public function getFieldWaktuAttribute()
    {
        return $this->{$this->field_waktu()};
    }

    public static function field_check()
    {
        return 'asset_detail_check';
    }

    public function getFieldCheckAttribute()
    {
        return $this->{$this->field_check()};
    }

    public static function field_description()
    {
        return 'asset_detail_keterangan';
    }

    public function getFieldDescriptionAttribute()
    {
        return $this->{$this->field_description()};
    }
}
