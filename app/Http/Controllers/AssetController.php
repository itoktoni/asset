<?php

namespace App\Http\Controllers;

use App\Dao\Enums\AssetStatusType;
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

        return Response::redirectBack($data);
    }
}
