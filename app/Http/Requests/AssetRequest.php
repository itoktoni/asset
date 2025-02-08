<?php

namespace App\Http\Requests;

use App\Dao\Models\Asset;
use App\Dao\Traits\ValidationTrait;
use App\Facades\Model\GroupsModel;
use App\Http\Requests\Core\GeneralRequest;
use Illuminate\Support\Str;

class AssetRequest extends GeneralRequest
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
            Asset::field_penamaan_id() => 'required',
        ];
    }
}
