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

    public static function field_group()
    {
        return 'lokasi_group';
    }

    public function getFieldGroupAttribute()
    {
        return $this->{$this->field_group()};
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
}
