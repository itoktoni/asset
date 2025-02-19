<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Level2
 *
 * @property $level2_code
 * @property $level2_nama
 * @property $level2_keterangan
 * @property $level2_code_level1
 *
 * @property Level1 $level1
 * @property Level3[] $level3
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Level2 extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'level2';
    protected $primaryKey = 'level2_code';
    protected $with = ['has_level1'];

    protected $keyType = 'string';
    public $incrementing = false;


    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['level2_code', 'level2_nama', 'level2_keterangan', 'level2_code_level1', 'level2_code'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function has_level1()
    {
        return $this->hasOne(Level1::class, Level1::field_primary(), $this->field_id_level1());
    }

    public static function field_name()
    {
        return 'level2_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public static function field_id_level1()
    {
        return 'level2_code_level1';
    }

    public function getFieldIdLevel1Attribute()
    {
        return $this->{$this->field_id_level1()};
    }

    public static function field_id_level3()
    {
        return 'level2_code_level3';
    }

    public function getFieldIdLevel3Attribute()
    {
        return $this->{$this->field_id_level3()};
    }


    public function dataRepository()
    {
        $query = $this
            ->addSelect([$this->getTable().'.*', Level1::field_name()])
            ->leftJoinRelationship('has_level1')
            ->sortable()
            ->filter();

        if(request()->get('type') != 'report')
        {
            $query = env('PAGINATION_SIMPLE') ? $query->simplePaginate(env('PAGINATION_NUMBER')) : $query->paginate(env('PAGINATION_NUMBER'));
        }

        return $query;
    }

}
