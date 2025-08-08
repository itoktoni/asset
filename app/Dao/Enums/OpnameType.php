<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class OpnameType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;

    public const Proses = 'PROSES';
    public const Selesai = 'SELESAI';

}
