<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class HartaType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;

    public const Bangunan = 'BANGUNAN';
    public const Lainnya = 'LAINNYA';

}
