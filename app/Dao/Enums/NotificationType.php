<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class NotificationType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;

    public const WhatsApp = 'whatsApp';
    public const Telegram = 'telegram';
    public const SMS = 'sms';
    public const Email = 'email';

}
