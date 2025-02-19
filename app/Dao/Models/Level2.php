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
        return $this->belongsTo(\App\Facades\Model\Level1Model::getModel(), 'level2_code_level1', 'level1_code');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function has_level3()
    {
        return $this->hasMany(\App\Facades\Model\Level3Model::getModel(), 'level2_code', 'level3_id_level2');
    }

    public static function field_name()
    {
        return 'level2_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->has_level ? $this->has_level1->field_name.' - '.$this->{$this->field_name()} : null;
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

}
