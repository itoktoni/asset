<?php

namespace App\Dao\Entities\Core;

use App\Facades\Model\UserModel;

trait GroupEntity
{
    public static function field_user_id()
    {
        return 'id';
    }

    public function getFieldUserIdAttribute()
    {
        return $this->{$this->field_user_id()};
    }
}
