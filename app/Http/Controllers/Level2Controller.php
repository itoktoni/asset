<?php

namespace App\Http\Controllers;

use App\Dao\Models\Level1;
use App\Dao\Models\Level2;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\Level2Model;

class Level2Controller extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(Level2Model $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $level1 = Level1::getOptions();

        self::$share = [
            'level1' => $level1,
        ];
    }

}
