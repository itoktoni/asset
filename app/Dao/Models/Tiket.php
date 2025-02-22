<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\TiketEntity;
use App\Dao\Enums\Core\LevelType;
use App\Dao\Enums\JobType;
use App\Dao\Enums\TiketType;
use App\Dao\Models\Core\SystemModel;
use App\Events\CreateTiketEvent;
use App\Facades\Model\AssetModel;
use App\Facades\Model\JobModel;
use App\Facades\Model\LokasiModel;
use App\Facades\Model\UserModel;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;
use Plugins\Query;
use Wildside\Userstamps\Userstamps;
use Illuminate\Support\Str;
use Intervention\Image\Laravel\Facades\Image;

/**
 * Class Tiket
 *
 * @property $tiket_id
 * @property $tiket_code
 * @property $tiket_type
 * @property $tiket_nama
 * @property $tiket_keterangan
 * @property $tiket_gambar
 * @property $tiket_tanggal
 * @property $tiket_pelapor
 * @property $tiket_id_location
 * @property $tiket_id_category
 * @property $tiket_id_asset
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Tiket extends SystemModel
{
    use TiketEntity, SoftDeletes, Userstamps;

    protected $perPage = 20;
    protected $table = 'tiket';
    protected $primaryKey = 'tiket_id';

    public $timestamps = true;

    protected $dates = [
        SELF::CREATED_AT,
        SELF::UPDATED_AT,
        SELF::DELETED_AT,
    ];

    const CREATED_AT = 'tiket_created_at';
    const UPDATED_AT = 'tiket_updated_at';
    const DELETED_AT = 'tiket_deleted_at';

    const CREATED_BY = 'tiket_created_by';
    const UPDATED_BY = 'tiket_updated_by';
    const DELETED_BY = 'tiket_deleted_by';


    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['tiket_id', 'tiket_code', 'tiket_type', 'tiket_nama', 'tiket_keterangan', 'tiket_gambar', 'tiket_tanggal', 'tiket_pelapor', 'tiket_id_location', 'tiket_id_category', 'tiket_id_asset', 'tiket_taked_by', 'tiket_created_by', 'tiket_updated_by'];

    public static function field_name()
    {
        return 'tiket_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_location()
    {
        return $this->hasOne(LokasiModel::getModel(), LokasiModel::field_primary(), $this->field_location_id());
    }

    public function has_asset()
    {
        return $this->hasOne(AssetModel::getModel(), AssetModel::field_primary(), $this->field_asset_id());
    }

    public function has_pelapor()
    {
        return $this->hasOne(UserModel::getModel(), UserModel::field_primary(), $this->field_user_id());
    }

    public function has_job()
    {
        return $this->hasMany(JobModel::getModel(), JobModel::field_tiket_id(), $this->field_primary());
    }

    public function dataRepository()
    {
        $query = $this
            ->addSelect([$this->getTable().'.*', Asset::field_name(), Lokasi::field_name(), Job::field_status(), Job::field_primary(), Job::field_analisa(), Job::field_kesimpulan()])
            ->leftJoinRelationship('has_asset')
            ->leftJoinRelationship('has_location')
            ->leftJoinRelationship('has_job')
            ->groupBy($this->field_primary())
            ->orderBy(Tiket::CREATED_AT, 'DESC')
            ->sortable()
            ->filter();

        if(!empty(auth()->user()->level == LevelType::Operator))
        {
            $query = $query->where($this->field_user(), auth()->user->id);
        }

        $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));

        return $query;
    }

    public static function boot()
    {
        parent::boot();
        parent::creating(function ($model)
        {
            $model->{self::field_tanggal()} = date('Y-m-d');
            if(empty($model->{self::field_type()}))
            {
                $model->{self::field_type()} = JobType::Korektif;
            }
        });

        self::created(function($model)
        {
            event(new CreateTiketEvent($model));
        });

        parent::saving(function ($model)
        {
            if(empty($model->{self::field_code()}))
            {
                // $model->{self::field_code()} = Query::autoNumber(Tiket::getTableName(), self::field_code(), date('Ymd'));
                $model->{self::field_code()} = Str::uuid()->toString();
            }

            /*
             * set naming for gabungan
             */

            $name = '';
            $location = null;

            if($asset = request()->get($model->field_asset_id()))
            {
                $asset = Asset::find($asset);
                $model->{$model->field_name()} = $asset->field_name;
                $location = $asset->field_location_id;

                if(!empty($location))
                {
                    $model->{$model->field_location_id()} = $location;
                }
            }

            /*
             * set upload gambar
             */

            if (request()->has('images')) {
                $file_logo = request()->file('images');
                if($name = uploadImage($file_logo, 'tiket'))
                {
                    $model->{self::field_image()} = $name;
                }
            }

             /*
             * set upload gambar
             */

             if (empty($model->{$model->field_pelapor()}))
             {
                 $model->{$model->field_pelapor()} = Auth::user()->name;
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
