<?php

namespace App\Services;

use App\Dao\Enums\NotificationType;
use App\Dao\Models\Asset;
use App\Dao\Models\Notification;
use Plugins\Alert;

class CreateNotificationTiketService
{
    private function getMessage($data)
    {
        // NAMING TIKET
        $description = $data->field_description;
        $pelapor = $data->field_pelapor;
        $link = route('tiket.getCode', ['code' => $data->field_code]);

        $message = 'TIKET DIBUAT' . PHP_EOL . PHP_EOL;
        $message = 'Pelapor : ' . $pelapor . PHP_EOL;
        $message = 'Tiket : ' . $data->field_code . PHP_EOL;
        // END NAMING TIKET

        if ($asset_id = $data->field_asset_id) {
            $asset = Asset::with(['has_department', 'has_location', 'has_group'])->find($asset_id);

            // NAMING TIKET
            $message = $message . 'Asset : ' . $asset->field_name . PHP_EOL;

            if ($asset->has_location) {
                $message = $message . 'Ruangan : ' . $asset->has_location->field_name . PHP_EOL;
            }

            $message = $message . 'Keterangan : ' . $description . PHP_EOL . PHP_EOL;
            $message = $message . 'Link : ' . $link;

            // END NAMING TIKET
        }

        return $message;
    }

    public function save($data)
    {
        $check = false;
        try {

            $message = $this->getMessage($data);

            if ($asset_id = $data->field_asset_id)
            {
                $asset = Asset::with(['has_group'])->find($asset_id);
                $gambar = url(imageUrl($data->field_image, 'tiket'), [], true);
                $this->create($asset->has_group, $message, $gambar);
            }


        } catch (\Throwable $th) {
            Alert::error($th->getMessage());

            return $th->getMessage();
        }

        return $check;
    }

    private function create($group, $message, $gambar)
    {
        if (!empty($group->has_user)) {
            $insert = [];

            foreach ($group->has_user as $user)
            {
                if(env('NOTIFICATION_CHANNEL', 'telegram') == NotificationType::Telegram && !empty($user->field_telegram))
                {
                    $insert[] = [
                        Notification::field_name() => $user->name,
                        Notification::field_address() => $user->field_telegram,
                        Notification::field_message() => $message,
                        Notification::field_image() => $gambar,
                        Notification::field_category() => NotificationType::Telegram,
                        Notification::field_tanggal() => date('Y-m-d'),
                        'notification_created_at' => date('Y-m-d H:i:s'),
                        'notification_updated_at' => date('Y-m-d H:i:s'),
                        'notification_created_by' => $user->id,
                        'notification_updated_by' => $user->id,
                    ];
                }
            }

            Notification::insert($insert);
        }

    }
}
