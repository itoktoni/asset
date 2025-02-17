<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Level3
 *
 * @property $level3_id
 * @property $level3_nama
 * @property $level3_keterangan
 * @property $level3_id_level2
 *
 * @property Level2 $level2
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Level3 extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'level3';
    protected $primaryKey = 'level3_id';
    protected $with = ['has_level2'];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['level3_id', 'level3_nama', 'level3_keterangan', 'level3_id_level2'];


    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function has_level2()
    {
        return $this->belongsTo(\App\Facades\Model\Level2Model::getModel(), 'level3_id_level2', 'level2_id');
    }

    public static function field_name()
    {
        return 'level3_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->has_level2->field_name.' - '.$this->{$this->field_name()};
    }

}
