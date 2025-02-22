<?php

namespace App\Services\Core;

use App\Dao\Enums\JobType;
use App\Dao\Models\Tiket;
use Carbon\Carbon;
use Illuminate\Support\Facades\Session;
use Plugins\Alert;

class UpdateAssetService
{
    public function update($repository, $data, $code)
    {
        $check = $repository->updateRepository($data->all(), $code);
        if ($check['status']) {

            $model = $check['data'];
            $this->calculate($model);

            if (request()->wantsJson()) {
                return response()->json($check)->getData();
            }
            Alert::update();
        } else {
            Alert::error($check['message']);
        }

        return $check;
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

    public function calculate($model)
    {
        $tanggal_kunjungan = $this->tanggalKunjungan($model);
        $penamaan = $model->has_naming ?? null;
        $total = 0;
        $insiden = $this->insiden($model);
        $em1 = ($penamaan->field_angka_fungsi + $penamaan->field_angka_aplikasi + $penamaan->field_angka_maintenance);

        if(empty($tanggal_kunjungan))
        {
            return;
        }

        if($penamaan)
        {
            $total = $em1 + $insiden;
        }

        $berapa_kali = $this->berapaKunjungan($model, $total);

        $status = JobType::Inventaris;
        $next = null;

        if($berapa_kali == 0 || $total <= 11)
        {
            $next = null;
            $status = JobType::Promotif;
        }
        else if($total >= 12 and $total <= 14)
        {
            $next = Carbon::createFromDate($tanggal_kunjungan)->addDay(round(365 / $berapa_kali))->format('Y-m-d');
            $status = JobType::Preventif;
        }
        else if($total > 12 and $total <= 15)
        {
            $next = Carbon::createFromDate($tanggal_kunjungan)->addDay(round(365 / $berapa_kali))->format('Y-m-d');
            $status = JobType::Inspeksi;
        }
        else
        {
            $next = null;
            $status = JobType::Inventaris;
        }

        $model->asset_status_kunjungan = $status;
        $model->asset_tanggal_kunjungan = $next;
        $model->save();
    }

    private function getTotalTiket($id, $tanggal)
    {
        $sekarang = now()->format('Y-m-d');

        return Tiket::where(Tiket::field_asset_id(), $id)
                ->where(Tiket::field_type(), JobType::Korektif)
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
}
