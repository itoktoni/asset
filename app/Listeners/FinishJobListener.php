<?php

namespace App\Listeners;

use App\Dao\Models\Asset;
use App\Dao\Models\Core\User;
use App\Dao\Models\Notification;
use App\Dao\Models\Tiket;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Log;

class FinishJobListener
{
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(object $event): void
    {
        $data = $event->data;
        $teknisi = $data->has_user;
        $tiket = $data->has_tiket;

        // NAMING TIKET
        $description = $data->field_kesimpulan;
        $name = $teknisi->field_name;
        $link = route('tiket.getCode', ['code' => $tiket->field_code]);

        $message = 'PEKERJAAN SELESAI'.PHP_EOL.PHP_EOL;
        $message = $message.'Teknisi : '.$name.PHP_EOL;
        $message = $message.'Tiket : '.$tiket->field_code.PHP_EOL;
         // END NAMING TIKET

        if($creator = $tiket->{Tiket::field_user_id()})
        {
            $creator = User::find($creator);
        }

        if($asset_id = $data->field_asset_id)
        {
            $asset = Asset::with(['has_location'])->find($asset_id);

            // NAMING TIKET
            $message = $message.'Asset : '.$asset->field_name.PHP_EOL;

            if($asset->has_location)
            {
                $message = $message.'Ruangan : '.$asset->has_location->field_name.PHP_EOL;
            }

            $message = $message. 'Selesai : '.$link;

            // NOTIFICATION UNTUK PELAPOR
            if($creator)
            {
                if(!empty($creator->field_phone))
                {
                    Notification::create([
                        Notification::field_name() => $name,
                        Notification::field_address() => $creator->field_phone,
                        Notification::field_message() => $message,
                    ]);
                }
            }

            if($teknisi)
            {
                if(!empty($teknisi->field_phone))
                {
                    Notification::create([
                        Notification::field_name() => $name,
                        Notification::field_address() => $teknisi->field_phone,
                        Notification::field_message() => $message,
                    ]);
                }
            }
        }

        Log::info(json_encode($data, JSON_PRETTY_PRINT));
    }
}
