<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Model
 *
 * @property $model_id
 * @property $model_group
 * @property $model_code
 * @property $model_name
 * @property $model_image
 * @property $model_type_id
 * @property $model_brand_id
 * @property $model_unit_id
 * @property $model_category_id
 * @property $model_tech
 * @property $model_description
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
    protected $fillable = ['model_id', 'model_group', 'model_code', 'model_name', 'model_image', 'model_type_id', 'model_brand_id', 'model_unit_id', 'model_category_id', 'model_tech', 'model_description'];

    public static function field_name()
    {
        return 'model_name';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
