<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\LevelType;
use App\Dao\Enums\JobStatusType;
use App\Dao\Enums\JobType;
use App\Dao\Enums\TiketType;
use App\Dao\Models\Asset;
use App\Dao\Models\Job;
use App\Events\CreateTiketEvent;
use App\Events\FinishJobEvent;
use App\Facades\Model\AssetModel;
use App\Facades\Model\LokasiModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\JobModel;
use App\Facades\Model\SaranModel;
use App\Services\Core\UpdateAssetService;
use Plugins\Alert;
use Plugins\Query;

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
        $asset = Query::getAssetMap();
        $status = JobStatusType::getOptions();
        $saran = SaranModel::getOptions();

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
            'saran' => $saran,
            'status' => $status,
            'asset' => $asset,
            'location' => $location,
        ];
    }

    public function getSelesai($code)
    {
        $model = $this->get($code, ['has_tiket']);
        if($model && empty($model->field_kesimpulan))
        {
            Alert::error("Kesimpulan harus diisi !");
        }
        else{

            if($tiket = $model->has_tiket)
            {
                event(new FinishJobEvent($model));
            }

            Alert::update("Tiket di informasikan !");
        }

        return redirect()->back();
    }

    public function getApproval($code, UpdateAssetService $service)
    {
        $model = $this->get($code, ['has_tiket']);
        if($model && $this->checkApproval($model->has_tiket->field_user_id ?? false))
        {
            $asset = Asset::find($model->field_asset_id);
            if($model->field_type == JobType::Kalibrasi)
            {
                $asset->update([
                    Asset::field_tanggal_expired() => now()->addYear()->format('Y-m-d')
                ]);
            }

            if($model->field_type != JobType::Kalibrasi)
            {
                $service->calculate($asset);
            }

            $model->{Job::field_status()} = JobStatusType::Selesai;
            $model->{Job::field_finished_at()} = date('Y-m-d H:i:s');
            $model->save();

            Alert::update("Tiket di approve !");
        }

        return redirect()->back();
    }

    private function checkApproval($pelapor)
    {
        if(auth()->user()->level == LevelType::Admin)
        {
            return true;
        }

        if(auth()->user()->id == $pelapor)
        {
            return true;
        }

        return false;
    }
}
