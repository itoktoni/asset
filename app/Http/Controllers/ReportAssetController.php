<?php

namespace App\Http\Controllers;

use App\Dao\Models\Brand;
use App\Dao\Models\Distributor;
use App\Dao\Models\Model;
use App\Dao\Models\Nomenklatur;
use App\Facades\Model\AssetModel;
use App\Http\Controllers\Core\ReportController;
use Illuminate\Http\Request;

class ReportAssetController extends ReportController
{
    public $data;

    public function __construct(AssetModel $model)
    {
        $this->model = $model::getModel();
    }

    public function getData()
    {
        $query = $this->model->rawQuery()
        ->leftJoinRelationship('has_distributor')
        ->leftJoinRelationship('has_naming.has_nomenklatur')
        ->leftJoinRelationship('has_naming.has_brand')
        ->leftJoinRelationship('has_naming.has_model')
        ->addSelect([
            Nomenklatur::field_primary(),
            'penamaan.penamaan_nama',
            Brand::field_name(),
            Model::field_name(),
            Distributor::field_name(),
        ]);

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
