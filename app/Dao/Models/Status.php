<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Status
 *
 * @property $status_code
 * @property $status_nama
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Status extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'status';
    protected $primaryKey = 'status_code';
    protected $keyType = 'string';

    public $incrementing = false;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['status_code', 'status_nama'];


    public static function field_name()
    {
        return 'status_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
