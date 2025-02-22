<?php

namespace App\Http\Controllers;

use App\Dao\Models\Asset;
use App\Dao\Models\Vendor;
use App\Facades\Model\AssetModel;
use App\Http\Controllers\Core\ReportController;
use Illuminate\Http\Request;

class ReportKalibrasiController extends ReportController
{
    public $data;

    public function __construct(AssetModel $model)
    {
        $this->model = $model::getModel();
    }

    public function getData()
    {
        $query = $this->model->rawQuery()
            ->addSelect(Vendor::field_name())
            ->leftJoinRelationship('has_kalibrasi')
            ->whereNotNull(Asset::field_next_expired());

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
