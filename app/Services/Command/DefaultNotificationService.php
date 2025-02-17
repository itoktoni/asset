<?php

namespace App\Services\Command;

use App\Contracts\NotificationInterface;
use Telegram\Bot\Laravel\Facades\Telegram;
use Telegram\Bot\FileUpload\InputFile;

class DefaultNotificationService implements NotificationInterface
{
    public function send($nama, $alamat, $pesan, $gambar = null)
    {
        if(!empty($gambar))
        {
            $response = Telegram::sendPhoto([
                'chat_id' => $alamat,
                'photo' =>  new InputFile($gambar),
                'caption' => $pesan,
            ]);
        }
        else
        {
            $response = Telegram::sendPhoto([
                'chat_id' => $alamat,
                'text' => $pesan,
            ]);
        }


        return $response;
    }
}
