<?php

namespace App\Http\Controllers;

use App\Dao\Enums\AssetStatusType;
use App\Dao\Enums\JobStatusType;
use App\Dao\Enums\JobType;
use App\Dao\Enums\PendanaanType;
use App\Dao\Models\Job;
use App\Dao\Models\Tiket;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\AssetModel;
use App\Facades\Model\DepartmentModel;
use App\Facades\Model\DistributorModel;
use App\Facades\Model\GroupModel;
use App\Facades\Model\LokasiModel;
use App\Facades\Model\PenamaanModel;
use App\Http\Requests\AssetRequest;
use App\Services\Core\UpdateAssetService;
use App\Services\Master\CreateService;
use App\Services\Master\UpdateService;
use Illuminate\Support\Carbon;
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
        $teknisi = GroupModel::getOptions();
        $location = LokasiModel::getOptions();
        $naming = PenamaanModel::getOptions();
        $distributor = DistributorModel::getOptions();
        $status = AssetStatusType::getOptions();
        $pendanaan = PendanaanType::getOptions();

        self::$share = [
            'pendanaan' => $pendanaan,
            'status' => $status,
            'distributor' => $distributor,
            'naming' => $naming,
            'location' => $location,
            'teknisi' => $teknisi,
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

        $model = $this->get($code);
        $tanggal_kunjungan = $this->tanggalKunjungan($model);

        return moduleView(modulePathForm(path: self::$is_core), $this->share([
            'model' => $model,
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

        $model = $this->get($code, ['has_job']);
        $job = Job::with(['has_user', 'has_saran'])
            ->where(Job::field_asset_id(), $model->field_primary)
            ->orderBy(Job::field_tanggal(), 'DESC')
            ->limit(10)
            ->get();

        return moduleView(modulePathForm('detail', 'asset'), $this->share([
            'model' => $model,
            'job' => $job,
        ]));
    }
}
