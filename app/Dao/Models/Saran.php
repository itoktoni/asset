<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Saran
 *
 * @property $saran_id
 * @property $saran_nama
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Saran extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'saran';
    protected $primaryKey = 'saran_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['saran_id', 'saran_nama'];

    public static function field_name()
    {
        return 'saran_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
