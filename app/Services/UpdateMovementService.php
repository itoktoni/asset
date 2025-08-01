<?php

namespace App\Services;

use App\Dao\Enums\MovementType;
use App\Dao\Models\Movement;
use Plugins\Alert;

class UpdateMovementService
{
    public function update($model, $data, $code)
    {
        $check = $model->updateRepository($data->all(), $code);
        $tanggal = now();

        if ($check['status']) {
            $key = $check['data']->movement_key;
            Movement::where(Movement::field_code(), $key)->update([
                Movement::field_status() => $data->{Movement::field_status()},
                'movement_catatan' => $data->movement_catatan,
                'movement_approved_at' => $tanggal,
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
