<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Vendor
 *
 * @property $vendor_id
 * @property $vendor_nama
 * @property $vendor_pic
 * @property $vendor_phone
 * @property $vendor_email
 * @property $vendor_alamat
 * @property $vendor_keterangan
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Vendor extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'vendor';
    protected $primaryKey = 'vendor_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['vendor_id', 'vendor_nama', 'vendor_pic', 'vendor_phone', 'vendor_email', 'vendor_alamat', 'vendor_keterangan'];

    public static function field_name()
    {
        return 'vendor_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
