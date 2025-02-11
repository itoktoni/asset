<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait JobEntity
{
    public static function field_code()
    {
        return 'job_code';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_status()
    {
        return 'job_status';
    }

    public function getFieldStatusAttribute()
    {
        return $this->{$this->field_status()};
    }

    public static function field_analisa()
    {
        return 'job_analisa';
    }

    public function getFieldAnalisaAttribute()
    {
        return $this->{$this->field_analisa()};
    }

    public static function field_kesimpulan()
    {
        return 'job_kesimpulan';
    }

    public function getFieldKesimpulanAttribute()
    {
        return $this->{$this->field_kesimpulan()};
    }

    public static function field_tanggal()
    {
        return 'job_tanggal';
    }

    public function getFieldTanggalAttribute()
    {
        return $this->{$this->field_tanggal()};
    }

    public static function field_type()
    {
        return 'job_type';
    }

    public function getFieldTypeAttribute()
    {
        return $this->{$this->field_type()};
    }

    public static function field_pelapor()
    {
        return 'job_pelapor';
    }

    public function getFieldPelaporAttribute()
    {
        return $this->{$this->field_pelapor()};
    }

    public static function field_job_id()
    {
        return 'job_job_id';
    }

    public function getFieldNamingAttribute()
    {
        return $this->{$this->field_job_id()};
    }

    public static function field_image()
    {
        return 'job_gambar';
    }

    public function getFieldImageAttribute()
    {
        return $this->{$this->field_image()};
    }

    public static function field_description()
    {
        return 'job_keterangan';
    }

    public function getFieldDescriptionAttribute()
    {
        return $this->{$this->field_description()};
    }

    public static function field_asset_id()
    {
        return 'job_id_asset';
    }

    public function getFieldAssetIdAttribute()
    {
        return $this->{$this->field_asset_id()};
    }

    public static function field_user_id()
    {
        return 'job_created_by';
    }

    public function getFieldUserIdAttribute()
    {
        return $this->{$this->field_user_id()};
    }

    public static function field_tiket_id()
    {
        return 'job_id_tiket';
    }

    public function getFieldTiketIdAttribute()
    {
        return $this->{$this->field_tiket_id()};
    }

    public static function field_location_id()
    {
        return 'job_id_location';
    }

    public function getFieldLocationIdAttribute()
    {
        return $this->{$this->field_location_id()};
    }

    public static function field_created_at()
    {
        return 'job_created_at';
    }

    public function getFieldCreatedAtAttribute()
    {
        return $this->{$this->field_created_at()};
    }

    public static function field_checked_at()
    {
        return 'job_checked_at';
    }

    public function getFieldCheckedAtAttribute()
    {
        return $this->{$this->field_checked_at()};
    }

    public function getFieldPickAtAttribute()
    {
        return $this->{$this->field_checked_at()};
    }

    public static function field_finished_at()
    {
        return 'job_finished_at';
    }

    public function getFieldFinishedAtAttribute()
    {
        return $this->{$this->field_finished_at()};
    }

    public static function field_saran_id()
    {
        return 'job_id_saran';
    }

    public function getFieldSaranIdAttribute()
    {
        return $this->{$this->field_saran_id()};
    }

    public static function field_assign_id()
    {
        return 'job_id_assign';
    }

    public function getFieldAssignIdAttribute()
    {
        return $this->{$this->field_assign_id()};
    }
}
