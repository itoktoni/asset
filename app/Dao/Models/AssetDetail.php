<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\AssetDetailEntity;
use App\Dao\Models\Core\SystemModel;

class AssetDetail extends SystemModel
{
    use AssetDetailEntity;

    protected $perPage = 20;

    protected $table = 'asset_detail';

    protected $primaryKey = 'asset_detail_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'asset_detail_id',
        'asset_detail_id_asset',
        'asset_detail_code',
        'asset_detail_nama',
        'asset_detail_keterangan',
        'asset_detail_start',
        'asset_detail_end',
        'asset_detail_waktu',
        'asset_detail_check',
        'asset_detail_banyak',
        'asset_detail_setiap',
    ];

    protected $casts = [
        'asset_detail_start' => 'date',
        'asset_detail_end' => 'date',
        'asset_detail_waktu' => 'datetime',
    ];

    public static function field_name()
    {
        return 'asset_detail_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_asset()
    {
        return $this->hasOne(Asset::getModel(), Asset::field_primary(), $this->field_asset_id());
    }

}
