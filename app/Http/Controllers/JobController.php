<?php

namespace App\Http\Controllers;

use App\Dao\Enums\JobStatusType;
use App\Dao\Enums\TiketType;
use App\Facades\Model\AssetModel;
use App\Facades\Model\LokasiModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\JobModel;
use App\Facades\Model\SaranModel;

class JobController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(JobModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $location = LokasiModel::getOptions();
        $asset = AssetModel::getOptions();
        $status = JobStatusType::getOptions();
        $saran = SaranModel::getOptions();

        self::$share = [
            'saran' => $saran,
            'status' => $status,
            'asset' => $asset,
            'location' => $location,
        ];
    }
}
