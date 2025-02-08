<?php

namespace App\Dao\Enums\Core;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class YesNoType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;

    public const Yes = 'Yes';

    public const No = 'No';
}
