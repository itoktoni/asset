<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait TiketEntity
{
    public static function field_code()
    {
        return 'tiket_code';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_status()
    {
        return 'tiket_status';
    }

    public function getFieldStatusAttribute()
    {
        return $this->{$this->field_status()};
    }

    public static function field_tanggal()
    {
        return 'tiket_tanggal';
    }

    public function getFieldTanggalAttribute()
    {
        return $this->{$this->field_tanggal()};
    }

    public static function field_type()
    {
        return 'tiket_type';
    }

    public function getFieldTypeAttribute()
    {
        return $this->{$this->field_type()};
    }

    public static function field_pelapor()
    {
        return 'tiket_pelapor';
    }

    public function getFieldPelaporAttribute()
    {
        return $this->{$this->field_pelapor()};
    }

    public static function field_tiket_id()
    {
        return 'tiket_tiket_id';
    }

    public function getFieldNamingAttribute()
    {
        return $this->{$this->field_tiket_id()};
    }

    public static function field_image()
    {
        return 'tiket_gambar';
    }

    public function getFieldImageAttribute()
    {
        return $this->{$this->field_image()};
    }

    public static function field_description()
    {
        return 'tiket_keterangan';
    }

    public function getFieldDescriptionAttribute()
    {
        return $this->{$this->field_description()};
    }

    public static function field_asset_id()
    {
        return 'tiket_id_asset';
    }

    public function getFieldAssetIdAttribute()
    {
        return $this->{$this->field_asset_id()};
    }

    public static function field_user_id()
    {
        return 'tiket_created_by';
    }

    public function getFieldUserIdAttribute()
    {
        return $this->{$this->field_user_id()};
    }

    public static function field_category_id()
    {
        return 'tiket_id_category';
    }

    public function getFieldCategoryIdAttribute()
    {
        return $this->{$this->field_category_id()};
    }

    public static function field_location_id()
    {
        return 'tiket_id_location';
    }

    public function getFieldLocationIdAttribute()
    {
        return $this->{$this->field_location_id()};
    }

    public static function field_user()
    {
        return 'tiket_taked_by';
    }

    public function getFieldUserAttribute()
    {
        return $this->{$this->field_user()};
    }
}
