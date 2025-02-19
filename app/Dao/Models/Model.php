<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;
use App\Facades\Model\BrandModel;

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
    protected $fillable = ['model_id', 'model_nama', 'model_id_brand'];

    public static function field_name()
    {
        return 'model_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public static function field_brand_id()
    {
        return 'model_id_brand';
    }

    public function getFieldBrandIdAttribute()
    {
        return $this->{$this->field_id_brand()};
    }

    public function has_brand()
    {
        return $this->hasOne(Brand::getModel(), Brand::field_primary(), $this->field_brand_id());
    }

    public function dataRepository()
    {
        $query = $this
            ->addSelect([self::getModel()->getTable().'.*', BrandModel::field_name()])
            ->leftJoinRelationship('has_brand')
            ->sortable()
            ->filter();

        $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));

        return $query;
    }

}
