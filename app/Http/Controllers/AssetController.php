<?php

namespace App\Http\Controllers;

use App\Dao\Enums\AssetStatusType;
use App\Dao\Enums\JobStatusType;
use App\Dao\Enums\JobType;
use App\Dao\Models\Job;
use App\Dao\Models\Tiket;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\AssetModel;
use App\Facades\Model\DepartmentModel;
use App\Facades\Model\GroupModel;
use App\Facades\Model\LokasiModel;
use App\Facades\Model\PenamaanModel;
use App\Http\Requests\AssetRequest;
use App\Services\Master\CreateService;
use App\Services\Master\UpdateService;
use Illuminate\Support\Carbon;
use Plugins\Response;

class AssetController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(AssetModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $department = DepartmentModel::getOptions();
        $teknisi = GroupModel::getOptions();
        $location = LokasiModel::getOptions();
        $naming = PenamaanModel::getOptions();
        $status = AssetStatusType::getOptions();

        self::$share = [
            'status' => $status,
            'naming' => $naming,
            'location' => $location,
            'teknisi' => $teknisi,
            'department' => $department,
        ];
    }

    public function postCreate(AssetRequest $request, CreateService $service)
    {
        $data = $service->save($this->model, $request);

        return Response::redirectBack($data);
    }

    public function getUpdate($code)
    {
        $this->beforeForm();
        $this->beforeUpdate($code);

        $model = $this->get($code);
        $tanggal_kunjungan = $this->tanggalKunjungan($model);

        return moduleView(modulePathForm(path: self::$is_core), $this->share([
            'model' => $model,
            'tanggal_kunjungan' => $tanggal_kunjungan,
        ]));
    }

    public function postUpdate($code, AssetRequest $request, UpdateService $service)
    {
        $data = $service->update($this->model, $request, $code);
        $model = $data['data'];
        $this->calculate($model, $request);

        return Response::redirectBack($data);
    }

    private function tanggalKunjungan($model)
    {
        $tanggal_kunjungan = $model->field_tanggal_diakui;

        $tiket = Tiket::select(Tiket::field_tanggal())
            ->where(Tiket::field_asset_id(), $model->field_primary)
            ->orderBy(Tiket::field_tanggal(), 'DESC')
            ->first();

        if($tiket && $tiket->field_tanggal)
        {
            $tanggal_kunjungan = $tiket->field_tanggal;
        }

        return $tanggal_kunjungan;
    }

    private function berapaKunjungan($model, $total)
    {
        $maintenance = $model->has_naming->field_angka_maintenance ?? 0;

        if ($total < 12)
        {
            return 0;
        }

        if ($total > 19)
        {
            return 3;
        }

        if ($total >= 15 || $maintenance >= 4)
        {
            return 2;
        }

        if($maintenance <= 3)
        {
           return 1;
        }

        if($maintenance == 0)
        {
           return 0;
        }

        return $maintenance;
    }

    private function calculate($model, $request)
    {
        $tanggal_kunjungan = $this->tanggalKunjungan($model);
        $penamaan = $model->has_naming ?? null;
        $total = 0;
        $insiden = $this->insiden($model);

        if($penamaan)
        {
            $total = ($penamaan->field_angka_fungsi + $penamaan->field_angka_aplikasi + $penamaan->field_angka_maintenance) + $insiden;
        }

        $berapa_kali = $this->berapaKunjungan($model, $total);

        $status = JobType::Inventaris;

        if($berapa_kali == 0 || $total <= 11)
        {
            $next = Carbon::createFromDate($tanggal_kunjungan)->addYear(1);
            $status = JobType::Promotif;
        }
        else if($total >= 12 and $total <= 14)
        {
            $next = Carbon::createFromDate($tanggal_kunjungan)->addDay(intval(365 / $berapa_kali));
            $status = JobType::Preventif;
        }
        else if($total > 12 and $total <= 15)
        {
            $next = Carbon::createFromDate($tanggal_kunjungan)->addDay(intval(365 / $berapa_kali));
            $status = JobType::Inspeksi;
        }
        else
        {
            $next = Carbon::createFromDate($tanggal_kunjungan)->addYear(1);
            $status = JobType::Inventaris;
        }

        $model->asset_tanggal_kunjungan = $next->format('Y-m-d');
        $model->save();
    }

    private function getTotalTiket($id, $tanggal)
    {
        $sekarang = now()->format('Y-m-d');

        return Tiket::where(Tiket::field_asset_id(), $id)
                ->whereBetween(Tiket::field_tanggal(), [$tanggal, $sekarang])
                ->count();

    }

    private function insiden($model)
    {
        $bulan_6 = now()->subMonths(6)->format('Y-m-d');
        $bulan_9 = now()->subMonths(9)->format('Y-m-d');
        $bulan_18 = now()->subMonths(18)->format('Y-m-d');
        $bulan_30 = now()->subMonths(30)->format('Y-m-d');

        if($this->getTotalTiket($model->field_primary, $bulan_6) > 0)
        {
            return 2;
        }

        if($this->getTotalTiket($model->field_primary, $bulan_9) > 0)
        {
            return 1;
        }

        if($this->getTotalTiket($model->field_primary, $bulan_18) > 0)
        {
            return 0;
        }

        if($this->getTotalTiket($model->field_primary, $bulan_30) > 0)
        {
            return -1;
        }

        return -2;
    }

    public function getPrint($code)
    {
        $this->beforeForm();
        $this->beforeUpdate($code);

        $model = $this->get($code);

        return moduleView(modulePathForm('print'), $this->share([
            'model' => $model,
        ]));
    }

    public function getDetail()
    {
        $code = request()->get('id');

        $this->beforeForm();
        $this->beforeUpdate($code);

        $model = $this->get($code, ['has_job']);
        $job = Job::with(['has_user', 'has_saran'])
            ->where(Job::field_asset_id(), $model->field_primary)
            ->orderBy(Job::field_tanggal(), 'DESC')
            ->limit(10)
            ->get();

        return moduleView(modulePathForm('detail', 'asset'), $this->share([
            'model' => $model,
            'job' => $job,
        ]));
    }
}
