<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\DepartmentEntity;
use App\Dao\Models\Core\SystemModel;
use App\Dao\Models\Core\User;

/**
 * Class Department
 *
 * @property $department_id
 * @property $department_user_id
 * @property $department_name
 * @property $department_pic
 * @property $department_description
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Department extends SystemModel
{
    use DepartmentEntity;

    protected $perPage = 20;
    protected $table = 'department';
    protected $primaryKey = 'department_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['department_id', 'department_user_id', 'department_nama', 'department_pic', 'department_phone', 'department_notification'];

    public static function field_name()
    {
        return 'department_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_user()
    {
        return $this->belongsToMany(User::getModel(), 'responsible_department', $this->field_primary(), $this->field_user_id());
    }
}
