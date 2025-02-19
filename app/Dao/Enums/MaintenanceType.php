<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class MaintenanceType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;

    public const Garansi = 'Garansi';
    public const Kontrak = 'Kontrak';
    public const Internal = 'Internal';

}
