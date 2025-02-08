<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\SheetEntity;
use App\Dao\Models\Core\SystemModel;
use App\Facades\Model\AssetModel;
use App\Facades\Model\LocationModel;
use App\Facades\Model\TiketModel;
use App\Facades\Model\UserModel;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;
use Plugins\Query;
use Wildside\Userstamps\Userstamps;

/**
 * Class Sheet
 *
 * @property $sheet_id
 * @property $sheet_code
 * @property $sheet_id_tiket
 * @property $sheet_id_asset
 * @property $sheet_id_location
 * @property $sheet_keterangan
 * @property $sheet_status
 * @property $sheet_created_at
 * @property $sheet_updated_at
 * @property $sheet_deleted_at
 * @property $sheet_created_by
 * @property $sheet_updated_by
 * @property $sheet_deleted_by
 * @property $sheet_checked_at
 * @property $sheet_checked_by
 * @property $sheet_finished_at
 * @property $sheet_finished_by
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Sheet extends SystemModel
{
    use SheetEntity , SoftDeletes, Userstamps;

    protected $perPage = 20;
    protected $table = 'sheet';
    protected $primaryKey = 'sheet_id';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['sheet_id', 'sheet_code', 'sheet_id_tiket', 'sheet_id_asset', 'sheet_id_location', 'sheet_keterangan', 'sheet_status', 'sheet_created_at', 'sheet_updated_at', 'sheet_deleted_at', 'sheet_created_by', 'sheet_updated_by', 'sheet_deleted_by', 'sheet_checked_at', 'sheet_checked_by', 'sheet_finished_at', 'sheet_finished_by', 'sheet_analisa', 'sheet_kesimpulan'];

    protected $dates = [
        SELF::CREATED_AT,
        SELF::UPDATED_AT,
        SELF::DELETED_AT,
    ];

    const CREATED_AT = 'sheet_created_at';
    const UPDATED_AT = 'sheet_updated_at';
    const DELETED_AT = 'sheet_deleted_at';

    const CREATED_BY = 'sheet_created_by';
    const UPDATED_BY = 'sheet_updated_by';
    const DELETED_BY = 'sheet_deleted_by';

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
        parent::creating(function ($model)
        {
            $model->{self::field_tanggal()} = date('Y-m-d');
        });

        parent::saving(function ($model)
        {
            if(empty($model->{self::field_code()}))
            {
                $model->{self::field_code()} = Query::autoNumber(Sheet::getTableName(), self::field_code(), 'S'.date('Ymd'));
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
                if(!empty($file_logo)){

                    $extension = $file_logo->extension();
                    $name = time().'.'.$extension;

                    $file_logo->storeAs('/public/files/sheet/', $name);
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

            if(!empty($model->field_image) && file_exists(storage_path('app/public/files/sheet/'.$model->field_image))) {
                unlink(storage_path('app/public/files/sheet/'.$model->field_image));
            }

        });

        parent::boot();
    }
}
