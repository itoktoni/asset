<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\AssetEntity;
use App\Dao\Models\Core\SystemModel;
use App\Facades\Model\AssetModel;
use App\Facades\Model\DepartmentModel;
use App\Facades\Model\LocationModel;
use App\Facades\Model\PenamaanModel;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;
use Illuminate\Support\Str;
use Plugins\Query;

/**
 * Class Asset
 *
 * @property $asset_id
 * @property $asset_nama
 * @property $asset_serial_number
 * @property $asset_internal_number
 * @property $asset_gambar
 * @property $asset_penamaan_id
 * @property $asset_location_id
 * @property $asset_department_id
 * @property $asset_price
 * @property $asset_keterangan
 * @property $asset_created_at
 * @property $asset_updated_at
 * @property $asset_deleted_at
 * @property $asset_deleted_by
 * @property $asset_updated_by
 * @property $asset_created_by
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Asset extends SystemModel
{
    use AssetEntity, Userstamps, SoftDeletes;

    protected $perPage = 20;
    protected $table = 'asset';
    protected $primaryKey = 'asset_id';

    protected $dates = [
        SELF::CREATED_AT,
        SELF::UPDATED_AT,
        SELF::DELETED_AT,
    ];

    const CREATED_AT = 'asset_created_at';
    const UPDATED_AT = 'asset_updated_at';
    const DELETED_AT = 'asset_deleted_at';

    const CREATED_BY = 'asset_created_by';
    const UPDATED_BY = 'asset_updated_by';
    const DELETED_BY = 'asset_deleted_by';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['asset_id', 'asset_nama', 'asset_serial_number', 'asset_code', 'asset_status', 'asset_gambar', 'asset_id_penamaan', 'asset_id_location', 'asset_id_department', 'asset_keterangan', 'asset_created_at', 'asset_updated_at', 'asset_deleted_at', 'asset_deleted_by', 'asset_updated_by', 'asset_created_by'];

    public static function field_name()
    {
        return 'asset_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_naming()
    {
        return $this->hasOne(PenamaanModel::getModel(), PenamaanModel::field_primary(), $this->field_penamaan_id());
    }

    public function has_location()
    {
        return $this->hasOne(LocationModel::getModel(), LocationModel::field_primary(), $this->field_location_id());
    }

    public function has_department()
    {
        return $this->hasOne(DepartmentModel::getModel(), DepartmentModel::field_primary(), $this->field_department_id());
    }

    public function dataRepository()
    {
        $query = $this
            ->addSelect([$this->getTable().'.*', Location::field_name(), Department::field_name()])
            ->leftJoinRelationship('has_location')
            ->leftJoinRelationship('has_department')
            ->sortable()
            ->filter();

        $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));

        return $query;
    }

    public static function boot()
    {
        parent::saving(function ($model)
        {
            if(empty($model->{self::field_code()}))
            {
                $model->{self::field_code()} = Query::autoNumber(AssetModel::getTableName(), self::field_code(), date('Ymd'));
            }

            /*
             * set naming for gabungan
             */

            $name = '';

            if($model->has_naming)
            {
                $name = $model->has_naming->field_name;
            }

            if($model->has_location)
            {
                $name = $name.' '.$model->has_location->field_name;
            }

            if($model->has_department)
            {
                $name = $name.' '.$model->has_department->field_name;
            }


            $model->{$model->field_name()} = $name;


            /*
             * set upload gambar
             */

            if (request()->has('images')) {
                $file_logo = request()->file('images');
                if(!empty($file_logo)){

                    $extension = $file_logo->extension();
                    $name = time().'.'.$extension;

                    $file_logo->storeAs('/public/files/asset/', $name);
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
