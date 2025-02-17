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
                $extension = $file->extension();
                $name = time() . '.' . $extension;

                $file->storeAs('/public/files/nomenklatur/', $name);

                $rows = SimpleExcelReader::create(storage_path('app/public/files/nomenklatur/' . $name))
                    ->noHeaderRow()
                    ->getRows()
                    ->each(function (array $row) {

                        if ($row[0] != null && is_int($row[0]) && !empty($row[2])) {
                            Nomenklatur::updateOrCreate([
                                Nomenklatur::field_primary() => trim($row[1]),
                            ], [
                                Nomenklatur::field_name() => trim($row[2]),
                                Nomenklatur::field_description() => trim($row[3]),
                            ]);
                        }
                    });

                Alert::info('Data berhasil di upload');

            }

        }

        return Response::redirectBack();
    }
}
