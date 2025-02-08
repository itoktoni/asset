<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class JobType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;
    public const Preventif = 'Preventif';
    public const Korektif = 'Korektif';
    public const Inspeksi = 'Inspeksi';
    public const Kalibrasi = 'Kalibrasi';

}
