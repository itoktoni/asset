<?php

namespace App\Http\Controllers;

use App\Dao\Models\Core\User;
use App\Dao\Models\Level2;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\Level3Model;

class Level3Controller extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(Level3Model $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $level2 = Level2::getOptions();
        $user = User::getOptions();

        self::$share = [
            'user' => $user,
            'level2' => $level2,
        ];
    }
}
