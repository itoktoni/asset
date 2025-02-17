<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait LokasiEntity
{
    public static function field_gabungan()
    {
        return 'lokasi_gabungan';
    }

    public function getFieldGabunganAttribute()
    {
        return $this->{$this->field_gabungan()};
    }

    public static function field_description()
    {
        return 'lokasi_keterangan';
    }

    public function getFieldDescriptionAttribute()
    {
        return $this->{$this->field_description()};
    }

    public function getFieldNamingAttribute()
    {
        return $this->{$this->field_gabungan()};
    }

    public static function field_area_id()
    {
        return 'lokasi_id_area';
    }

    public function getFieldAreaIdAttribute()
    {
        return $this->{$this->field_area_id()};
    }

    public static function field_level_id()
    {
        return 'lokasi_id_level3';
    }

    public function getFieldLevelIdAttribute()
    {
        return $this->{$this->field_level_id()};
    }
}
