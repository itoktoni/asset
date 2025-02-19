<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class KepemilikanType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Observasi = null;

    public const Internal = 'Internal';
    public const KSO = 'KSO';
    public const Lainnya = 'Lainnya';

}
