<?php

namespace App\Http\Controllers;

use App\Dao\Enums\JobType;
use App\Dao\Models\Tiket;
use App\Facades\Model\JobModel;
use App\Facades\Model\UserModel;
use App\Http\Controllers\Core\ReportController;
use Illuminate\Http\Request;

class ReportTiketController extends ReportController
{
    public $data;

    public function __construct(JobModel $model)
    {
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $pelapor = UserModel::getOptions();
        $type = JobType::getOptions();

        self::$share = [
            'type' => $type,
            'pelapor' => $pelapor,
        ];
    }

    public function getData()
    {
        $query = $this->model->dataRepository();

        if ($start_date = request()->get('start_date')) {
            $query = $query->whereDate(Tiket::field_tanggal(), '>=', $start_date);
        }

        if ($end_date = request()->get('end_date')) {
            $query = $query->whereDate(Tiket::field_tanggal(), '<=', $end_date);
        }

        return $query->filter()->get();
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
