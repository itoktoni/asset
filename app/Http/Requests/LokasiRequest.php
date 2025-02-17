<?php

namespace App\Http\Requests;

use App\Dao\Models\Area;
use App\Dao\Models\Lokasi;
use App\Dao\Traits\ValidationTrait;
use App\Http\Requests\Core\GeneralRequest;

class LokasiRequest extends GeneralRequest
{
    use ValidationTrait;

    public function prepareForValidation()
    {
        $nama = $this->lokasi_nama;
        $area_id = $this->{Lokasi::field_area_id()};
        $description = $this->{Lokasi::field_description()};

        if(!empty($area_id))
        {
            $area = Area::find($area_id)->field_name ?? '';
            $nama = $nama.' @ '.$area;

            if(!empty($description))
            {
                $nama = $nama.' ( '.$description.' )';
            }
        }

        $this->merge([
            Lokasi::field_gabungan() => $nama,
        ]);
    }

    public function validation(): array
    {
        return [
            'lokasi_nama' => 'required',
        ];
    }
}
