<?php

namespace App\Http\Requests;

use App\Dao\Enums\AssetStatusType;
use App\Dao\Enums\MovementType;
use App\Dao\Models\Asset;
use App\Dao\Models\Movement;
use App\Dao\Traits\ValidationTrait;
use App\Http\Requests\Core\GeneralRequest;
use Plugins\Query;

class MovementRequest extends GeneralRequest
{
    use ValidationTrait;

    public function withValidator($validator)
    {
        $kosong = $count = false;

        if(empty($this->{Movement::field_asset_id()}))
        {
            $kosong = count($this->code) == 0;
            $count = Asset::whereIn(Asset::field_primary(), $this->code)->get()->count() == 0;
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
        $date = date('Y-m-d H:i:s');
        $user = auth()->user()->id;
        $key = Query::autoNumber(Movement::getTableName(), Movement::field_code(), 'MV' . date('Ymd'));
        $from = $data = null;

        if (isset($this->{Movement::field_asset_id()}))
        {
            $from = Asset::find($this->{Movement::field_asset_id()})->field_location_id ?? null;
        }
        else
        {
            $data = [];

            $asset = Asset::select(Asset::field_primary(), Asset::field_location_id())->whereIn(Asset::field_primary(), $this->code)
                ->get();

            foreach ($asset as $item) {
                $data[] = [
                    Movement::field_code() => $key,
                    Movement::field_asset_id() => $item->field_primary,
                    Movement::field_approved_id() => $this->{Movement::field_approved_id()},
                    Movement::field_from_id() => $item->field_location_id,
                    Movement::field_to_id() => $this->{Movement::field_to_id()},
                    Movement::field_status() => MovementType::Request,
                    Movement::CREATED_AT => $date,
                    Movement::CREATED_BY => $user,
                    Movement::UPDATED_AT => $date,
                    Movement::UPDATED_BY => $user,
                ];
            }
        }

        $this->merge([
            Movement::field_code() => Query::autoNumber(Movement::getTableName(), Movement::field_code(), 'MV' . date('Ymd')),
            Movement::field_status() => MovementType::Request,
            Movement::field_from_id() => $from,
            'data' => $data
        ]);
    }

    public function validation(): array
    {
        return [
            Movement::field_to_id() => 'required|exists:lokasi,lokasi_id',
            Movement::field_approved_id() => 'required|exists:users,id',
        ];
    }
}
