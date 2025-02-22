<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\AssetEntity;
use App\Dao\Models\Core\SystemModel;
use App\Facades\Model\AssetModel;
use App\Facades\Model\DepartmentModel;
use App\Facades\Model\DistributorModel;
use App\Facades\Model\GroupModel;
use App\Facades\Model\JobModel;
use App\Facades\Model\LokasiModel;
use App\Facades\Model\ModelModel;
use App\Facades\Model\PenamaanModel;
use App\Facades\Model\VendorModel;
use Illuminate\Database\Eloquent\SoftDeletes;
use Wildside\Userstamps\Userstamps;
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
    protected $fillable = [
        'asset_id',
        'asset_nama',
        'asset_serial_number',
        'asset_code',
        'asset_status',
        'asset_gambar',
        'asset_id_penamaan',
        'asset_id_lokasi',
        'asset_id_model',
        'asset_id_department',
        'asset_id_vendor',
        'asset_id_group',
        'asset_id_kalibrasi',
        'asset_keterangan',
        'asset_created_at',
        'asset_updated_at',
        'asset_deleted_at',
        'asset_deleted_by',
        'asset_updated_by',
        'asset_created_by',
        'asset_harga_perolehan',
        'asset_tahun_pengadaan',
        'asset_tanggal_diakui',
        'asset_tanggal_kunjungan',
        'asset_next_kunjungan',
        'asset_status_kunjungan',
        'asset_tanggal_expired',
        'asset_next_expired',
        'asset_pendanaan',
        'asset_akl_akd',
        'asset_status_kalibrasi',
        'asset_status_maintenance',
        'asset_status_kepemilikan',
        'asset_cek_kalibrasi',
        'asset_cek_jadwal',

    ];

    public static function field_name()
    {
        return 'asset_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_penamaan()
    {
        return $this->hasOne(PenamaanModel::getModel(), PenamaanModel::field_primary(), $this->field_penamaan_id());
    }

    public function has_naming()
    {
        return $this->hasOne(PenamaanModel::getModel(), PenamaanModel::field_primary(), $this->field_penamaan_id());
    }

    public function has_location()
    {
        return $this->hasOne(LokasiModel::getModel(), LokasiModel::field_primary(), $this->field_location_id());
    }

    public function has_department()
    {
        return $this->hasOne(DepartmentModel::getModel(), DepartmentModel::field_primary(), $this->field_department_id());
    }

    public function has_model()
    {
        return $this->hasOne(ModelModel::getModel(), ModelModel::field_primary(), $this->field_model_id());
    }

    public function has_vendor()
    {
        return $this->hasOne(VendorModel::getModel(), VendorModel::field_primary(), $this->field_vendor_id());
    }

    public function has_kalibrasi()
    {
        return $this->hasOne(VendorModel::getModel(), VendorModel::field_primary(), $this->field_kalibrasi_id());
    }

    public function has_group()
    {
        return $this->hasOne(GroupModel::getModel(), GroupModel::field_primary(), $this->field_group_id());
    }

    public function has_job()
    {
        return $this->hasMany(JobModel::getModel(), JobModel::field_asset_id(), $this->field_primary());
    }

    public function rawQuery()
    {
        $query = $this
            ->select([$this->getTable().'.*', Penamaan::field_name(), Penamaan::field_nomenklatur(), Lokasi::field_name(), Model::field_name(), Brand::field_name(), Group::field_name()])
            ->leftJoinRelationship('has_naming')
            ->leftJoinRelationship('has_model')
            ->leftJoinRelationship('has_model.has_brand')
            ->leftJoinRelationship('has_group')
            ->leftJoinRelationship('has_location')
            ->sortable()
            ->filter();

        if(!empty(auth()->user()->lokasi))
        {
            $query = $query->where($this->field_location_id(), auth()->user()->lokasi);
        }

        return $query;
    }

    public function dataRepository()
    {
        $query = $this->rawQuery();

        if(request()->get('type') != 'report')
        {
            $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));
        }

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

            if(empty($model->{self::field_status_kalibrasi()}))
            {
                $model->{self::field_tanggal_expired()} = null;
                $model->{self::field_kalibrasi_id()} = null;
            }

            /*
             * set naming for gabungan
             */

            $name = '';

            if($model->has_naming)
            {
                $name = $model->has_naming->field_name;
            }

            if($model->has_model)
            {
                $type = $model->has_model;
                $brand = $type->has_brand;

                $name_model = $type->field_name;
                if($brand)
                {
                    $name_model = ' ( '.$brand->field_name.' ) '.$name_model;
                }

                $name = $name.' ~ '.$name_model;
            }

            if($model->asset_serial_number)
            {
                $name = $name.' | '. $model->asset_serial_number;
            }


            $model->{$model->field_name()} = $name;


            /*
             * set upload gambar
             */

            if (request()->has('images')) {
                $file_logo = request()->file('images');
                if($name = uploadImage($file_logo, 'asset'))
                {
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
