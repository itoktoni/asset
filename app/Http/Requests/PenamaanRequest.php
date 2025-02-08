<?php

namespace App\Http\Requests;

use App\Dao\Models\Asset;
use App\Dao\Models\Penamaan;
use App\Dao\Traits\ValidationTrait;
use App\Http\Requests\Core\GeneralRequest;

class PenamaanRequest extends GeneralRequest
{
    use ValidationTrait;

    public function prepareForValidation()
    {
        $this->merge([

        ]);
    }

    public function validation(): array
    {
        return [
            'penamaan_nama' => 'required',
        ];
    }
}
