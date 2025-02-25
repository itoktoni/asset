<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class JobType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Observasi = null;

    public const Preventif = 'Preventif';
    public const Inspeksi = 'Inspeksi';

    public const Korektif = 'Korektif';

    public const Inventaris = 'Inventaris';
    public const Kalibrasi = 'Kalibrasi';

    public static function getDescription($value): string
    {
        if ($value === self::Inventaris) {
            return 'Inventaris / Promotif';
        }

        return parent::getDescription($value);
    }

}
