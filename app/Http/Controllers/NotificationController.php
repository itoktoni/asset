<?php

namespace App\Http\Controllers;

use App\Dao\Enums\JobStatusType;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\NotificationModel;

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
}
