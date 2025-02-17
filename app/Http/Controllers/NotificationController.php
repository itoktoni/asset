<?php

namespace App\Http\Controllers;

use App\Contracts\NotificationInterface;
use App\Dao\Enums\JobStatusType;
use App\Facades\Model\NotificationModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use Plugins\Alert;
use Plugins\Notes;

class NotificationController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(NotificationModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $status = JobStatusType::getOptions();

        self::$share = [
            'status' => $status,
        ];
    }

    public function getSend($code, NotificationInterface $service)
    {
        $model = $this->get($code);

        $check = $service->send($model->notification_nama, $model->notification_alamat, $model->notification_pesan, $model->notification_gambar);
        $cek = json_decode($check);

        if(isset($cek['status']) && $cek['status'])
        {
            $model->notification_status = JobStatusType::Selesai;
            $model->notification_tanggal = date('Y-m-d');
            $model->notification_response = $check;
            $model->save();

            Alert::info("Notification Berhasil terkirim !");
        }
        else
        {
            Alert::error("Notification Gagal terkirim !");
        }


        return redirect()->back();
    }

}
