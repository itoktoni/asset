<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use Plugins\Alert;
use Plugins\Notes;

class CreateRegisterService
{
    public function save($model, $data)
    {
        $check = false;
        try {
            $check = $model->insert($data->rfid);

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
