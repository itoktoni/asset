<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Level2
 *
 * @property $level2_id
 * @property $level2_nama
 * @property $level2_keterangan
 * @property $level2_id_level1
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
    protected $primaryKey = 'level2_id';
    protected $with = ['has_level1'];


    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['level2_id', 'level2_nama', 'level2_keterangan', 'level2_id_level1'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function has_level1()
    {
        return $this->belongsTo(\App\Facades\Model\Level1Model::getModel(), 'level2_id_level1', 'level1_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function has_level3()
    {
        return $this->hasMany(\App\Facades\Model\Level3Model::getModel(), 'level2_id', 'level3_id_level2');
    }

    public static function field_name()
    {
        return 'level2_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->has_level1->field_name.' - '.$this->{$this->field_name()};
    }

}
