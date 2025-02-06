<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Type
 *
 * @property $type_id
 * @property $type_name
 * @property $type_description
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Type extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'type';
    protected $primaryKey = 'type_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['type_id', 'type_name', 'type_description'];

    public static function field_name()
    {
        return 'type_name';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
