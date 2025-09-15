<?php
namespace App\Console\Commands;

use App\Contracts\NotificationInterface;
use App\Dao\Enums\CycleType;
use App\Dao\Models\AssetDetail;
use App\Jobs\SendAssetNotification;
use Illuminate\Console\Command;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class AlarmAsset extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'alarm:asset';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     */
    public function handle(NotificationInterface $notification)
    {
        $date  = now();
        $query = AssetDetail::query()
            ->whereNotNull(AssetDetail::field_setiap())
            ->where(AssetDetail::field_start(), '<=', $date->format('Y-m-d'))
            ->where(AssetDetail::field_end(), '>=', $date->format('Y-m-d'))
            ->where(AssetDetail::field_check(), '<=', $date)
            ->whereColumn(DB::raw('date(asset_detail_check)'), '<=', AssetDetail::field_end())
            ->showSql()
            ->get();

        if (! empty($query)) {
            foreach ($query as $data) {
                $banyak = $data->field_banyak;
                $setiap = $data->field_setiap;
                $check  = $data->field_check;

                if (! empty($check)) {
                    $carbon = Carbon::parse($check);

                    switch ($setiap) {
                        case CycleType::Menit:
                            $parse = $carbon->addMinutes($banyak)->format('Y-m-d H:i:s');
                            break;
                        case CycleType::Jam:
                            $parse = $carbon->addHours($banyak)->format('Y-m-d H:i:s');
                            break;
                        case CycleType::Hari:
                            $parse = $carbon->addDays($banyak)->format('Y-m-d H:i:s');
                            break;
                        case CycleType::Minggu:
                            $parse = $carbon->addWeeks($banyak)->format('Y-m-d H:i:s');
                            break;
                        case CycleType::Bulan:
                            $parse = $carbon->addMonths($banyak)->format('Y-m-d H:i:s');
                            break;
                        case CycleType::Tahun:
                            $parse = $carbon->addYears($banyak)->format('Y-m-d H:i:s');
                            break;
                        default:
                            continue 2; // Skip if unknown cycle type
                    }

                    SendAssetNotification::dispatch($data);

                    $data->asset_detail_check = $parse;
                    $data->save();
                }
            }
        }


        $this->info("\nNotification Successfully Send");
    }
}
