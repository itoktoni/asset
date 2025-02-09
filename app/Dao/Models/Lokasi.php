<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\LokasiEntity;
use App\Dao\Models\Core\SystemModel;
use App\Facades\Model\AreaModel;

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

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['lokasi_id', 'lokasi_nama', 'lokasi_gabungan', 'lokasi_group', 'lokasi_id_area', 'lokasi_telp', 'lokasi_pic'];

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

    public function dataRepository()
    {
        $query = $this
            ->addSelect(['lokasi.*', Area::field_name()])
            ->leftJoinRelationship('has_area')
            ->sortable()
            ->filter();

        $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));

        return $query;
    }
}
