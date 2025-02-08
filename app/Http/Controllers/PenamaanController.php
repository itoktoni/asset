<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\TechnologyType;
use App\Dao\Enums\Core\YesNoType;
use App\Dao\Models\Category;
use App\Dao\Models\Model;
use App\Facades\Model\BrandModel;
use App\Facades\Model\CategoryModel;
use App\Facades\Model\ModelModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\PenamaanModel;
use App\Facades\Model\SatuanModel;
use App\Http\Requests\AssetRequest;
use App\Services\Master\CreateService;
use App\Services\Master\UpdateService;
use Plugins\Response;

class PenamaanController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(PenamaanModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $brand = BrandModel::getOptions();
        $category = CategoryModel::getOptions();
        $type = ModelModel::getOptions();
        $satuan = SatuanModel::getOptions();
        $tech = TechnologyType::getOptions();

        self::$share = [
            'tech' => $tech,
            'satuan' => $satuan,
            'type' => $type,
            'category' => $category,
            'brand' => $brand,
        ];
    }
}
