<?php

namespace App\Http\Requests;

use App\Dao\Models\Asset;
use App\Dao\Models\Opname;
use App\Dao\Traits\ValidationTrait;
use App\Http\Requests\Core\GeneralRequest;

class OpnameRequest extends GeneralRequest
{
    use ValidationTrait;

    public function withValidator($validator)
    {
        $kosong = $count = false;

        if(is_array($this->code))
        {
            $kosong = count($this->code) == 0;
            $count = Asset::whereIn(Asset::field_primary(), $this->code)->get()->count() == 0;
        }
        else
        {
            $kosong = empty($this->code);
            $count = Asset::where(Asset::field_primary(), $this->code)->get()->count() == 0;
        }

        $validator->after(function ($validator) use($kosong, $count) {

            if($kosong)
            {
                $validator->errors()->add('code', 'Harap Masukan Data Asset !');
            }

            if($count)
            {
                $validator->errors()->add('code', 'Asset Tidak Ditemukan !');
            }
        });
    }

    public function prepareForValidation()
    {
        $this->merge([]);
    }

    public function validation(): array
    {
        return [
            Opname::field_primary() => 'required',
            Opname::field_key() => 'required',
            'location_id' => 'required|exists:lokasi,lokasi_id',
        ];
    }
}
