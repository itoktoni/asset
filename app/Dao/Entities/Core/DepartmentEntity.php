<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait DepartmentEntity
{
    public static function field_user_id()
    {
        return 'id';
    }

    public function getFieldUserIdAttribute()
    {
        return $this->{$this->field_user_id()};
    }

    public static function field_pic()
    {
        return 'department_pic';
    }

    public function getFieldPicAttribute()
    {
        return $this->{$this->field_pic()};
    }

    public static function field_phone()
    {
        return 'department_phone';
    }

    public function getFieldPhoneAttribute()
    {
        return $this->{$this->field_phone()};
    }
}
