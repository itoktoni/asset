<?php

namespace App\Services;

use Plugins\Alert;

class UpdatePenamaanService
{
    public function update($model, $data, $code)
    {
        $check = $model->updateRepository($data->all(), $code);

        if ($check['status']) {
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
