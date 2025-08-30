<?php

namespace App\Services\Command;

use App\Contracts\NotificationInterface;
use App\Notifications\AlertNotification;
use Illuminate\Support\Facades\Notification;
use Telegram\Bot\FileUpload\InputFile;
use Telegram\Bot\Laravel\Facades\Telegram;

class EmailNotificationService implements NotificationInterface
{
    public function send($nama, $alamat, $pesan, $gambar = null)
    {
        $response = Notification::send(new AlertNotification());

        return $response;
    }
}
