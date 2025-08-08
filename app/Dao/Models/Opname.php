<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\OpnameEntity;
use App\Dao\Models\Core\SystemModel;
use Illuminate\Support\Facades\DB;
use Wildside\Userstamps\Userstamps;

/**
 * Class Opname
 *
 * @property $opname_id
 * @property $opname_mulai
 * @property $opname_selesai
 * @property $opname_nama
 * @property $opname_id_lokasi
 * @property $opname_created_at
 * @property $opname_created_by
 * @property $opname_updated_at
 * @property $opname_updated_by
 * @property $opname_status
 * @property $opname_capture
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Opname extends SystemModel
{
    use OpnameEntity, Userstamps;

    protected $perPage = 20;
    protected $table = 'opname';
    protected $primaryKey = 'opname_id';


    const CREATED_AT = 'opname_created_at';
    const UPDATED_AT = 'opname_updated_at';

    const CREATED_BY = 'opname_created_by';
    const UPDATED_BY = 'opname_updated_by';

    public $timestamps = true;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['opname_id', 'opname_mulai', 'opname_selesai', 'opname_nama', 'opname_id_lokasi', 'opname_created_at', 'opname_created_by', 'opname_updated_at', 'opname_updated_by', 'opname_status', 'opname_capture'];

    public static function field_name()
    {
        return 'opname_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function fieldSearching()
    {
        return $this->field_name();
    }

    public function has_location()
    {
        return $this->hasOne(Lokasi::getModel(), Lokasi::field_primary(), $this->field_location_id());
    }

    public function dataRepository()
    {
        $query = $this->select(['opname.*', Lokasi::field_name()])
            ->leftJoinRelationship('has_location')
            ->sortable()->filter();

        if(request()->get('type') != 'report')
        {
            $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));
        }

        return $query;
    }

    public static function boot()
    {
        parent::created(function ($model)
        {
           $id = DB::getPdo()->lastInsertId();
            Opname::find($id)->update([
                Opname::field_name() => 'Opname '.$id.' '.$model->getAttribute(Opname::field_name())
            ]);
        });

        parent::boot();
    }
}
