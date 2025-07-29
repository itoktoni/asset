<?php

namespace App\Http\Controllers;

use App\Dao\Enums\HartaType;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\HartaModel;

class HartaController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(HartaModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $harta = HartaType::getOptions();

        self::$share = [
            'harta' => $harta,
        ];
    }
}
