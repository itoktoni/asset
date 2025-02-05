<?php

namespace App\Http\Controllers;

use App\Facades\Model\UserModel;
use App\Http\Controllers\Core\ReportController;
use App\Jobs\JobExportCsvUser;
use Illuminate\Http\Request;

class ReportUserController extends ReportController
{
    public $data;

    public function __construct(UserModel $model)
    {
        $this->model = $model::getModel();
    }

    public function getData()
    {
        $query = $this->model->dataRepository();

        return $query;
    }

    public function getPrint(Request $request)
    {
        set_time_limit(0);

        $this->data = $this->getData($request);

        $batch = exportCsv('users', UserModel::query(), $request, JobExportCsvUser::class, env('CSV_DELIMITER', ','), env('CSV_CHUNK', 100));
        if ($request->queue == 'batch') {
            $url = moduleRoute('getCreate', array_merge(['batch' => $batch->id], $request->all()));

            return redirect()->to($url);
        }

        return moduleView(modulePathPrint(), $this->share([
            'data' => $this->data,
        ]));
    }
}
