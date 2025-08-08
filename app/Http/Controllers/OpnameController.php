<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\BooleanType;
use App\Dao\Enums\OpnameType;
use App\Dao\Models\Asset;
use App\Dao\Models\OpnameDetail;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\OpnameModel;
use App\Http\Requests\CaptureRequest;
use App\Http\Requests\OpnameRequest;
use App\Services\CreateOpnameService;
use App\Services\Master\CreateService;
use App\Services\Master\UpdateService;
use App\Services\UpdateCaptureService;
use Illuminate\Support\Facades\DB;
use Plugins\Query;
use Plugins\Response;

class OpnameController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(OpnameModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $location = Query::getLocationMap();
        $status = OpnameType::getOptions();

        self::$share = [
            'location' => $location,
            'status' => $status,
        ];
    }

    public function getOpname()
    {
        $data = $this->model->with('has_location')->get()->map(function($item){

            $name = 'Opname '.$item->field_primary.' ('.formatDate($item->field_start_date).' - '.formatDate($item->field_end_date).')';

            if(!empty($item->has_location)){
                $name = $name.' @ '.$item->has_location->field_name;
            }

            return [
                'id' => $item->field_primary,
                'nama' => $name
            ];
        });

        return $data;
    }

    private function getQueryDetailOpname($opname_id, $location_id = null)
    {
        $query = OpnameDetail::select([
            OpnameDetail::getTableName().'.*',
            Asset::field_name(),
            DB::raw('location.lokasi_gabungan as location_nama'),
            DB::raw('scan.lokasi_gabungan as scan_nama'),
        ])
            ->leftJoinRelationship('has_asset')
            ->leftJoinRelationshipUsingAlias('has_location', 'location')
            ->leftJoinRelationshipUsingAlias('has_scan', 'scan')
            ->where(OpnameDetail::field_opname_id(), $opname_id);

        if(!empty($location_id))
        {
            $query = $query->where(OpnameDetail::field_location_id(), $location_id);
        }

        return $query;
    }

    public function getAsset($opname)
    {
        $location = request()->get('location') ?? null;
        $detail = $this->getQueryDetailOpname($opname, $location);

        $data = $detail->get()->map(function($item){

            return [
                'id' => intval($item->field_code),
                'nama' => $item->asset_nama,
                'ketemu' => $item->field_ketemu
            ];
        });

        return $data;
    }

    public function postCreate(CaptureRequest $request, CreateService $service)
    {
        $data = $service->save($this->model, $request);
        return Response::redirectBack($data);
    }

    public function postUpdate($code, CaptureRequest $request, UpdateService $service)
    {
        $data = $service->update($this->model, $request, $code);
        return Response::redirectBack($data);
    }

    public function getCapture($code, UpdateCaptureService $service)
    {
        $model = $this->get($code);
        $location = $model->field_location_id;

        $query = Asset::query();

        if(!empty($location))
        {
            $query = $query->where(Asset::field_location_id(), $location);
        }

        $date = date('Y-m-d H:i:s');
        $user = auth()->user()->id;
        foreach($query->get() as $asset)
        {
            $data[] = [
                OpnameDetail::field_ketemu() => BooleanType::No,
                OpnameDetail::field_code() => $asset->field_primary,
                OpnameDetail::field_opname_id() => $model->field_primary,
                OpnameDetail::field_location_id() => $asset->field_location_id,
                OpnameDetail::CREATED_AT => $date,
                OpnameDetail::CREATED_BY => $user,
                OpnameDetail::UPDATED_AT => $date,
                OpnameDetail::UPDATED_BY => $user,
            ];
        }

        $service->update($this->model, $data ,$code);

       return Response::redirectBack($data);
    }

    public function getDelete()
    {
        $code = request()->get('code');
        OpnameDetail::where(OpnameDetail::field_opname_id(), $code)->delete();
        $data = self::$service->delete($this->model, $code);

        return Response::redirectBack($data);
    }

    public function getUpdate($code)
    {
        $this->beforeForm();
        $this->beforeUpdate($code);

        $detail = $this->getQueryDetailOpname($code)->get();

        return moduleView(modulePathForm(path: self::$is_core), $this->share([
            'model' => $this->get($code),
            'detail' => $detail
        ]));
    }

    public function postOpname(OpnameRequest $request, CreateOpnameService $service)
    {
        $data = $service->save($this->model, $request);
        return Response::redirectBack($data);
    }
}
