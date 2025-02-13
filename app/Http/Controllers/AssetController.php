<?php

namespace App\Http\Controllers;

use App\Dao\Enums\AssetStatusType;
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
use App\Facades\Model\PenamaanModel;
use App\Http\Requests\AssetRequest;
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
        $status = AssetStatusType::getOptions();

        self::$share = [
            'status' => $status,
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

    public function postUpdate($code, AssetRequest $request, UpdateService $service)
    {
        $data = $service->update($this->model, $request, $code);
        $this->calculate($data['data'], $request);

        return Response::redirectBack($data);
    }

    private function calculate($model, $request)
    {
        $tanggal_kunjungan = $model->field_tanggal_kunjungan;

        if($request->total >= 20)
        {
            $next = Carbon::createFromDate($tanggal_kunjungan)->addDay(intval(365 / 3));
        }
        else if($request->total > 12 and $request->total <= 15)
        {
            $next = Carbon::createFromDate($tanggal_kunjungan)->addDay(intval(365 / 2));
        }
        else
        {
            $next = Carbon::createFromDate($tanggal_kunjungan)->addYear(1);
        }

        $model->asset_tanggal_kunjungan = $next->format('Y-m-d');
        $model->save();
    }

    private function insiden($model)
    {
        $total = Tiket::where(Tiket::field_asset_id(), $model->field_asset_id)->count();

        if($total == 0)
        {
            return -2;
        }
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

        return moduleView(modulePathForm('detail'), $this->share([
            'model' => $model,
            'job' => $job,
        ]));
    }
}
