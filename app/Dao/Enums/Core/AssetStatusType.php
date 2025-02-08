<?php

namespace App\Dao\Enums\Core;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class AssetStatusType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const BAIK = 'BAIK';
    public const RUSAK_RINGAN = 'RUSAK RINGAN';
    public const RUSAK_BERAT = 'RUSAK BERAT';

}
