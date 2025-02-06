<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Unit
 *
 * @property $unit_code
 * @property $unit_name
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Unit extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'unit';
    protected $primaryKey = 'unit_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['unit_code', 'unit_name'];

    public static function field_name()
    {
        return 'unit_name';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
