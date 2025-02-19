<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\PenamaanEntity;
use App\Dao\Models\Core\SystemModel;
use App\Facades\Model\BrandModel;
use App\Facades\Model\CategoryModel;
use App\Facades\Model\ModelModel;
use App\Facades\Model\NomenklaturModel;
use Illuminate\Support\Str;

/**
 * Class Penamaan
 *
 * @property $penamaan_id
 * @property $penamaan_nama
 * @property $penamaan_image
 * @property $penamaan_type_id
 * @property $penamaan_brand_id
 * @property $penamaan_unit_id
 * @property $penamaan_category_id
 * @property $penamaan_tech
 * @property $penamaan_description
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Penamaan extends SystemModel
{
    use PenamaanEntity;

    protected $perPage = 20;
    protected $table = 'penamaan';
    protected $primaryKey = 'penamaan_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'penamaan_id',
        'penamaan_nama',
        'penamaan_gambar',
        'penamaan_id_satuan',
        'penamaan_id_category',
        'penamaan_code_nomenklatur',
        'penamaan_tech',
        'penamaan_keterangan',
        'penamaan_angka_fungsi',
        'penamaan_angka_aplikasi',
        'penamaan_angka_maintenance',
    ];

    public static function field_name()
    {
        return 'penamaan_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_category()
    {
        return $this->hasOne(CategoryModel::getModel(), CategoryModel::field_primary(), $this->field_category_id());
    }

    public function dataRepository()
    {
        $query = $this
            ->addSelect(['penamaan.*', Category::field_name()])
            ->leftJoinRelationship('has_category')
            ->sortable()
            ->filter();

        $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));

        return $query;
    }

    public static function boot()
    {
        parent::saving(function ($model)
        {
            if (request()->has('images')) {
                $file_logo = request()->file('images');
                if(!empty($file_logo)){
                    $extension = $file_logo->extension();
                    $name = time().'.'.$extension;

                    $file_logo->storeAs('/public/files/penamaan/', $name);
                    $model->{self::field_image()} = $name;
                }
            }
        });

        parent::deleting(function ($model) {

            if(!empty($model->field_image) && file_exists(storage_path('app/public/files/tiket/'.$model->field_image))) {
                unlink(storage_path('app/public/files/tiket/'.$model->field_image));
            }

        });

        parent::boot();
    }
}
