<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\CategoryEntity;
use App\Dao\Models\Core\SystemModel;
use App\Dao\Models\Core\User;

/**
 * Class Category
 *
 * @property $category_id
 * @property $category_name
 * @property $category_user_id
 * @property User $user
 *
 * @mixin \Illuminate\Database\Eloquent\Builder
 */
class Category extends SystemModel
{
    use CategoryEntity;

    protected $perPage = 20;

    protected $table = 'category';

    protected $primaryKey = 'category_id';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['category_id', 'category_nama', 'category_notification'];

    public static function field_name()
    {
        return 'category_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }

    public function has_user()
    {
        return $this->belongsToMany(User::getModel(), 'responsible_category', $this->field_primary(), $this->field_user_id());
    }
}
