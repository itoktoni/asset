<?php

namespace App\Http\Controllers;

use App\Dao\Models\Asset;
use App\Dao\Models\Level2;
use App\Facades\Model\AssetModel;
use App\Http\Controllers\Core\ReportController;
use Illuminate\Http\Request;
use Plugins\Query;
use Telegram\Bot\Objects\Location;

class ReportJadwalController extends ReportController
{
    public $data;

    public function __construct(AssetModel $model)
    {
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $asset = Query::getAssetMap();
        $location = Query::getLocationMap();

        self::$share = [
            'location' => $location,
            'asset' => $asset,
        ];
    }

    public function getData()
    {
        $query = $this->model->rawQuery()
            ->whereNotNull(Asset::field_tanggal_kunjungan())
            ->orderBy(Asset::field_tanggal_kunjungan(), 'ASC')
            ;

        if ($start_date = request()->get('start_date')) {
            $query = $query->whereDate(Asset::field_tanggal_kunjungan(), '>=', $start_date);
        }

        if ($end_date = request()->get('end_date')) {
            $query = $query->whereDate(Asset::field_tanggal_kunjungan(), '<=', $end_date);
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
