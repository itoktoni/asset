<?php

namespace App\Dao\Models;

use App\Dao\Models\Core\SystemModel;


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
    protected $perPage = 20;
    protected $table = 'department';
    protected $primaryKey = 'department_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['department_id', 'department_user_id', 'department_name', 'department_pic', 'department_description'];

    public static function field_name()
    {
        return 'department_name';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
