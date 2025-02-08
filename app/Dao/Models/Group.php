<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\GroupEntity;
use App\Dao\Models\Core\SystemModel;
use App\Dao\Models\Core\User;

/**
 * Class Group
 *
 * @property $group_id
 * @property $group_nama
 * @property $group_keterangan
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Group extends SystemModel
{
    use GroupEntity;

    protected $perPage = 20;
    protected $table = 'group';
    protected $primaryKey = 'group_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['group_id', 'group_nama', 'group_keterangan'];

    public static function field_name()
    {
        return 'group_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_user()
    {
        return $this->belongsToMany(User::getModel(), 'responsible_group', $this->field_primary(), $this->field_user_id());
    }
}
