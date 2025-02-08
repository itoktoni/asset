<?php

namespace App\Services;

use Plugins\Alert;

class UpdateRelationUserService
{
    public function update($model, $data, $code)
    {
        $check = $model->updateRepository($data->all(), $code);
        $check['data']->has_user()->sync($data->user);

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
