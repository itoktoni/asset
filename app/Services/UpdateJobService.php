<?php

namespace App\Services;

use App\Dao\Enums\JobStatusType;
use App\Dao\Enums\JobType;
use App\Dao\Models\Asset;
use App\Dao\Models\Job;
use Illuminate\Support\Carbon;
use Plugins\Alert;

class UpdateJobService
{
    public function update($model, $data, $code)
    {
        $check = $model->updateRepository($data->all(), $code);
        $job = Job::find($code);

        if($job->field_type == JobType::Kalibrasi)
        {
            $tanggal_kalibrasi = $data->tanggal_kalibrasi;
            if(!empty($tanggal_kalibrasi))
            {


                $next = Carbon::createFromDate($tanggal_kalibrasi)->addYear()->format('Y-m-d');
                Asset::find($job->job_id_asset)->update([
                    Asset::field_tanggal_expired() => $tanggal_kalibrasi,
                    Asset::field_next_expired() => $next,
                    Asset::field_sertifikat() => $name ?? null,
                ]);

                if (request()->has('sertifikat')) {
                    $file = request()->file('sertifikat');
                    $name = uploadFile($file, 'sertifikat');

                    $job->update([
                        Job::field_status() => JobStatusType::Selesai
                    ]);
                }
            }
        }

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
