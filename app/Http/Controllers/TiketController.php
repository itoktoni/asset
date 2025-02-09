<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\SheetType;
use App\Dao\Enums\TiketType;
use App\Dao\Enums\JobStatusType;
use App\Dao\Enums\JobType;
use App\Dao\Models\Job;
use App\Dao\Models\Sheet;
use App\Dao\Models\Tiket;
use App\Facades\Model\AssetModel;
use App\Facades\Model\CategoryModel;
use App\Facades\Model\LokasiModel;
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
        $location = LokasiModel::getOptions();
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
        $model->{Tiket::field_user()} = auth()->user()->id;
        $model->save();

        Job::updateOrCreate([
            Job::field_code() => $model->tiket_code,
            Job::field_tiket_id() => $model->field_primary,
            Job::field_asset_id() => $model->field_asset_id,
            Job::field_location_id() => $model->field_location_id,
            Job::field_description() => $model->field_description,
            Job::field_type() => JobType::Korektif,
        ], [
            Job::field_status() => JobStatusType::Ambil,
        ]);

        Alert::update("Tiket berhasil di ambil !");

        return redirect()->back();
    }
}
