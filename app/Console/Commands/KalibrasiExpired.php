<?php

namespace App\Console\Commands;

use App\Dao\Enums\JobType;
use App\Dao\Models\Asset;
use App\Dao\Models\Tiket;
use Illuminate\Console\Command;

class KalibrasiExpired extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cek:kalibrasi';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $today = date('Y-m-d');
        $kalibrasi = now()->addMonth()->format('Y-m-d');

        $data = Asset::with(['has_location.has_user'])
            ->whereYear(Asset::field_tanggal_kalibrasi(), date('Y'))
            ->where(Asset::field_tanggal_kalibrasi(), $kalibrasi)
            ->whereNot(Asset::field_cek_kalibrasi(), $today)
            ->orWhereNull(Asset::field_cek_kalibrasi())
            ->whereYear(Asset::field_tanggal_kalibrasi(), date('Y'))
            ->where(Asset::field_tanggal_kalibrasi(), $kalibrasi)
            ->limit(env('LIMIT_JADWAL', 10))
            ->get();

        foreach ($data as $item)
        {
            Tiket::create([
                Tiket::field_pelapor() => $item->has_user->name ?? 'System',
                Tiket::field_name() => $item->field_name ?? '',
                Tiket::field_user_id() => $item->has_user->id ?? 1,
                Tiket::field_tanggal() => $today,
                Tiket::field_type() => JobType::Kalibrasi,
                Tiket::field_location_id() => $item->field_location_id,
                Tiket::field_asset_id() => $item->field_primary,
                Tiket::field_description() => 'Sudah waktunya Kalibrasi'.PHP_EOL.'Tanggal Kalibrasi '.formatDate($item->field_tanggal_kalibrasi),
            ]);

            Asset::find($item->field_primary)->update([
               Asset::field_cek_kalibrasi() => $today
            ]);

            sleep(3);
        }

        $this->info("Notification Successfully Send");
    }
}
