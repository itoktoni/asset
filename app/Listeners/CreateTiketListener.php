<?php

namespace App\Listeners;

use App\Dao\Models\Asset;
use App\Dao\Models\Core\User;
use App\Dao\Models\Notification;
use App\Dao\Models\Tiket;
use App\Services\CreateNotificationTiketService;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Log;

class CreateTiketListener
{
    /**
     * Create the event listener.
     */

    private $service;

    public function __construct(CreateNotificationTiketService $service)
    {
        $this->service = $service;
    }

    /**
     * Handle the event.
     */
    public function handle(object $event): void
    {
        $data = $event->data;
        $this->service->save($data);

        Log::info(json_encode($data, JSON_PRETTY_PRINT));
    }
}
