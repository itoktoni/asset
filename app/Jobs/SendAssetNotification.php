<?php

namespace App\Jobs;

use App\Dao\Models\Asset;
use App\Dao\Models\AssetDetail;
use App\Dao\Models\Core\User;
use App\Dao\Models\Department;
use App\Mail\EmailAlert;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;

class SendAssetNotification implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $assetDetail;

    /**
     * Create a new job instance.
     */
    public function __construct(AssetDetail $assetDetail)
    {
        $this->assetDetail = $assetDetail;
    }

    /**
     * Execute the job.
     */
    public function handle(): void
    {
        $asset = Asset::find($this->assetDetail->field_asset_id);
        Log::info($asset);
        $department = Department::with('has_user')->find($asset->field_department_id);
        if($users = $department->has_user)
        {
            foreach($users as $user)
            {
                $email = $user ? $user->email : 'itok.toni@gmail.com'; // Fallback
                Mail::to($email)->send(new EmailAlert($this->assetDetail));
            }
        }
    }
}