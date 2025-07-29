<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


/**
 * Class Harta
 *
 * @property $harta_id
 * @property $harta_nama
 * @property $harta_kategori
 * @property $harta_manfaat
 * @property $harta_penyusutan
 * @property $harta_deskripsi
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Harta extends SystemModel
{
    protected $perPage = 20;
    protected $table = 'harta';
    protected $primaryKey = 'harta_id';

    protected $casts = [
        'harta_manfaat' => 'integer',
        'harta_penyusutan' => 'double',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['harta_id', 'harta_nama', 'harta_kategori', 'harta_manfaat', 'harta_penyusutan', 'harta_deskripsi'];

    public static function field_name()
    {
        return 'harta_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function fieldSearching()
    {
        return $this->field_name();
    }
}
