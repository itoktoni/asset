<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\LokasiEntity;
use App\Dao\Models\Core\SystemModel;
use App\Facades\Model\AreaModel;
use App\Facades\Model\UserModel;

/**
 * Class Lokasi
 *
 * @property $lokasi_id
 * @property $lokasi_nama
 * @property $lokasi_gabungan
 * @property $lokasi_group
 * @property $lokasi_id_area
 * @property $lokasi_telp
 * @property $lokasi_pic
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Lokasi extends SystemModel
{
    use LokasiEntity;

    protected $perPage = 20;
    protected $table = 'lokasi';
    protected $primaryKey = 'lokasi_id';
    protected $with = ['has_user'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['lokasi_id', 'lokasi_nama', 'lokasi_gabungan', 'lokasi_keterangan', 'lokasi_id_area', 'lokasi_id_level3', 'lokasi_id_user'];

    public static function field_name()
    {
        return 'lokasi_gabungan';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_area()
    {
        return $this->hasOne(AreaModel::getModel(), AreaModel::field_primary(), $this->field_area_id());
    }

    public function has_user()
    {
        return $this->hasOne(UserModel::getModel(), UserModel::field_primary(), $this->field_user_id());
    }

    public function has_level()
    {
        return $this->hasOne(Level3::getModel(), Level3::field_primary(), $this->field_level_id());
    }

    public function dataRepository()
    {
        $query = $this
            ->addSelect(['lokasi.*', UserModel::field_name(), Level3::field_name()])
            ->leftJoinRelationship('has_user')
            ->leftJoinRelationship('has_level')
            ->sortable()
            ->filter();

        $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));

        return $query;
    }
}
