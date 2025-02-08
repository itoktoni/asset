<?php

namespace App\Dao\Enums\Core;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class TiketType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Preventif = 'Preventif';
    public const Korektif = 'Korektif';

}
