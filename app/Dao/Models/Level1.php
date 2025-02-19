<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Level1
 *
 * @property $level1_code
 * @property $level1_nama
 * @property $level1_keterangan
 *
 * @property Level2[] $level2
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Level1 extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'level1';
    protected $primaryKey = 'level1_code';

    protected $keyType = 'string';
    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['level1_code', 'level1_nama', 'level1_keterangan'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function has_level2()
    {
        return $this->hasMany(\App\Facades\Model\Level2Model::getModel(), 'level1_code', 'level2_code_level1');
    }

    public static function field_name()
    {
        return 'level1_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public static function field_description()
    {
        return 'level1_keterangan';
    }

    public function getFieldDescriptionAttribute()
    {
        return $this->{$this->field_description()};
    }

}
