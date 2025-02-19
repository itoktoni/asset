<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait Level3Entity
{
    public static function field_user_id()
    {
        return 'level3_id_user';
    }

    public function getFieldUserIdAttribute()
    {
        return $this->{$this->field_user_id()};
    }

    public static function field_pic()
    {
        return 'level3_id_user';
    }

    public function getFieldPicAttribute()
    {
        return $this->{$this->field_pic()};
    }

    public static function field_code()
    {
        return 'level3_code';
    }

    public function getFieldCodeAttribute()
    {
        return $this->{$this->field_code()};
    }

    public static function field_id_level2()
    {
        return 'level3_code_level2';
    }

    public function getFieldIdLevel1Attribute()
    {
        return $this->{$this->field_id_level2()};
    }
}
