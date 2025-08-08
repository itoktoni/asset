<?php

namespace App\Services;

use App\Dao\Models\Opname;
use App\Dao\Models\OpnameDetail;
use Plugins\Alert;

class UpdateCaptureService
{
    public function update($model, $data, $code)
    {
        $check = $model->updateRepository([
            Opname::field_capture_date() => now()
        ], $code);

        $exist = OpnameDetail::where(OpnameDetail::field_opname_id(), $code)->count();
        if($exist > 0)
        {
            Alert::error("Opname sudah di capture !");
            return;
        }

        $check = OpnameDetail::insert($data);

        if ($check) {
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
