<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait SheetEntity
{
    public static function field_code()
    {
        return 'sheet_code';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_status()
    {
        return 'sheet_status';
    }

    public function getFieldStatusAttribute()
    {
        return $this->{$this->field_status()};
    }

    public static function field_analisa()
    {
        return 'sheet_analisa';
    }

    public function getFieldAnalisaAttribute()
    {
        return $this->{$this->field_analisa()};
    }

    public static function field_kesimpulan()
    {
        return 'sheet_kesimpulan';
    }

    public function getFieldKesimpulanAttribute()
    {
        return $this->{$this->field_kesimpulan()};
    }

    public static function field_tanggal()
    {
        return 'sheet_tanggal';
    }

    public function getFieldTanggalAttribute()
    {
        return $this->{$this->field_tanggal()};
    }

    public static function field_type()
    {
        return 'sheet_type';
    }

    public function getFieldTypeAttribute()
    {
        return $this->{$this->field_type()};
    }

    public static function field_pelapor()
    {
        return 'sheet_pelapor';
    }

    public function getFieldPelaporAttribute()
    {
        return $this->{$this->field_pelapor()};
    }

    public static function field_sheet_id()
    {
        return 'sheet_sheet_id';
    }

    public function getFieldNamingAttribute()
    {
        return $this->{$this->field_sheet_id()};
    }

    public static function field_image()
    {
        return 'sheet_gambar';
    }

    public function getFieldImageAttribute()
    {
        return $this->{$this->field_image()};
    }

    public static function field_description()
    {
        return 'sheet_keterangan';
    }

    public function getFieldDescriptionAttribute()
    {
        return $this->{$this->field_description()};
    }

    public static function field_asset_id()
    {
        return 'sheet_id_asset';
    }

    public function getFieldAssetIdAttribute()
    {
        return $this->{$this->field_asset_id()};
    }

    public static function field_user_id()
    {
        return 'sheet_created_by';
    }

    public function getFieldUserIdAttribute()
    {
        return $this->{$this->field_user_id()};
    }

    public static function field_tiket_id()
    {
        return 'sheet_id_tiket';
    }

    public function getFieldTiketIdAttribute()
    {
        return $this->{$this->field_tiket_id()};
    }

    public static function field_location_id()
    {
        return 'sheet_id_location';
    }

    public function getFieldLocationIdAttribute()
    {
        return $this->{$this->field_location_id()};
    }
}
