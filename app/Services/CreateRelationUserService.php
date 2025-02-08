<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use Plugins\Alert;

class CreateRelationUserService
{
    public function save($model, $data)
    {
        $check = false;
        try {
            $check = $model->saveRepository($data->all());
            $model->find(DB::getPdo()->lastInsertId())->has_user()->sync($data->user);

            if (isset($check['status']) && $check['status']) {

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
