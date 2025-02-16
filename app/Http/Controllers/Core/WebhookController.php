<?php

namespace App\Http\Controllers\Core;

use App\Dao\Models\Core\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Symfony\Component\Process\Exception\ProcessFailedException;
use Symfony\Component\Process\Process;
use Telegram\Bot\Laravel\Facades\Telegram;

class WebhookController extends Controller
{
    public function deploy(Request $request)
    {
        $githubPayload = $request->getContent();
        $githubHash = $request->header('X-Hub-Signature');
        $localToken = env('GITHUB_WEBHOOK_SECRET');
        $localHash = 'sha1='.hash_hmac('sha1', $githubPayload, $localToken, false);
        if (hash_equals($githubHash, $localHash)) {

            chdir(base_path());
            $process = new Process(['git', 'pull']);
            $process->run();

            // executes after the command finishes
            if (! $process->isSuccessful()) {
                throw new ProcessFailedException($process);
            }

            return $process->getOutput();
        }
    }

    public function telegram(Request $request)
    {
        if($chat = $request->message)
        {
            $from = $chat['from'] ?? [];
            $chat_id = $from['id'] ?? null;
            $username = $from['username'] ?? null;

            $user = User::where('username', $username)->first();

            if($chat_id && $user)
            {
                $user->update([
                    User::field_telegram() => $chat_id
                ]);

                Telegram::sendMessage([
                    'chat_id' => $chat_id,
                    'text' => "Pendaftaran Berhasil",
                ]);
            }
        }
    }
}
