<?php

namespace App\Http\Controllers;

use App\Dao\Enums\TechnologyType;
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
use App\Http\Requests\PenamaanRequest;
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

        $fungsi = array_combine(range(1,10), range(1,10));
        $aplikasi = array_combine(range(1,5), range(1,5));
        $maintenance = array_combine(range(1,5), range(1,5));

        self::$share = [
            'maintenance' => $maintenance,
            'aplikasi' => $aplikasi,
            'fungsi' => $fungsi,
            'tech' => $tech,
            'satuan' => $satuan,
            'type' => $type,
            'category' => $category,
            'brand' => $brand,
        ];
    }

    public function postCreate(PenamaanRequest $request, CreateService $service)
    {
        $data = $service->save($this->model, $request);

        return Response::redirectBack($data);
    }

    public function postUpdate($code, PenamaanRequest $request, UpdateService $service)
    {
        $data = $service->update($this->model, $request, $code);

        return Response::redirectBack($data);
    }
}
