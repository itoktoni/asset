<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\SheetType;
use App\Dao\Enums\Core\TiketType;
use App\Dao\Models\Sheet;
use App\Facades\Model\AssetModel;
use App\Facades\Model\CategoryModel;
use App\Facades\Model\LocationModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\TiketModel;
use App\Http\Requests\Core\GeneralRequest;
use App\Http\Requests\TiketRequest;
use App\Services\Master\CreateService;
use App\Services\Master\UpdateService;
use Plugins\Alert;
use Plugins\Response;

class TiketController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(TiketModel $model, SingleService $service)
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

    public function postCreate(TiketRequest $request, CreateService $service)
    {
        $data = $service->save($this->model, $request);

        return Response::redirectBack($data);
    }

    public function postUpdate($code, TiketRequest $request, UpdateService $service)
    {
        $data = $service->update($this->model, $request, $code);

        return Response::redirectBack($data);
    }

    public function getAmbil($code)
    {
        $model = $this->get($code);

        Sheet::create([
            Sheet::field_code() => $model->tiket_code,
            Sheet::field_status() => SheetType::Proses,
            Sheet::field_tiket_id() => $model->field_primary,
            Sheet::field_asset_id() => $model->field_asset_id,
            Sheet::field_location_id() => $model->field_location_id,
            Sheet::field_description() => $model->field_description,
            'sheet_checked_at' => date('Y-m-d H:i:s'),
            'sheet_checked_by' => auth()->user()->id,
        ]);

        Alert::update("Tiket berhasil di ambil !");

        return redirect()->back();
    }
}
