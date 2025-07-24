<?php

namespace App\Http\Controllers;

use App\Dao\Enums\AssetStatusType;
use App\Dao\Enums\Core\YesNoType;
use App\Dao\Enums\KepemilikanType;
use App\Dao\Enums\MaintenanceType;
use App\Dao\Enums\PendanaanType;
use App\Dao\Models\Job;
use App\Dao\Models\Tiket;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\AssetModel;
use App\Facades\Model\DepartmentModel;
use App\Facades\Model\GroupModel;
use App\Facades\Model\LokasiModel;
use App\Facades\Model\StatusModel;
use App\Facades\Model\VendorModel;
use App\Http\Requests\AssetRequest;
use App\Services\Core\UpdateAssetService;
use App\Services\Master\CreateService;
use Illuminate\Support\Facades\Http;
use Plugins\Query;
use Plugins\Response;

class AssetController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(AssetModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $department = DepartmentModel::getOptions();
        $type = Query::getModelMap();
        $teknisi = GroupModel::getOptions();
        $location = Query::getLocationMap();
        $naming = Query::getPenamaanMap();
        $vendor = VendorModel::getOptions();
        $status = StatusModel::getOptions();
        $pendanaan = PendanaanType::getOptions();
        $maintenance = MaintenanceType::getOptions();
        $kepemilikan = KepemilikanType::getOptions();
        $kalibrasi = YesNoType::getOptions();

        self::$share = [
            'kalibrasi' => $kalibrasi,
            'kepemilikan' => $kepemilikan,
            'maintenance' => $maintenance,
            'pendanaan' => $pendanaan,
            'status' => $status,
            'vendor' => $vendor,
            'naming' => $naming,
            'location' => $location,
            'teknisi' => $teknisi,
            'type' => $type,
            'department' => $department,
        ];
    }

    public function postCreate(AssetRequest $request, CreateService $service)
    {
        $data = $service->save($this->model, $request);

        return Response::redirectBack($data);
    }

    private function tanggalKunjungan($model)
    {
        $tanggal_kunjungan = $model->field_tanggal_diakui;

        $tiket = Tiket::select(Tiket::field_tanggal())
            ->where(Tiket::field_asset_id(), $model->field_primary)
            ->orderBy(Tiket::field_tanggal(), 'DESC')
            ->first();

        if($tiket && $tiket->field_tanggal)
        {
            $tanggal_kunjungan = $tiket->field_tanggal;
        }

        return $tanggal_kunjungan;
    }

    public function getUpdate($code)
    {
        $this->beforeForm();
        $this->beforeUpdate($code);

        $model = $this->get($code, ['has_penamaan']);
        $is_kalibrasi = $model->has_penamaan->field_kalibrasi ?? YesNoType::No;

        $tanggal_kunjungan = $this->tanggalKunjungan($model);
        $status_expired = statusExpired($model->field_next_expired);

        return moduleView(modulePathForm(path: self::$is_core), $this->share([
            'model' => $model,
            'status_expired' => $status_expired,
            'is_kalibrasi' => $is_kalibrasi,
            'tanggal_kunjungan' => $tanggal_kunjungan,
        ]));
    }

    public function postUpdate($code, AssetRequest $request, UpdateAssetService $service)
    {
        $data = $service->update($this->model, $request, $code);
        return Response::redirectBack($data);
    }

    public function getPrint($code)
    {
        $this->beforeForm();
        $this->beforeUpdate($code);

        $model = $this->get($code);

        return moduleView(modulePathForm('print'), $this->share([
            'model' => $model,
        ]));
    }

    public function getDetail()
    {
        $code = request()->get('id');

        $this->beforeForm();
        $this->beforeUpdate($code);

        $model = $this->get($code, ['has_job', 'has_location']);
        if(empty($model->field_sertifikat))
        {
            $client = Http::asForm()->post('https://ecm.co.id/sertifikat/view_trx', [
                'kode' => $model->field_code
            ]);

            $url = null;

            if($client->status() == 200)
            {
                $data = $client->body();
                $parser = json_decode($data);
                if(isset($parser->url) && !empty($parser->url))
                {
                    $url = $parser->url;
                }
            }
        }
        else
        {
            $url = fileUrl($model->field_sertifikat, 'sertifikat');
        }


        $job = Job::with(['has_user', 'has_saran'])
            ->where(Job::field_asset_id(), $model->field_primary)
            ->orderBy(Job::field_tanggal(), 'DESC')
            ->limit(10)
            ->get();

        return moduleView(modulePathForm('detail', 'asset'), $this->share([
            'model' => $model,
            'job' => $job,
            'url' => $url,
        ]));
    }
}
