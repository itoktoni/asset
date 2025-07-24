<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\RoleType;
use App\Dao\Enums\JobType;
use App\Dao\Models\Job;
use App\Facades\Model\JobModel;
use App\Facades\Model\UserModel;
use App\Http\Controllers\Core\ReportController;
use Illuminate\Http\Request;
use Plugins\Query;

class ReportJobController extends ReportController
{
    public $data;

    public function __construct(JobModel $model)
    {
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $teknisi = Query::getUserByRole(RoleType::Teknisi);
        $type = JobType::getOptions();

        self::$share = [
            'type' => $type,
            'teknisi' => $teknisi,
        ];
    }

    public function getData()
    {
        $query = $this->model->dataRepository()->orderBy(Job::field_created_at(), 'ASC');

        if ($start_date = request()->get('start_date')) {
            $query = $query->whereDate(Job::field_tanggal(), '>=', $start_date);
        }

        if ($end_date = request()->get('end_date')) {
            $query = $query->whereDate(Job::field_tanggal(), '<=', $end_date);
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
