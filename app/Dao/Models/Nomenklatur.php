<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Nomenklatur
 *
 * @property $nomenklatur_code
 * @property $nomenklatur_nama
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Nomenklatur extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'nomenklatur';
    protected $primaryKey = 'nomenklatur_code';
    protected $keyType = 'string';

    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['nomenklatur_code', 'nomenklatur_nama', 'nomenklatur_keterangan'];

    public static function field_name()
    {
        return 'nomenklatur_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public static function field_description()
    {
        return 'nomenklatur_keterangan';
    }

    public function getFieldDescriptionAttribute()
    {
        return $this->{$this->field_description()};
    }
}
