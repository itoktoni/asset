<?php

use App\Dao\Enums\Core\LevelType;
use App\Dao\Models\Asset;
use App\Dao\Models\Core\User;
use App\Dao\Models\Lokasi;
use App\Dao\Models\Model;
use App\Dao\Models\Penamaan;
use App\Dao\Models\Status;
use App\Http\Controllers\AssetController;
use App\Http\Controllers\Core\GroupsController;
use App\Http\Controllers\Core\UserController;
use App\Http\Controllers\Core\WebhookController;
use App\Http\Controllers\MovementController;
use App\Http\Controllers\OpnameController;
use App\Http\Controllers\WriteoffController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
 */

Route::post('login', [UserController::class, 'postLoginApi'])->name('postLoginApi');
Route::post('deploy', [WebhookController::class, 'deploy'])->name('deploy');

Route::middleware(['auth:sanctum'])->group(function () {

    Route::get('global', function(){

        $merge = [];

        $status = Status::get()->map(function($item){
            return [
                'id' => $item->field_primary,
                'nama' => $item->field_name
            ];
        });

        $user = User::get()->map(function($item){
            return [
                'id' => $item->field_primary,
                'nama' => $item->field_name
            ];
        });

        $approval = User::where(User::field_level(), LevelType::Management)->get()->map(function($item){
            return [
                'id' => $item->field_primary,
                'nama' => $item->field_name
            ];
        });

        $model = Model::with('has_brand')->get()->map(function($item){

            $name = $item->field_name;

            if(!empty($item->has_brand)){
                $name = $item->has_brand->field_name.' - '.$name;
            }

            return [
                'id' => $item->field_primary,
                'nama' => $name
            ];
        });

        $lokasi = Lokasi::with('has_area')->get()->map(function($item){

            $name = $item->field_nama;

            if(!empty($item->has_area)){
                $name = $name.' @ '.$item->has_area->field_name;
            }

            return [
                'id' => $item->field_primary,
                'nama' => $name
            ];
        });

        $penamaan = Penamaan::get()->map(function($item){
            return [
                'id' => $item->field_primary,
                'nama' => $item->field_name
            ];
        });

        if(env('DEPARTMENT', false))
        {
            $department = Penamaan::get()->map(function($item){
                return [
                    'id' => $item->field_primary,
                    'nama' => $item->field_name
                ];
            });

            $merge['department'] = $department;
        }

        $data = array_merge([
            'approval' => $approval,
            'user' => $user,
            'status' => $status,
            'model' => $model,
            'lokasi' => $lokasi,
            'penamaan' => $penamaan,
        ], $merge);

        return $data;
    });

    Route::get('asset', [AssetController::class, 'getAsset']);

    Route::post('asset', [AssetController::class, 'postRegister']);
    Route::post('movement', [MovementController::class, 'postMovement']);
    Route::post('writeoff', [WriteoffController::class, 'postWriteoff']);

    Route::get('opname', [OpnameController::class, 'getOpname']);
    Route::get('opname/{opname}', [OpnameController::class, 'getAsset']);
    Route::post('opname', [OpnameController::class, 'postOpname']);

    Route::get('groups', [GroupsController::class, 'getData']);
});
