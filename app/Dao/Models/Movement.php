<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\MovementEntity;
use App\Dao\Models\Core\SystemModel;
use App\Dao\Models\Core\User;
use Illuminate\Support\Facades\DB;
use Plugins\Query;
use Wildside\Userstamps\Userstamps;

/**
 * Class Movement
 *
 * @property $movement_id
 * @property $movement_key
 * @property $movement_created_at
 * @property $movement_created_by
 * @property $movement_updated_at
 * @property $movement_updated_by
 * @property $movement_approved_at
 * @property $movement_approved_by
 * @property $movement_status
 * @property $movement_id_movement
 * @property $movement_id_from
 * @property $movement_id_to
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Movement extends SystemModel
{
    use MovementEntity, Userstamps;

    protected $perPage = 20;
    protected $table = 'movement';
    protected $primaryKey = 'movement_id';

    protected $dates = [
        SELF::CREATED_AT,
        SELF::UPDATED_AT,
    ];

    public $timestamps = true;


    protected $filters = [
        'filter',
        'movement_id_from',
        'movement_id_asset',
        'movement_id_to',
    ];

    const CREATED_AT = 'movement_created_at';
    const UPDATED_AT = 'movement_updated_at';

    const CREATED_BY = 'movement_created_by';
    const UPDATED_BY = 'movement_updated_by';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['movement_id', 'movement_key', 'movement_created_at', 'movement_created_by', 'movement_updated_at', 'movement_updated_by', 'movement_approved_at', 'movement_approved_by', 'movement_status', 'movement_id_asset', 'movement_id_from', 'movement_id_to', 'movement_keterangan', 'movement_catatan'];

    public static function field_name()
    {
        return 'movement_key';
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

    public function has_from()
    {
        return $this->hasOne(Lokasi::getModel(), Lokasi::field_primary(), $this->field_from_id());
    }

    public function has_to()
    {
        return $this->hasOne(Lokasi::getModel(), Lokasi::field_primary(), $this->field_to_id());
    }

    public function dataRepository($paginate = true)
    {
        $query = $this
            ->select([
                'movement.*',
                Asset::field_primary(),
                Asset::field_name(),
                DB::raw('to.lokasi_nama as to_nama'),
                DB::raw('from.lokasi_nama as from_nama'),
                DB::raw('user.name as user_nama'),
                DB::raw('approval.name as approval_nama'),
            ])
            ->leftJoinRelationship('has_asset')
            ->leftJoinRelationshipUsingAlias('has_to', 'to')
            ->leftJoinRelationshipUsingAlias('has_from', 'from')
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
