<?php

namespace App\Http\Controllers\Core;

use Alkhachatryan\LaravelWebConsole\LaravelWebConsole;
use App\Charts\Dashboard;
use App\Dao\Enums\Core\LevelType;
use App\Dao\Enums\Core\RoleType;
use App\Dao\Enums\Core\YesNoType;
use App\Dao\Enums\JobStatusType;
use App\Dao\Enums\JobType;
use App\Dao\Enums\KepemilikanType;
use App\Dao\Enums\MaintenanceType;
use App\Dao\Models\Asset;
use App\Dao\Models\Job;
use App\Dao\Models\Level3;
use App\Dao\Models\Tiket;
use App\Dao\Traits\RedirectAuth;
use App\Http\Controllers\Controller;

class HomeController extends Controller
{
    use RedirectAuth;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        if (auth()->check()) {
            return redirect()->route('login');
        }
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index(Dashboard $chart)
    {
        if (empty(auth()->user())) {
            header('Location: '.route('public'));
        }

        $data = [];

        if(env('MAINTENANCE', false))
        {
            $total = Tiket::query();
            $baru = Tiket::whereNull(Tiket::field_user());
            $proses = Job::where(Job::field_status(), '!=', JobStatusType::Selesai());
            $selesai = Job::where(Job::field_status(), JobStatusType::Selesai());

            if(auth()->user()->level == LevelType::Pengguna)
            {
                $total = $total->where(Tiket::CREATED_BY, auth()->user()->id);
                $baru = $baru->where(Tiket::CREATED_BY, auth()->user()->id);
                $proses = $proses->leftJoinRelationship('has_tiket')->where(Tiket::CREATED_BY, auth()->user()->id);
                $selesai = $selesai->leftJoinRelationship('has_tiket')->where(Tiket::CREATED_BY, auth()->user()->id);
            }

            if(!empty(auth()->user()->lokasi))
            {
                $total = $total->where(Tiket::field_location_id(), auth()->user()->lokasi);
                $baru = $baru->where(Tiket::field_location_id(), auth()->user()->lokasi);
                $proses = $proses->where(Job::field_location_id(), auth()->user()->lokasi);
                $selesai = $selesai->where(Job::field_location_id(), auth()->user()->lokasi);
            }

            if(env('LEVELING', false))
            {
                $total = $total->joinRelationship('has_location.has_level');
                $baru = $baru->joinRelationship('has_location.has_level');
                $proses = $proses->joinRelationship('has_location.has_level');
                $selesai = $selesai->joinRelationship('has_location.has_level');

                if(!empty(auth()->user()->level3))
                {
                    $total = $total->where(Level3::field_primary(), auth()->user()->level3);
                    $baru = $baru->where(Level3::field_primary(), auth()->user()->level3);
                    $proses = $proses->where(Level3::field_primary(), auth()->user()->level3);
                    $selesai = $selesai->where(Level3::field_primary(), auth()->user()->level3);
                }
            }

            //INSPEKSI

            $inspeksi = Job::where(Job::field_type(), JobType::Inspeksi);
            $total_inspeksi = Job::where(Job::field_type(), JobType::Inspeksi)
                ->where(Job::field_status(), JobStatusType::Selesai());

            $preventif = Job::where(Job::field_type(), JobType::Preventif);
            $total_preventif = Job::where(Job::field_type(), JobType::Preventif)
                ->where(Job::field_status(), JobStatusType::Selesai());

            if(!empty(auth()->user()->lokasi))
            {
                $inspeksi = $inspeksi->where(Job::field_location_id(), auth()->user()->lokasi);
                $total_inspeksi = $total_inspeksi->where(Job::field_location_id(), auth()->user()->lokasi);
                $preventif = $preventif->where(Job::field_location_id(), auth()->user()->lokasi);
                $total_preventif = $total_preventif->where(Job::field_location_id(), auth()->user()->lokasi);
            }

            if(env('LEVELING', false))
            {
                $inspeksi = $inspeksi->joinRelationship('has_location.has_level');
                $total_inspeksi = $total_inspeksi->joinRelationship('has_location.has_level');
                $preventif = $preventif->joinRelationship('has_location.has_level');
                $total_preventif = $total_preventif->joinRelationship('has_location.has_level');

                if(!empty(auth()->user()->level3))
                {
                    $inspeksi = $inspeksi->where(Level3::field_primary(), auth()->user()->level3);
                    $total_inspeksi = $total_inspeksi->where(Level3::field_primary(), auth()->user()->level3);
                    $preventif = $preventif->where(Level3::field_primary(), auth()->user()->level3);
                    $total_preventif = $total_preventif->where(Level3::field_primary(), auth()->user()->level3);
                }
            }


            //KOREKTIF
            $korektif = Job::where(Job::field_type(), JobType::Korektif);
            $total_korektif = Job::where(Job::field_type(), JobType::Korektif)->where(Job::field_status(), JobStatusType::Selesai());

            $total_ipm = Asset::where(Asset::field_tanggal_kunjungan(), '>=', date('Y-m-d'))->whereIn(Asset::field_status_kunjungan(), [JobType::Inspeksi, JobType::Preventif]);
            $total_kalibrasi_belum_expired = Asset::where(Asset::field_next_expired(), '>=', date('Y-m-d'));
            $total_kalibrasi_expired = Asset::where(Asset::field_next_expired(), '<', date('Y-m-d'));

            if(!empty(auth()->user()->lokasi))
            {
                $korektif = $korektif->where(Job::field_location_id(), auth()->user()->lokasi);
                $total_korektif = $total_korektif->where(Job::field_location_id(), auth()->user()->lokasi);

                $total_ipm = $total_ipm->where(Asset::field_location_id(), auth()->user()->lokasi);
                $total_kalibrasi_belum_expired = $total_kalibrasi_belum_expired->where(Asset::field_location_id(), auth()->user()->lokasi);
                $total_kalibrasi_expired = $total_kalibrasi_expired->where(Asset::field_location_id(), auth()->user()->lokasi);
            }

            if(env('LEVELING', false))
            {
                $korektif = $korektif->joinRelationship('has_location.has_level');
                $total_korektif = $total_korektif->joinRelationship('has_location.has_level');

                $total_ipm = $total_ipm->joinRelationship('has_location.has_level');
                $total_kalibrasi_belum_expired = $total_kalibrasi_belum_expired->joinRelationship('has_location.has_level');
                $total_kalibrasi_expired = $total_kalibrasi_expired->joinRelationship('has_location.has_level');

                if(!empty(auth()->user()->level3))
                {
                    $korektif = $korektif->where(Level3::field_primary(), auth()->user()->level3);
                    $total_korektif = $total_korektif->where(Level3::field_primary(), auth()->user()->level3);

                    $total_ipm = $total_ipm->where(Level3::field_primary(), auth()->user()->level3);
                    $total_kalibrasi_belum_expired = $total_kalibrasi_belum_expired->where(Level3::field_primary(), auth()->user()->level3);
                    $total_kalibrasi_expired = $total_kalibrasi_expired->where(Level3::field_primary(), auth()->user()->level3);
                }
            }

            // KEPEMILIKAN

            $kepemilikan = Asset::where(Asset::field_status_kepemilikan(), KepemilikanType::Internal);
            $kso = Asset::where(Asset::field_status_kepemilikan(), KepemilikanType::KSO);
            $lain = Asset::where(Asset::field_status_kepemilikan(), KepemilikanType::Lainnya);

            $garansi = Asset::where(Asset::field_status_maintenance(), MaintenanceType::Garansi);
            $kontrak = Asset::where(Asset::field_status_maintenance(), MaintenanceType::Kontrak);
            $internal = Asset::where(Asset::field_status_maintenance(), MaintenanceType::Internal);

            if(!empty(auth()->user()->lokasi))
            {
                $kso = $kso->where(Asset::field_location_id(), auth()->user()->lokasi);
                $lain = $lain->where(Asset::field_location_id(), auth()->user()->lokasi);

                $garansi = $garansi->where(Asset::field_location_id(), auth()->user()->lokasi);
                $kontrak = $kontrak->where(Asset::field_location_id(), auth()->user()->lokasi);
                $internal = $internal->where(Asset::field_location_id(), auth()->user()->lokasi);
            }

            if(env('LEVELING', false))
            {
                $kso = $kso->joinRelationship('has_location.has_level');
                $lain = $lain->joinRelationship('has_location.has_level');
                $garansi = $garansi->joinRelationship('has_location.has_level');
                $kontrak = $kontrak->joinRelationship('has_location.has_level');
                $internal = $internal->joinRelationship('has_location.has_level');

                if(!empty(auth()->user()->level3))
                {
                    $kso = $kso->where(Level3::field_primary(), auth()->user()->level3);
                    $lain = $lain->where(Level3::field_primary(), auth()->user()->level3);
                    $garansi = $garansi->where(Level3::field_primary(), auth()->user()->level3);
                    $kontrak = $kontrak->where(Level3::field_primary(), auth()->user()->level3);
                    $internal = $internal->where(Level3::field_primary(), auth()->user()->level3);
                }
            }

            $data = [
                'chart' => $chart->build(),
                'total' => $total->count(),
                'baru' => $baru->count(),
                'proses' => $proses->count(),
                'selesai' => $selesai->count(),
                'inspeksi' => $inspeksi->count(),
                'total_inspeksi' => $total_inspeksi->count(),
                'korektif' => $korektif->count(),
                'total_korektif' => $total_korektif->count(),
                'preventif' => $preventif->count(),
                'total_preventif' => $total_preventif->count(),
                'garansi' => $garansi->count(),
                'kontrak' => $kontrak->count(),
                'internal' => $internal->count(),
                'kepemilikan' => $kepemilikan->count(),
                'kso' => $kso->count(),
                'lain' => $lain->count(),
                'total_ipm' => $total_ipm->count(),
                'total_kalibrasi_belum_expired' => $total_kalibrasi_belum_expired->count(),
                'total_kalibrasi_expired' => $total_kalibrasi_expired->count(),
            ];
        }

        return view('core.home.dashboard', $data);
    }

    public function delete($code)
    {
        $navigation = session()->get('navigation');
        if (! empty($navigation) && array_key_exists($code, $navigation)) {
            unset($navigation[$code]);
            session()->put('navigation', $navigation);
        }

        return redirect()->back();
    }

    public function console()
    {
        return LaravelWebConsole::show();
    }

    public function doc()
    {
        return view('doc');
    }

    public function error402()
    {
        return view('errors.402');
    }
}
