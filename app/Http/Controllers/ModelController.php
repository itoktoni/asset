<?php

namespace App\Http\Controllers;

use App\Facades\Model\BrandModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\ModelModel;

class ModelController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(ModelModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $brand = BrandModel::getOptions();

        self::$share = [
            'brand' => $brand,
        ];
    }
}
