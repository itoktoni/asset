<?php

namespace App\Services;

use App\Dao\Enums\WriteoffType;
use App\Dao\Models\Writeoff;
use Plugins\Alert;

class UpdateWriteoffService
{
    public function update($model, $data, $code)
    {
        $check = $model->updateRepository($data->all(), $code);
        $tanggal = now();

        if ($check['status']) {
            $key = $check['data']->writeoff_key;
            Writeoff::where(Writeoff::field_code(), $key)->update([
                Writeoff::field_status() => $data->{Writeoff::field_status()},
                'writeoff_catatan' => $data->writeoff_catatan,
                'writeoff_approved_at' => $tanggal,
            ]);


            if (request()->wantsJson()) {
                return response()->json($check)->getData();
            }
            Alert::update();
        } else {
            Alert::error($check['message']);
        }

        return $check;
    }
}
