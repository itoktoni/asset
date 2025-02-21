<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\Level3Entity;
use App\Dao\Models\Core\SystemModel;
use App\Dao\Models\Core\User;
use App\Facades\Model\Level2Model;
use Monolog\Level;
use Plugins\Query;

/**
 * Class Level3
 *
 * @property $level3_code
 * @property $level3_nama
 * @property $level3_keterangan
 * @property $level3_code_level2
 *
 * @property Level2 $level2
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Level3 extends SystemModel
{
    use Level3Entity;

    protected $perPage = 20;
    protected $table = 'level3';
    protected $primaryKey = 'level3_code';
    // protected $with = ['has_level2'];

    protected $keyType = 'string';
    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['level3_code', 'level3_nama', 'level3_keterangan', 'level3_code_level2', 'level3_code_user', 'level3_code'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function has_level2()
    {
        return $this->hasOne(Level2Model::getModel(), Level2::field_primary(), $this->field_id_level2());
    }

    public function has_user()
    {
        return $this->hasOne(User::class, User::field_primary(), $this->field_user_id());
    }

    public static function field_name()
    {
        return 'level3_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function dataRepository()
    {
        $query = $this
            ->addSelect([$this->getTable().'.*', User::field_name(), Level2::field_name(), Level1::field_name()])
            ->leftJoinRelationship('has_user')
            ->leftJoinRelationship('has_level2')
            ->leftJoinRelationship('has_level2.has_level1')
            ->sortable()
            ->filter();

        if(request()->get('type') != 'report')
        {
            $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));
        }

        return $query;
    }

    public static function boot()
    {
        parent::creating(function ($model)
        {
            if(request()->get($model->field_primary()))
            {
                $model->{self::field_primary()} = Query::autoNumber(self::getTableName(), Level3::field_primary(), 'LEV3');
            }
        });

        parent::boot();
    }

}
