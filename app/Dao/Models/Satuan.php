<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Satuan
 *
 * @property $satuan_code
 * @property $satuan_name
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Satuan extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'satuan';
    protected $primaryKey = 'satuan_code';

    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['satuan_code', 'satuan_nama'];

    public static function field_name()
    {
        return 'satuan_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
