<?php

namespace App\Services\Command;

use App\Contracts\NotificationInterface;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class WhatsappNotificationService implements NotificationInterface
{
    public function send($nama, $alamat, $pesan, $gambar = null)
    {
        $api_key = env('WA_KEY'); // API KEY Anda
        $id_device = env('WA_ADMIN'); // ID DEVICE yang di SCAN (Sebagai pengirim)
        $url = $gambar ? env('WA_URL') . '/send-media' : env('WA_URL') . '/send-message'; // URL API
        $no_hp = $alamat; // No.HP yang dikirim (No.HP Penerima)
        $pesan = $pesan; // Pesan yang dikirim
        $tipe = 'image'; // Tipe Pesan Media Gambar
        $data = [
            'api_key' => $api_key,
            'sender' => $id_device,
            'number' => $no_hp,
            'message' => $pesan,
        ];

        try {
            $curl = curl_init();

            curl_setopt_array($curl, array(
                CURLOPT_URL => 'http://wa.obsesiman.co.id/send-message',
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_SSL_VERIFYHOST => 0,
                CURLOPT_SSL_VERIFYPEER => 0,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => json_encode($data),
                CURLOPT_HTTPHEADER => [
                    'Content-Type:application/json',
                    'API-KEY:'.$api_key
                ],
            ));

            $response = curl_exec($curl);
            curl_close($curl);

            return $response;

        } catch (\Throwable $th) {
            $error = [
                'status' => false,
                'response' => [
                    'body' => $th->getMessage()
                ],
            ];

            return $error;

            Log::error($error);

        }

        Log::info($nama);
    }
}
