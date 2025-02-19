<?php

namespace App\Http\Controllers;

use App\Dao\Models\Brand;
use App\Dao\Models\Distributor;
use App\Dao\Models\Model;
use App\Dao\Models\Nomenklatur;
use App\Dao\Models\Vendor;
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
        ->leftJoinRelationship('has_vendor')
        ->leftJoinRelationship('has_naming')
        ->leftJoinRelationship('has_model')
        ->leftJoinRelationship('has_model.has_brand')
        ->addSelect([
            'penamaan.penamaan_nama',
            'penamaan.penamaan_code_nomenklatur',
            Brand::field_name(),
            Model::field_name(),
            Vendor::field_name(),
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
