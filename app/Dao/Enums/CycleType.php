<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class CycleType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;

    public const Menit = 'menit';
    public const Jam = 'jam';
    public const Hari = 'hari';
    public const Minggu = 'minggu';
    public const Bulan = 'bulan';
    public const Tahun = 'tahun';

}
