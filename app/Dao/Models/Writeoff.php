<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\WriteoffEntity;
use App\Dao\Models\Core\SystemModel;
use App\Dao\Models\Core\User;
use Illuminate\Support\Facades\DB;
use Plugins\Query;
use Wildside\Userstamps\Userstamps;

/**
 * Class Writeoff
 *
 * @property $writeoff_id
 * @property $writeoff_key
 * @property $writeoff_created_at
 * @property $writeoff_created_by
 * @property $writeoff_updated_at
 * @property $writeoff_updated_by
 * @property $writeoff_approved_at
 * @property $writeoff_approved_by
 * @property $writeoff_status
 * @property $writeoff_id_writeoff
 * @property $writeoff_id_lokasi
 * @property $writeoff_id_to
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Writeoff extends SystemModel
{
    use WriteoffEntity, Userstamps;

    protected $perPage = 20;
    protected $table = 'writeoff';
    protected $primaryKey = 'writeoff_id';

    protected $dates = [
        SELF::CREATED_AT,
        SELF::UPDATED_AT,
    ];

    public $timestamps = true;


    protected $filters = [
        'filter',
        'writeoff_id_lokasi',
        'writeoff_id_asset',
    ];

    const CREATED_AT = 'writeoff_created_at';
    const UPDATED_AT = 'writeoff_updated_at';

    const CREATED_BY = 'writeoff_created_by';
    const UPDATED_BY = 'writeoff_updated_by';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['writeoff_id', 'writeoff_key', 'writeoff_created_at', 'writeoff_created_by', 'writeoff_updated_at', 'writeoff_updated_by', 'writeoff_approved_at', 'writeoff_approved_by', 'writeoff_status', 'writeoff_id_asset', 'writeoff_id_lokasi', 'writeoff_keterangan', 'writeoff_catatan'];

    public static function field_name()
    {
        return 'writeoff_key';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function fieldSearching()
    {
        return $this->field_name();
    }

    public function has_user()
    {
        return $this->hasOne(User::getModel(), User::field_primary(), $this->field_user_id());
    }

    public function has_approval()
    {
        return $this->hasOne(User::getModel(), User::field_primary(), $this->field_approved_id());
    }

    public function has_asset()
    {
        return $this->hasOne(Asset::getModel(), Asset::field_primary(), $this->field_asset_id());
    }

    public function has_location()
    {
        return $this->hasOne(Lokasi::getModel(), Lokasi::field_primary(), $this->field_location_id());
    }

    public function dataRepository($paginate = true)
    {
        $query = $this
            ->select([
                'writeoff.*',
                Asset::field_primary(),
                Asset::field_name(),
                Lokasi::field_name(),
                DB::raw('user.name as user_nama'),
                DB::raw('approval.name as approval_nama'),
            ])
            ->leftJoinRelationship('has_asset')
            ->leftJoinRelationship('has_location')
            ->leftJoinRelationshipUsingAlias('has_user', 'user')
            ->leftJoinRelationshipUsingAlias('has_approval', 'approval')
            // ->select($this->getSelectedField())
            ->sortable()
            ->filter();

        if(request()->get('type') != 'report' && $paginate)
        {
            $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));
        }

        return $query;
    }
}
