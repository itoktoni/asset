<?php

namespace App\Http\Controllers;

use App\Dao\Models\Asset;
use App\Dao\Models\Vendor;
use App\Facades\Model\AssetModel;
use App\Http\Controllers\Core\ReportController;
use Illuminate\Http\Request;
use Plugins\Query;

class ReportKalibrasiController extends ReportController
{
    public $data;

    public function __construct(AssetModel $model)
    {
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $asset = Query::getAssetMap();
        $vendor = Vendor::getOptions();
        $location = Query::getLocationMap();

        self::$share = [
            'location' => $location,
            'vendor' => $vendor,
            'asset' => $asset,
        ];
    }

    public function getData()
    {
        $query = $this->model->rawQuery()
            ->addSelect(Vendor::field_name())
            ->leftJoinRelationship('has_kalibrasi')
            ->whereNotNull(Asset::field_next_expired());

        if ($start_date = request()->get('start_date')) {
            $query = $query->whereDate(Asset::field_next_expired(), '>=', $start_date);
        }

        if ($end_date = request()->get('end_date')) {
            $query = $query->whereDate(Asset::field_next_expired(), '<=', $end_date);
        }

        return $query->get();
    }

    public function getPrint(Request $request)
    {
        set_time_limit(0);

        $this->data = $this->getData($request);

        return moduleView(modulePathPrint(), $this->share([
            'data' => $this->data,
        ]));
    }
}
