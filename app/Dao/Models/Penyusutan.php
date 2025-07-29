<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;
use App\Facades\Model\AssetModel;

/**
 * Class Harta
 *
 * @property $penyusutan_id
 * @property $penyusutan_nilai
 * @property $penyusutan_tanggal
 * @property $penyusutan_asset_id
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Penyusutan extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'penyusutan';
    protected $primaryKey = 'penyusutan_id';

    protected $casts = [
        'penyusutan_tanggal' => 'date',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['penyusutan_id', 'penyusutan_tanggal', 'penyusutan_nilai', 'penyusutan_asset_id'];

    public static function field_name()
    {
        return 'penyusutan_tanggal';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public static function field_asset_id()
    {
        return 'penyusutan_asset_id';
    }

    public function getFieldAssetIdAttribute()
    {
        return $this->{$this->field_asset_id()};
    }

    public static function field_value()
    {
        return 'penyusutan_nilai';
    }

    public function getFieldValueAttribute()
    {
        return $this->{$this->field_value()};
    }

    public function fieldSearching()
    {
        return $this->field_name();
    }

    public function has_asset()
    {
        return $this->hasOne(AssetModel::getModel(), AssetModel::field_primary(), $this->field_asset_id());
    }
}