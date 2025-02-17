<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class PendanaanType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;
    public const APBN = 'APBN';
    public const BLU = 'BLU';
    public const Mandiri = 'Mandiri';

}
