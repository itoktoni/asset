<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Brand
 *
 * @property $brand_id
 * @property $brand_name
 * @property $brand_description
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Brand extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'brand';
    protected $primaryKey = 'brand_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['brand_id', 'brand_name', 'brand_description'];


}
