<?php

namespace App\Listeners;

use App\Dao\Models\Asset;
use App\Dao\Models\Core\User;
use App\Dao\Models\Notification;
use App\Dao\Models\Tiket;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Log;

class CreateTiketListener
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

        // NAMING TIKET
        $description = $data->field_description;
        $pelapor = $data->field_pelapor;
        $link = route('tiket.getCode', ['code' => $data->field_code]);

        $message = 'TIKET DIBUAT'.PHP_EOL.PHP_EOL;
        $message = 'Pelapor : '.$pelapor.PHP_EOL;
        $message = 'Tiket : '.$data->field_code.PHP_EOL;
         // END NAMING TIKET

        if($creator = $data->{Tiket::field_user_id()})
        {
            $creator = User::find($creator);
        }

        if($asset_id = $data->field_asset_id)
        {
            $asset = Asset::with(['has_department', 'has_location', 'has_group'])->find($asset_id);

            // NAMING TIKET
            $message = $message.'Asset : '.$asset->field_name.PHP_EOL;

            if($asset->has_location)
            {
                $message = $message.'Ruangan : '.$asset->has_location->field_name.PHP_EOL;
            }

            $message = $message. 'Keterangan : '.$description.PHP_EOL.PHP_EOL;
            $message = $message. 'Link : '.$link;

            // END NAMING TIKET

            $group = $asset->has_group;

            if(!empty($group->has_user))
            {
                foreach ($group->has_user as $user)
                {
                    if(!empty($user->field_phone))
                    {
                        Notification::create([
                            Notification::field_name() => $pelapor,
                            Notification::field_address() => $user->field_phone,
                            Notification::field_message() => $message,
                        ]);
                    }
                }
            }

        }

        Log::info(json_encode($data, JSON_PRETTY_PRINT));
    }
}
