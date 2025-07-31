<?php

namespace App\Http\Requests;

use App\Dao\Enums\AssetStatusType;
use App\Dao\Models\Asset;
use App\Dao\Models\Model;
use App\Dao\Models\Penamaan;
use App\Dao\Traits\ValidationTrait;
use App\Http\Requests\Core\GeneralRequest;
use Carbon\Carbon;

class RegisterRequest extends GeneralRequest
{
    use ValidationTrait;

    public function prepareForValidation()
    {
        $date = date('Y-m-d H:i:s');
        $user = auth()->user()->id;

        $model = Model::find($this->{Asset::field_model_id()});
        $penamaan = Penamaan::find($this->{Asset::field_penamaan_id()});

        $nama = $penamaan->field_name;

        if(!empty($model->field_name))
        {
            $brand = $model->has_brand;

            if(!empty($brand->field_name))
            {
                $nama = $nama.' ~ ( '.$brand->field_name . ' ) ' . $model->field_name;
            }
            else
            {
                $nama = $model->field_name . ' - ' . $nama;
            }
        }

        $rfid = [];
        foreach($this->code as $item){
            $rfid[] = [
                Asset::field_name() => $nama,
                Asset::field_code() => $item,
                Asset::field_penamaan_id() => $this->{Asset::field_penamaan_id()},
                Asset::field_location_id() => $this->{Asset::field_location_id()},
                Asset::field_model_id() => $this->{Asset::field_model_id()},
                Asset::field_department_id() => $this->{Asset::field_department_id()} ?? null,
                Asset::field_status() => AssetStatusType::BAIK,
                Asset::CREATED_AT => $date,
                Asset::CREATED_BY => $user,
                Asset::UPDATED_AT => $date,
                Asset::UPDATED_BY => $user,
            ];
        }

        $this->merge([
            'rfid' => $rfid,
        ]);
    }

    public function validation(): array
    {
        return [
            Asset::field_penamaan_id() => 'required|exists:penamaan,penamaan_id',
            Asset::field_model_id() => 'required|exists:model,model_id',
            Asset::field_location_id() => 'required|exists:lokasi,lokasi_id',
        ];
    }
}
