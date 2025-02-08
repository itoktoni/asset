<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Model
 *
 * @property $model_id
 * @property $model_nama
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Model extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'model';
    protected $primaryKey = 'model_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['model_id', 'model_nama'];

    public static function field_name()
    {
        return 'model_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
