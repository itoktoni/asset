<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;
use Telegram\Bot\Objects\Location;

class OpnameDetail extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'opname_detail';
    protected $primaryKey = 'opname_detail_id';

    public $timestamps = true;

    protected $dates = [
        SELF::CREATED_AT,
        SELF::UPDATED_AT,
    ];

    const CREATED_AT = 'opname_detail_created_at';
    const UPDATED_AT = 'opname_detail_updated_at';
    const CREATED_BY = 'opname_detail_created_by';
    const UPDATED_BY = 'opname_detail_updated_by';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['opname_detail_id', 'opname_detail_key', 'opname_detail_id_scan' ,'opname_detail_id_opname', 'opname_detail_mulai', 'opname_detail_selesai', 'opname_detail_nama', 'opname_detail_id_lokasi', 'opname_detail_created_at', 'opname_detail_created_by', 'opname_detail_updated_at', 'opname_detail_updated_by', 'opname_detail_status', 'opname_detail_capture'];

    public static function field_name()
    {
        return 'opname_detail_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function fieldSearching()
    {
        return $this->field_name();
    }

    public static function field_opname_id()
    {
        return 'opname_detail_id_opname';
    }

    public function getFieldOpnameIdAttribute()
    {
        return $this->{$this->field_opname_id()};
    }

    public static function field_location_id()
    {
        return 'opname_detail_id_ruangan';
    }

    public function getFieldLocationIdAttribute()
    {
        return $this->{$this->field_location_id()};
    }

    public static function field_scan_id()
    {
        return 'opname_detail_id_scan';
    }

    public function getFieldScanIdAttribute()
    {
        return $this->{$this->field_scan_id()};
    }

    public static function field_key()
    {
        return 'opname_detail_key';
    }

    public function getFieldKeyAttribute()
    {
        return $this->{$this->field_key()};
    }

    public static function field_code()
    {
        return 'opname_detail_code';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_waktu()
    {
        return 'opname_detail_waktu';
    }

    public function getFieldWaktuAttribute()
    {
        return $this->{$this->field_waktu()};
    }

    public static function field_ketemu()
    {
        return 'opname_detail_ketemu';
    }

    public function getFieldKetemuAttribute()
    {
        return $this->{$this->field_ketemu()};
    }

    public function has_asset()
    {
        return $this->hasOne(Asset::getModel(), Asset::field_primary(), $this->field_code());
    }

    public function has_location()
    {
        return $this->hasOne(Lokasi::getModel(), Lokasi::field_primary(), $this->field_location_id());
    }

    public function has_scan()
    {
        return $this->hasOne(Lokasi::getModel(), Lokasi::field_primary(), $this->field_scan_id());
    }
}
