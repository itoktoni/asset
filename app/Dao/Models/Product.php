<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Product
 *
 * @property $product_id
 * @property $product_name
 * @property $product_serial_number
 * @property $product_internal_number
 * @property $product_image
 * @property $product_category_id
 * @property $product_type_id
 * @property $product_brand_id
 * @property $product_unit_code
 * @property $product_location_id
 * @property $product_department_id
 * @property $product_supplier_id
 * @property $product_price
 * @property $product_is_asset
 * @property $product_description
 * @property $product_acqu_year
 * @property $product_prod_year
 * @property $product_buy_date
 * @property $product_created_at
 * @property $product_updated_at
 * @property $product_deleted_at
 * @property $product_deleted_by
 * @property $product_updated_by
 * @property $product_created_by
 * @property $product_vendor_id
 * @property $product_teknisi_data
 * @property $product_model_id
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Product extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'product';
    protected $primaryKey = 'product_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['product_id', 'product_name', 'product_serial_number', 'product_internal_number', 'product_image', 'product_category_id', 'product_type_id', 'product_brand_id', 'product_unit_code', 'product_location_id', 'product_department_id', 'product_supplier_id', 'product_price', 'product_is_asset', 'product_description', 'product_acqu_year', 'product_prod_year', 'product_buy_date', 'product_created_at', 'product_updated_at', 'product_deleted_at', 'product_deleted_by', 'product_updated_by', 'product_created_by', 'product_vendor_id', 'product_teknisi_data', 'product_model_id'];

    public static function field_name()
    {
        return 'product_name';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

}
