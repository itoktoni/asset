<?php

namespace App\Dao\Enums;

use App\Dao\Traits\StatusTrait;
use BenSampo\Enum\Contracts\LocalizedEnum;
use BenSampo\Enum\Enum as Enum;

class WriteoffType extends Enum implements LocalizedEnum
{
    use StatusTrait;

    public const Unknown = null;

    public const Request = 'REQUEST';
    public const Approve = 'APPROVE';
    public const Reject = 'REJECT';

}
