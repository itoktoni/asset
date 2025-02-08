<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\JobEntity;
use App\Dao\Enums\JobStatusType;
use App\Dao\Models\Core\SystemModel;
use App\Facades\Model\AssetModel;
use App\Facades\Model\LocationModel;
use App\Facades\Model\SaranModel;
use App\Facades\Model\TiketModel;
use App\Facades\Model\UserModel;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Plugins\Query;
use Wildside\Userstamps\Userstamps;

/**
 * Class Job
 *
 * @property $job_id
 * @property $job_code
 * @property $job_id_tiket
 * @property $job_id_asset
 * @property $job_id_location
 * @property $job_keterangan
 * @property $job_status
 * @property $job_created_at
 * @property $job_updated_at
 * @property $job_deleted_at
 * @property $job_created_by
 * @property $job_updated_by
 * @property $job_deleted_by
 * @property $job_checked_at
 * @property $job_checked_by
 * @property $job_finished_at
 * @property $job_finished_by
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Job extends SystemModel
{
    use JobEntity , SoftDeletes, Userstamps;

    protected $perPage = 20;
    protected $table = 'job';
    protected $primaryKey = 'job_id';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['job_id', 'job_code', 'job_id_tiket', 'job_id_asset', 'job_id_location', 'job_keterangan', 'job_status', 'job_created_at', 'job_updated_at', 'job_deleted_at', 'job_created_by', 'job_updated_by', 'job_deleted_by', 'job_checked_at', 'job_finished_at',  'job_analisa', 'job_kesimpulan', 'job_id_saran', 'job_gambar'];

    protected $dates = [
        SELF::CREATED_AT,
        SELF::UPDATED_AT,
        SELF::DELETED_AT,
    ];

    const CREATED_AT = 'job_created_at';
    const UPDATED_AT = 'job_updated_at';
    const DELETED_AT = 'job_deleted_at';

    const CREATED_BY = 'job_created_by';
    const UPDATED_BY = 'job_updated_by';
    const DELETED_BY = 'job_deleted_by';

    public static function field_name()
    {
        return 'job_keterangan';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_location()
    {
        return $this->hasOne(LocationModel::getModel(), LocationModel::field_primary(), $this->field_location_id());
    }

    public function has_asset()
    {
        return $this->hasOne(AssetModel::getModel(), AssetModel::field_primary(), $this->field_user_id());
    }

    public function has_tiket()
    {
        return $this->hasOne(TiketModel::getModel(), TiketModel::field_primary(), $this->field_tiket_id());
    }

    public function has_saran()
    {
        return $this->hasOne(SaranModel::getModel(), SaranModel::field_primary(), $this->field_saran_id());
    }

    public function dataRepository()
    {
        $query = $this
            ->addSelect([$this->getTable().'.*',
                Location::field_name(),
                Tiket::field_primary(),
                Tiket::field_code(),
                Tiket::field_name(),
                Tiket::field_tanggal(),
            ])
            ->leftJoinRelationship('has_tiket')
            ->leftJoinRelationship('has_asset')
            ->leftJoinRelationship('has_location')
            ->sortable()
            ->filter();

        $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));

        return $query;
    }

    public static function boot()
    {
        parent::saving(function ($model)
        {
            if(request()->get($model->field_analisa()))
            {
                $model->{self::field_checked_at()} = date('Y-m-d H:i:s');
                $model->{self::field_status()} = JobStatusType::Proses;
            }

            if(empty($model->{self::field_code()}))
            {
                $model->{self::field_code()} = Query::autoNumber(Job::getTableName(), self::field_code(), 'S'.date('Ymd'));
            }

            /*
             * set upload gambar
             */

            if (request()->has('images')) {
                $file_logo = request()->file('images');
                if(!empty($file_logo)){

                    $extension = $file_logo->extension();
                    $name = time().'.'.$extension;

                    $file_logo->storeAs('/public/files/job/', $name);
                    $model->{self::field_image()} = $name;
                }
            }

        });

        parent::deleting(function ($model) {

            if(!empty($model->field_image) && file_exists(storage_path('app/public/files/job/'.$model->field_image))) {
                unlink(storage_path('app/public/files/job/'.$model->field_image));
            }

        });

        parent::boot();
    }
}
