<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\BrandModel;
use App\Http\Requests\BrandRequest;
use App\Services\Master\CreateService;
use Plugins\Response;

class BrandController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(BrandModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    public function postCreate(BrandRequest $request, CreateService $service)
    {
        $data = $service->save($this->model, $request);

        return Response::redirectBack($data);
    }

}
