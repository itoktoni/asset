<?php

namespace App\Dao\Models;

use App\Dao\Entities\Core\NotificationEntity;
use App\Dao\Models\Core\SystemModel;
use Wildside\Userstamps\Userstamps;

/**
 * Class Notification
 *
 * @property $notification_id
 * @property $notification_nama
 * @property $notification_pesan
 * @property $notification_created_at
 * @property $notification_created_by
 * @property $notification_updated_at
 * @property $notification_updated_by
 * @property $notification_eta
 * @property $notification_etd
 * @property $notification_status
 * @property $notification_response
 *
 * @package App
 * @mixin \Illuminate\Database\Eloquent\Builder
 */

class Notification extends SystemModel
{
    use Userstamps, NotificationEntity;

    protected $perPage = 20;
    protected $table = 'notification';
    protected $primaryKey = 'notification_id';
    public $timestamps = true;

    protected $dates = [
        SELF::CREATED_AT,
        SELF::UPDATED_AT,
    ];

    const CREATED_AT = 'notification_created_at';
    const UPDATED_AT = 'notification_updated_at';

    const CREATED_BY = 'notification_created_by';
    const UPDATED_BY = 'notification_updated_by';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = ['notification_id', 'notification_nama', 'notification_alamat', 'notification_pesan', 'notification_gambar', 'notification_created_at', 'notification_created_by', 'notification_updated_at', 'notification_updated_by', 'notification_eta', 'notification_etd', 'notification_status', 'notification_response'];

    public static function field_name()
    {
        return 'notification_nama';
    }

    public function getFieldNameAttribute()
    {
        return $this->{$this->field_name()};
    }
}
