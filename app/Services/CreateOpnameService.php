<?php

namespace App\Services;

use App\Dao\Enums\Core\BooleanType;
use App\Dao\Models\OpnameDetail;
use Plugins\Alert;
use Plugins\Notes;

class CreateOpnameService
{
    public function save($model, $data)
    {
        $check = false;
        $date = date('Y-m-d H:i:s');
        $user = auth()->user()->id;

        try {
            if (is_array($data->code)) {
                $check = OpnameDetail::where(OpnameDetail::field_opname_id(), $data->opname_id)
                    ->whereIn(OpnameDetail::field_code(), $data->code)
                    ->update([
                        OpnameDetail::field_waktu() => $date,
                        OpnameDetail::UPDATED_AT => $date,
                        OpnameDetail::UPDATED_BY => $user,
                        OpnameDetail::field_key() => $data->key,
                        OpnameDetail::field_scan_id() => $data->location_id,
                        OpnameDetail::field_ketemu() => BooleanType::Yes,
                    ]);
            } else {
                $check = OpnameDetail::where(OpnameDetail::field_opname_id(), $data->opname_id)
                    ->where(OpnameDetail::field_code(), $data->code)
                    ->update([
                        OpnameDetail::field_waktu() => $date,
                        OpnameDetail::UPDATED_AT => $date,
                        OpnameDetail::UPDATED_BY => $user,
                        OpnameDetail::field_key() => $data->key,
                        OpnameDetail::field_scan_id() => $data->location_id,
                        OpnameDetail::field_ketemu() => BooleanType::Yes,
                    ]);
            }

            if ($check) {
                $check = Notes::create();
                Alert::create();
            } else {
                $message = env('APP_DEBUG') ? $check['data'] : $check['message'];
                Alert::error($message);
            }

        } catch (\Throwable $th) {
            Alert::error($th->getMessage());

            return $th->getMessage();
        }

        return $check;
    }
}
