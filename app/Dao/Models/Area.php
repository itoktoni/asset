<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Area
 *
 * @property $area_id
 * @property $area_nama
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Area extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'area';
    protected $primaryKey = 'area_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['area_id', 'area_nama'];

    public static function field_name()
    {
        return 'area_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
