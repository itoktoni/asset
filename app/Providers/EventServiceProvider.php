<?php

namespace App\Providers;

use App\Events\CountingLinen;
use App\Events\CreateTiketEvent;
use App\Events\FinishJobEvent;
use App\Listeners\CountingCuci;
use App\Listeners\CreateTiketListener;
use App\Listeners\FinishJobListener;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        CountingLinen::class => [
            CountingCuci::class,
        ],
        CreateTiketEvent::class => [
            CreateTiketListener::class,
        ],
        FinishJobEvent::class => [
            FinishJobListener::class,
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
