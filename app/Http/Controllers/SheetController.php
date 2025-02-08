<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\TiketType;
use App\Facades\Model\AssetModel;
use App\Facades\Model\LocationModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\SheetModel;

class SheetController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(SheetModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $location = LocationModel::getOptions();
        $asset = AssetModel::getOptions();
        $status = TiketType::getOptions();

        self::$share = [
            'status' => $status,
            'asset' => $asset,
            'location' => $location,
        ];
    }
}
