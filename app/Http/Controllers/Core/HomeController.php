<?php

namespace App\Http\Controllers\Core;

use Alkhachatryan\LaravelWebConsole\LaravelWebConsole;
use App\Charts\Dashboard;
use App\Dao\Enums\Core\YesNoType;
use App\Dao\Enums\JobStatusType;
use App\Dao\Enums\JobType;
use App\Dao\Enums\KepemilikanType;
use App\Dao\Enums\MaintenanceType;
use App\Dao\Models\Asset;
use App\Dao\Models\Job;
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

        $total = Tiket::count();
        $baru = Tiket::whereNull(Tiket::field_user())->count();
        $proses = Tiket::whereNotNull(Tiket::field_user())->count();
        $selesai = Job::where(Job::field_status(), JobStatusType::Selesai())->count();

        $inspeksi = Job::where(Job::field_type(), JobType::Inspeksi)->count();
        $total_inspeksi = Job::where(Job::field_type(), JobType::Inspeksi)
            ->where(Job::field_status(), JobStatusType::Selesai())
            ->count();

        $preventif = Job::where(Job::field_type(), JobType::Preventif)->count();
        $total_preventif = Job::where(Job::field_type(), JobType::Preventif)
            ->where(Job::field_status(), JobStatusType::Selesai())
            ->count();


        $korektif = Job::where(Job::field_type(), JobType::Korektif)->count();
        $total_korektif = Job::where(Job::field_type(), JobType::Korektif)
            ->where(Job::field_status(), JobStatusType::Selesai())
            ->count();

        $total_ipm = Tiket::whereIn(Tiket::field_type(), [JobType::Inspeksi, JobType::Preventif])->count();

        $total_kalibrasi_belum_expired = Asset::where(Asset::field_tanggal_kalibrasi(), '>=', date('Y-m-d'))
            ->count();

        $total_kalibrasi_expired = Asset::where(Asset::field_tanggal_kalibrasi(), '<', date('Y-m-d'))->count();

        $kepemilikan = Asset::where(Asset::field_status_kepemilikan(), KepemilikanType::Internal)->count();
        $kso = Asset::where(Asset::field_status_kepemilikan(), KepemilikanType::KSO)->count();
        $lain = Asset::where(Asset::field_status_kepemilikan(), KepemilikanType::Lainnya)->count();

        $garansi = Asset::where(Asset::field_status_maintenance(), MaintenanceType::Garansi)->count();
        $kontrak = Asset::where(Asset::field_status_maintenance(), MaintenanceType::Kontrak)->count();
        $internal = Asset::where(Asset::field_status_maintenance(), MaintenanceType::Internal)->count();

        return view('core.home.dashboard', [
            'chart' => $chart->build(),
            'total' => $total,
            'baru' => $baru,
            'proses' => $proses,
            'selesai' => $selesai,

            'inspeksi' => $inspeksi,
            'total_inspeksi' => $total_inspeksi,

            'korektif' => $korektif,
            'total_korektif' => $total_korektif,

            'preventif' => $preventif,
            'total_preventif' => $total_preventif,

            'garansi' => $garansi,
            'kontrak' => $kontrak,
            'internal' => $internal,

            'kepemilikan' => $kepemilikan,
            'kso' => $kso,
            'lain' => $lain,

            'total_ipm' => $total_ipm,
            'total_kalibrasi_belum_expired' => $total_kalibrasi_belum_expired,
            'total_kalibrasi_expired' => $total_kalibrasi_expired,
        ]);
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
