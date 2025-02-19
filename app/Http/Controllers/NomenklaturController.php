<?php

namespace App\Http\Controllers;

use App\Dao\Models\Nomenklatur;
use App\Facades\Model\NomenklaturModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use Plugins\Alert;
use Plugins\Response;
use Spatie\SimpleExcel\SimpleExcelReader;

class NomenklaturController extends MasterController
{
    use CreateFunction, UpdateFunction;

     private $code;
     private $insert = [];

    public function __construct(NomenklaturModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    public function postTable()
    {
        if (request()->exists('delete')) {
            if (empty(request()->get('code'))) {
                Alert::error('Pilih data yang akan di hapus');
                return redirect()->back();
            }

            $code = array_unique(request()->get('code'));
            $data = self::$service->delete($this->model, $code);
        }

        if (request()->has('file')) {
            $file = request()->file('file');

            if (!empty($file)) {

                set_time_limit(0);
                ini_set('max_execution_time', 0);

                $extension = $file->extension();
                $name = time() . '.' . $extension;

                $file->storeAs('/public/files/nomenklatur/', $name);

                Nomenklatur::query()->delete();

                $rows = SimpleExcelReader::create(storage_path('app/public/files/nomenklatur/' . $name))
                    ->noHeaderRow()
                    ->getRows()
                    ->each(function (array $row) {

                        if ($row[0] != null && is_int($row[0]) && !empty($row[1])) {

                            if($this->code != trim($row[0]))
                            {
                                $this->code = trim($row[0]);

                                $insert[] = [
                                    Nomenklatur::field_primary() => $this->code,
                                    Nomenklatur::field_name() => trim($row[1]),
                                ];
                            }
                        }
                    });

                if(!empty($this->insert))
                {
                    Nomenklatur::insert($this->insert);
                }

                Alert::info('Data berhasil di upload');

            }

        }

        return Response::redirectBack();
    }
}
