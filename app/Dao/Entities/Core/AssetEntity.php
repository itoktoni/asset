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

    public static function field_serial_number()
    {
        return 'asset_serial_number';
    }

    public function getFieldSerialNumberAttribute()
    {
        return $this->{$this->field_serial_number()};
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

    public static function field_vendor_id()
    {
        return 'asset_id_vendor';
    }

    public function getFieldVendorIdAttribute()
    {
        return $this->{$this->field_vendor_id()};
    }

    public static function field_kalibrasi_id()
    {
        return 'asset_id_kalibrasi';
    }

    public function getFieldKalibrasiIdAttribute()
    {
        return $this->{$this->field_kalibrasi_id()};
    }

    public static function field_group_id()
    {
        return 'asset_id_group';
    }

    public function getFieldGroupIdAttribute()
    {
        return $this->{$this->field_group_id()};
    }

    public static function field_location_id()
    {
        return 'asset_id_lokasi';
    }

    public function getFieldLocationIdAttribute()
    {
        return $this->{$this->field_location_id()};
    }

    public static function field_tanggal_kunjungan()
    {
        return 'asset_tanggal_kunjungan';
    }

    public function getFieldTanggalKunjunganAttribute()
    {
        return $this->{$this->field_tanggal_kunjungan()};
    }

    public static function field_tanggal_kalibrasi()
    {
        return 'asset_tanggal_kalibrasi';
    }

    public function getFieldTanggalKalibrasiAttribute()
    {
        return $this->{$this->field_tanggal_kalibrasi()};
    }

    public static function field_status_kunjungan()
    {
        return 'asset_status_kunjungan';
    }

    public function getFieldStatusKunjunganAttribute()
    {
        return $this->{$this->field_status_kunjungan()};
    }

    public static function field_tanggal_diakui()
    {
        return 'asset_tanggal_diakui';
    }

    public function getFieldTanggalDiakuiAttribute()
    {
        return $this->{$this->field_tanggal_diakui()};
    }

    public static function field_pendanaan()
    {
        return 'asset_pendanaan';
    }

    public function getFieldPendanaanAttribute()
    {
        return $this->{$this->field_pendanaan()};
    }

    public static function field_akl_akd()
    {
        return 'asset_akl_akd';
    }

    public function getFieldAklAkdAttribute()
    {
        return $this->{$this->field_akl_akd()};
    }

    public static function field_harga()
    {
        return 'asset_harga_perolehan';
    }

    public function getFieldHargaAttribute()
    {
        return $this->{$this->field_harga()};
    }

    public static function field_model_id()
    {
        return 'asset_id_model';
    }

    public function getFieldModelIdAttribute()
    {
        return $this->{$this->field_model_id()};
    }

    public static function field_status_kalibrasi()
    {
        return 'asset_status_kalibrasi';
    }

    public function getFieldStatusKalibrasiAttribute()
    {
        return $this->{$this->field_status_kalibrasi()};
    }

    public static function field_status_kepemilikan()
    {
        return 'asset_status_kepemilikan';
    }

    public function getFieldStatusKepemilikanAttribute()
    {
        return $this->{$this->field_status_kepemilikan()};
    }

    public static function field_status_maintenance()
    {
        return 'asset_status_maintenance';
    }

    public function getFieldStatusMaintenanceAttribute()
    {
        return $this->{$this->field_status_maintenance()};
    }

    public static function field_cek_kalibrasi()
    {
        return 'asset_cek_kalibrasi';
    }

    public function getFieldCekKalibrasiAttribute()
    {
        return $this->{$this->field_cek_kalibrasi()};
    }

    public static function field_cek_jadwal()
    {
        return 'asset_cek_jadwal';
    }

    public function getFieldCekJadwalAttribute()
    {
        return $this->{$this->field_cek_jadwal()};
    }
}
