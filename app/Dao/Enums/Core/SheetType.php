<?php

namespace App\Dao\Enums\Core;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class SheetType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Baru = 'Baru';
    public const Proses = 'Proses';
    public const Selesai = 'Selesai';

}
