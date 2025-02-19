<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait PenamaanEntity
{
    public static function field_gabungan()
    {
        return 'penamaan_gabungan';
    }

    public function getFieldGabunganAttribute()
    {
        return $this->{$this->field_gabungan()};
    }

    public function getFieldNamingAttribute()
    {
        return $this->{$this->field_gabungan()};
    }

    public static function field_image()
    {
        return 'penamaan_gambar';
    }

    public function getFieldImageAttribute()
    {
        return $this->{$this->field_image()};
    }

    public static function field_brand_id()
    {
        return 'penamaan_id_brand';
    }

    public function getFieldBrandIdAttribute()
    {
        return $this->{$this->field_brand_id()};
    }

    public static function field_category_id()
    {
        return 'penamaan_id_category';
    }

    public function getFieldCategoryIdAttribute()
    {
        return $this->{$this->field_category_id()};
    }

    public static function field_satuan_id()
    {
        return 'penamaan_id_satuan';
    }

    public function getFieldSatuanIdAttribute()
    {
        return $this->{$this->field_satuan_id()};
    }

    public static function field_nomenklatur()
    {
        return 'penamaan_code_nomenklatur';
    }

    public function getFieldNomenklaturAttribute()
    {
        return $this->{$this->field_nomenklatur()};
    }

    public static function field_angka_fungsi()
    {
        return 'penamaan_angka_fungsi';
    }

    public function getFieldAngkaFungsiAttribute()
    {
        return $this->{$this->field_angka_fungsi()};
    }

    public static function field_angka_aplikasi()
    {
        return 'penamaan_angka_aplikasi';
    }

    public function getFieldAngkaAplikasiAttribute()
    {
        return $this->{$this->field_angka_aplikasi()};
    }

    public static function field_angka_maintenance()
    {
        return 'penamaan_angka_maintenance';
    }

    public function getFieldAngkaMaintenanceAttribute()
    {
        return $this->{$this->field_angka_maintenance()};
    }
}
