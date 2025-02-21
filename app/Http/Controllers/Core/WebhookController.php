<?php

namespace App\Http\Controllers\Core;

use App\Dao\Models\Core\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Symfony\Component\Process\Exception\ProcessFailedException;
use Symfony\Component\Process\Process;
use Telegram\Bot\FileUpload\InputFile;
use Telegram\Bot\Keyboard\Keyboard;
use Telegram\Bot\Laravel\Facades\Telegram;

class WebhookController extends Controller
{
    public function deploy(Request $request)
    {
        $githubPayload = $request->getContent();
        $githubHash = $request->header('X-Hub-Signature');
        $localToken = env('GITHUB_WEBHOOK_SECRET');
        $localHash = 'sha1=' . hash_hmac('sha1', $githubPayload, $localToken, false);
        if (hash_equals($githubHash, $localHash)) {

            chdir(base_path());
            $process = new Process(['git', 'pull']);
            $process->run();

            // executes after the command finishes
            if (!$process->isSuccessful()) {
                throw new ProcessFailedException($process);
            }

            return $process->getOutput();
        }
    }

    public function telegram(Request $request)
    {
        if ($chat = $request->message) {

            $from = $chat['from'] ?? [];
            $text = $chat['text'] ?? null;
            $chat_id = $from['id'] ?? null;
            $username = $from['username'] ?? null;

            if ($text == "Register") {
                $user = User::where('username', $username)->first();

                if ($chat_id && $user) {
                    $user->update([
                        User::field_telegram() => $chat_id,
                    ]);

                    Telegram::sendMessage([
                        'chat_id' => $chat_id,
                        'text' => "Pendaftaran Berhasil",
                    ]);

                } else {
                    Telegram::sendMessage([
                        'chat_id' => $chat_id,
                        'text' => "Pendaftaran Gagal Dilakukan",
                    ]);
                }
            }
            elseif($text == "Help")
            {
                $help = 'catat username telegram'.PHP_EOL.'input ke dalam system'.PHP_EOL.'buka menu profile'.PHP_EOL.'masukan username telegram'.PHP_EOL.'untuk lebih jelas buka ducument berikut';
                $ducument = new InputFile(url('telegram.pdf'));
                Telegram::sendDocument([
                    'chat_id' => $chat_id,
                    'caption' => $help,
                    'document' => $ducument
                ]);
            }
            else {
                $reply_markup = Keyboard::make()
                    ->setResizeKeyboard(true)
                    ->setOneTimeKeyboard(true)
                    ->row([
                        Keyboard::button('Register'),
                        Keyboard::button('Help'),
                    ])
                ;

                Telegram::sendMessage([
                    'chat_id' => $chat_id,
                    'text' => "Silahkan Pilih Menu Dibawah",
                    'reply_markup' => $reply_markup,
                ]);
            }

        }
    }
}
