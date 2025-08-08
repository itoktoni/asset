<?php

namespace App\Http\Requests;

use App\Dao\Enums\OpnameType;
use App\Dao\Models\Asset;
use App\Dao\Models\Opname;
use App\Dao\Models\Penamaan;
use App\Dao\Traits\ValidationTrait;
use App\Http\Requests\Core\GeneralRequest;

class CaptureRequest extends GeneralRequest
{
    use ValidationTrait;

    public function prepareForValidation()
    {
        $this->merge([
            Opname::field_name() => '('.$this->input(Opname::field_start_date()).' - '.$this->input(Opname::field_end_date()).')',
            Opname::field_status() => OpnameType::Proses,
        ]);
    }

    public function validation(): array
    {
        return [
            'opname_mulai' => 'required',
        ];
    }
}
