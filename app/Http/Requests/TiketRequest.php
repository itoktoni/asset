<?php

namespace App\Http\Requests;

use App\Dao\Models\Asset;
use App\Dao\Models\Tiket;
use App\Dao\Traits\ValidationTrait;
use App\Facades\Model\GroupsModel;
use App\Http\Requests\Core\GeneralRequest;
use Illuminate\Support\Str;

class TiketRequest extends GeneralRequest
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
            Tiket::field_asset_id() => 'required',
            Tiket::field_description() => 'required',
        ];
    }

    public function withValidator($validator)
    {
        $asset = Asset::find($this->{Tiket::field_asset_id()});
        $location = false;

        if($asset)
        {
            $location_id = $asset->asset_id_lokasi;
            if(empty($this->{Tiket::field_location_id()}) && empty($location_id))
            {
                $location = true;
            }
        }

        $validator->after(function ($validator) use($location) {

            if($location)
            {
                $validator->errors()->add(Tiket::field_location_id(), 'Harap Masukan Ruangan !');
            }
        });
    }
}
