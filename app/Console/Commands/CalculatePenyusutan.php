<?php

namespace App\Console\Commands;

use App\Dao\Models\Asset;
use App\Dao\Models\Penyusutan;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;

class CalculatePenyusutan extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'calculate:penyusutan';

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
        $data = Asset::select('*')
            ->leftJoinRelationship('has_penyusutan')
            ->whereNotNull(Asset::field_tanggal_penyusutan())
            ->whereMonth(Asset::field_tanggal_penyusutan(), '!=', date('m'))
            ->whereYear(Asset::field_tanggal_penyusutan(), date('Y'))
            ->orWhereNull(Asset::field_tanggal_penyusutan())
            ->limit(env('LIMIT_JOB', 10))
            ->get();

        foreach ($data as $item) {

            $nilai = 0;

            if (!empty($item->field_tanggal_diakui) && !empty($item->harta_id)) {

                $tanggal_diakui = Carbon::createFromFormat('Y-m-d', $item->field_tanggal_diakui);
                $masa_manfaat = $tanggal_diakui->addYear(intval($item->harta_manfaat));

                if (now() <= $masa_manfaat) {
                    $persentase_penyusutan = $item->harta_penyusutan / 100;
                    $harga_penyusutan = ($item->asset_harga_perolehan * $persentase_penyusutan) / 12;

                    Penyusutan::create([
                        Penyusutan::field_asset_id() => $item->field_primary,
                        Penyusutan::field_name() => date('Y-m-d'),
                        Penyusutan::field_value() => round($harga_penyusutan),
                    ]);

                    $nilai = $item->field_harga_perolehan - round($harga_penyusutan);
                }
            }

            Asset::find($item->field_primary)->update([
                Asset::field_tanggal_penyusutan() => date('Y-m-d'),
                Asset::field_harga_penyusutan() => $nilai,
            ]);

            // sleep(5);
        }

        $this->info("Notification Successfully Send");
    }

    private function calculate($asset)
    {
        $penyusutan = $asset->field_nilai_aset / $asset->field_lama_penyusutan;
        $tanggal = date('Y-m-d');
        $nilai = $penyusutan * (date('m') - date('m', strtotime($asset->field_tanggal_kunjungan)));

        if ($nilai > 0) {
            $asset->penyusutan()->create([
                'penyusutan_nilai' => $nilai,
                'penyusutan_tanggal' => $tanggal,
                'penyusutan_asset_id' => $asset->field_primary,
            ]);
        }
    }
}
