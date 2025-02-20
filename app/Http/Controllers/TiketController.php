<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\SheetType;
use App\Dao\Enums\TiketType;
use App\Dao\Enums\JobStatusType;
use App\Dao\Enums\JobType;
use App\Dao\Models\Asset;
use App\Dao\Models\Job;
use App\Dao\Models\Sheet;
use App\Dao\Models\Tiket;
use App\Events\CreateTiketEvent;
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
        $selected_asset = $selected_location = null;

        if($id = request()->get('id'))
        {
            $data_asset = Asset::find($id);
            $selected_asset = $data_asset->field_primary;
            $selected_location = $data_asset->field_location_id;
        }

        self::$share = [
            'selected_asset' => $selected_asset,
            'selected_location' => $selected_location,
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

    public function getCreate()
    {
        $this->beforeForm();
        $this->beforeCreate();

        return moduleView(modulePathForm(path: self::$is_core), $this->share());
    }

    public function postUpdate($code, TiketRequest $request, UpdateService $service)
    {
        $data = $service->update($this->model, $request, $code);

        return Response::redirectBack($data);
    }

    public function getCode($code) //use by whatsapp when url click
    {
        $this->beforeForm();
        $model = Tiket::with(['has_job', 'has_job.has_user'])->where(Tiket::field_code(), $code)->first();

        return moduleView(modulePathForm(), $this->share([
            'model' => $model,
        ]));
    }

    public function getAmbil($code)
    {
        $model = $this->get($code);
        $model->{Tiket::field_user()} = auth()->user()->id;
        $model->save();

        Job::updateOrCreate([
            Job::field_assign_id() => auth()->user()->id,
            Job::field_tiket_id() => $model->field_primary,

        ], [
            Job::field_type() => $model->field_type,
            Job::field_status() => JobStatusType::Ambil,
            Job::field_asset_id() => $model->field_asset_id,
            Job::field_location_id() => $model->field_location_id,
            Job::field_description() => $model->field_description,
        ]);

        Alert::update("Tiket berhasil di ambil !");

        return redirect()->back();
    }
}
