<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Distributor
 *
 * @property $distributor_id
 * @property $distributor_nama
 * @property $distributor_pic
 * @property $distributor_phone
 * @property $distributor_email
 * @property $distributor_alamat
 * @property $distributor_keterangan
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Distributor extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'distributor';
    protected $primaryKey = 'distributor_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['distributor_id', 'distributor_nama', 'distributor_pic', 'distributor_phone', 'distributor_email', 'distributor_alamat', 'distributor_keterangan'];

    public static function field_name()
    {
        return 'distributor_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
