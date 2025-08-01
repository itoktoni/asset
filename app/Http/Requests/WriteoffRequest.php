<?php

namespace App\Http\Requests;

use App\Dao\Enums\AssetStatusType;
use App\Dao\Enums\WriteoffType;
use App\Dao\Models\Asset;
use App\Dao\Models\Writeoff;
use App\Dao\Traits\ValidationTrait;
use App\Http\Requests\Core\GeneralRequest;
use Plugins\Query;

class WriteoffRequest extends GeneralRequest
{
    use ValidationTrait;

    public function withValidator($validator)
    {
        $kosong = $count = false;

        if(empty($this->{Writeoff::field_asset_id()}))
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
        $key = Query::autoNumber(Writeoff::getTableName(), Writeoff::field_code(), 'WO' . date('Ymd'));
        $from = $data = null;

        if (isset($this->{Writeoff::field_asset_id()}))
        {
            $from = Asset::find($this->{Writeoff::field_asset_id()})->field_location_id ?? null;
        }
        else
        {
            $data = [];

            $asset = Asset::select(Asset::field_primary(), Asset::field_location_id())->whereIn(Asset::field_primary(), $this->code)
                ->get();

            foreach ($asset as $item) {
                $data[] = [
                    Writeoff::field_code() => $key,
                    Writeoff::field_asset_id() => $item->field_primary,
                    Writeoff::field_approved_id() => $this->{Writeoff::field_approved_id()},
                    Writeoff::field_location_id() => $item->field_location_id,
                    Writeoff::field_status() => WriteoffType::Request,
                    Writeoff::CREATED_AT => $date,
                    Writeoff::CREATED_BY => $user,
                    Writeoff::UPDATED_AT => $date,
                    Writeoff::UPDATED_BY => $user,
                ];
            }
        }

        $this->merge([
            Writeoff::field_code() => Query::autoNumber(Writeoff::getTableName(), Writeoff::field_code(), 'WO' . date('Ymd')),
            Writeoff::field_status() => WriteoffType::Request,
            Writeoff::field_location_id() => $from,
            'data' => $data
        ]);
    }

    public function validation(): array
    {
        return [
            Writeoff::field_approved_id() => 'required|exists:users,id',
        ];
    }
}
