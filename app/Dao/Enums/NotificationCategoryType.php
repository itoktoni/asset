<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class NotificationCategoryType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;

    public const WhatsApp = 'WhatsApp';
    public const Telegram = 'Telegram';
    public const SMS = 'SMS';
    public const Email = 'Email';

}
