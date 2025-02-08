<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class TechnologyType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Sederhana = 'SEDERHANA';
    public const menengah = 'MENENGAH';
    public const tinggi = 'TINGGI';

}
