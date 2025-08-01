<?php

namespace App\Services;

use Plugins\Alert;
use Plugins\Notes;

class CreateMovementService
{
    public function save($model, $data)
    {
        $check = false;
        try {
            if(!empty($data->data))
            {
                $check = $model->insert($data->data);
            }
            else
            {
                unset($data['data'], $data['code']);
                $check = $model->saveRepository($data->all());
            }

            if ($check)
            {
                $check = Notes::create();
                Alert::create();
            }
            else
            {
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
