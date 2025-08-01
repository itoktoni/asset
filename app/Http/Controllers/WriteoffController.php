<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\LevelType;
use App\Dao\Enums\MovementType;
use App\Dao\Models\Asset;
use App\Dao\Models\Core\User;
use App\Dao\Models\Lokasi;
use App\Dao\Models\Movement;
use App\Dao\Models\Writeoff;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\MovementModel;
use App\Http\Requests\MovementRequest;
use App\Http\Requests\WriteoffRequest;
use App\Services\CreateMovementService;
use App\Services\UpdateMovementService;
use App\Services\UpdateWriteoffService;
use Illuminate\Http\Request;
use Plugins\Query;
use Plugins\Response;

class WriteoffController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(Writeoff $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    public function getData()
    {
        $query = $this->model->dataRepository(false)->groupBy(Writeoff::field_code());
        return $query->simplePaginate(env('PAGINATION_NUMBER'));
    }

    protected function beforeForm()
    {
        $status = MovementType::getOptions();
        $asset = Query::getAssetMap();
        $location = Query::getLocationMap();
        $user = User::getOptions();

        $approval = User::where('level', LevelType::Management)->get()->pluck(User::field_name(), User::field_primary())->toArray();

        self::$share = [
            'location' => $location,
            'asset' => $asset,
            'status' => $status,
            'approval' => $approval,
            'user' => $user,
        ];
    }

    public function postCreate(WriteoffRequest $request, CreateMovementService $service)
    {
        $data = $service->save($this->model, $request);
        return Response::redirectBack($data);
    }

    public function postWriteoff(WriteoffRequest $request, CreateMovementService $service)
    {
        $data = $service->save($this->model, $request);
        return Response::redirectBack($data);
    }

    public function getUpdate($code)
    {
        $this->beforeForm();
        $this->beforeUpdate($code);

        $model = $this->get($code);
        $data = Writeoff::addSelect([
            'writeoff.*',
            Asset::field_code(),
            Asset::field_name(),
            Lokasi::field_name(),
        ])
        ->where(Writeoff::field_code(), $model->field_code)
        ->leftJoinRelationship('has_asset')
        ->leftJoinRelationship('has_location')
        ->get();

        if($data->count() <= 1)
        {
            $data = [];
        }

        return moduleView(modulePathForm(path: self::$is_core), $this->share([
            'model' => $model,
            'data' => $data,
        ]));
    }

    public function postUpdate($code, Request $request, UpdateWriteoffService $service)
    {
        $data = $service->update($this->model, $request, $code);

        return Response::redirectBack($data);
    }
}
