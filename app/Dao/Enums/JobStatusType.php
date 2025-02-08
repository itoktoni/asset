<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class JobStatusType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Baru = null;
    public const Ambil = 'Ambil';
    public const Proses = 'Proses';
    public const Selesai = 'Selesai';

}
