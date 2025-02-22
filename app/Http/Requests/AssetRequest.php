<?php

namespace App\Http\Requests;

use App\Dao\Models\Asset;
use App\Dao\Traits\ValidationTrait;
use App\Facades\Model\GroupsModel;
use App\Http\Requests\Core\GeneralRequest;
use Carbon\Carbon;
use Illuminate\Support\Str;

class AssetRequest extends GeneralRequest
{
    use ValidationTrait;

    public function prepareForValidation()
    {
        $next = null;
        if(!empty($this->{Asset::field_tanggal_expired()}))
        {
            $next = Carbon::createFromDate($this->{Asset::field_tanggal_expired()})->addYear(1);
        }

        $this->merge([
            Asset::field_next_expired() => $next
        ]);
    }

    public function validation(): array
    {
        return [
            Asset::field_penamaan_id() => 'required',
            Asset::field_serial_number() => 'unique:asset,asset_serial_number',
        ];
    }
}
