<?php

namespace App\Http\Requests;

use App\Dao\Models\Asset;
use App\Dao\Models\Penamaan;
use App\Dao\Traits\ValidationTrait;
use App\Http\Requests\Core\GeneralRequest;

class ModelRequest extends GeneralRequest
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
            'model_nama' => 'required|unique:model,model_nama',
        ];
    }
}
