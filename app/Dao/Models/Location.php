<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Location
 *
 * @property $location_id
 * @property $location_name
 * @property $location_description
 * @property $location_building_id
 * @property $location_floor_id
 * @property $location_pic_user_id
 * @property $location_phone
 * @property $location_jenis_layanan
 * @property $location_location_category_id
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Location extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'location';
    protected $primaryKey = 'location_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['location_id', 'location_nama', 'location_keterangan'];

    public static function field_name()
    {
        return 'location_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
