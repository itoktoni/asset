<?php

namespace App\Http\Controllers;

use App\Facades\Model\AreaModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\LokasiModel;
use App\Http\Requests\LokasiRequest;
use App\Http\Requests\PenamaanRequest;
use App\Services\Master\CreateService;
use App\Services\Master\UpdateService;
use Plugins\Response;

class LokasiController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(LokasiModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $area = AreaModel::getOptions();

        self::$share = [
            'area' => $area,
        ];
    }

    public function postCreate(LokasiRequest $request, CreateService $service)
    {
        $data = $service->save($this->model, $request);

        return Response::redirectBack($data);
    }

    public function postUpdate($code, LokasiRequest $request, UpdateService $service)
    {
        $data = $service->update($this->model, $request, $code);

        return Response::redirectBack($data);
    }
}
