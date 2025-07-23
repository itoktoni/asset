<?php

namespace App\Console\Commands;

use App\Dao\Models\Asset;
use App\Dao\Models\Tiket;
use App\Services\Core\UpdateAssetService;
use Illuminate\Console\Command;

class JadwalMaintenance extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cek:jadwal';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle(UpdateAssetService $service)
    {
        $today = date('Y-m-d');
        $jadwal = now()->addDay()->format('Y-m-d');

        $data = Asset::with(['has_location.has_user'])
            ->whereYear(Asset::field_tanggal_kunjungan(), date('Y'))
            ->where(Asset::field_tanggal_kunjungan(), $jadwal)
            ->whereNot(Asset::field_cek_jadwal(), $today)
            ->orWhereNull(Asset::field_cek_jadwal())
            ->whereYear(Asset::field_tanggal_kunjungan(), date('Y'))
            ->where(Asset::field_tanggal_kunjungan(), $jadwal)
            ->limit(env('LIMIT_JADWAL', 10))
            ->get();

        foreach ($data as $item) {

            $asset = Asset::find($item->field_primary);
            $service->calculate($asset);

            $asset->update([
                Asset::field_cek_jadwal() => $today,
            ]);

            if($asset->field_tanggal_kunjungan == $jadwal)
            {
                $status = $item->asset_status_kunjungan;
                Tiket::create([
                    Tiket::field_pelapor() => $item->has_user->name ?? 'System',
                    Tiket::field_name() => $item->field_name ?? '',
                    Tiket::field_user_id() => $item->has_user->id ?? 1,
                    Tiket::field_tanggal() => $today,
                    Tiket::field_type() => $status,
                    Tiket::field_location_id() => $item->field_location_id,
                    Tiket::field_asset_id() => $item->field_primary,
                    Tiket::field_description() => 'Penjadwalan otomatis untuk pekerjaan ' . $status,
                ]);

                sleep(3);
            }
        }

        $this->info("Notification Successfully Send");
    }
}
