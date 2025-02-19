<?php

namespace App\Http\Controllers;

use App\Dao\Enums\TechnologyType;
use App\Dao\Enums\Core\YesNoType;
use App\Dao\Models\Category;
use App\Dao\Models\Model;
use App\Dao\Models\Penamaan;
use App\Facades\Model\BrandModel;
use App\Facades\Model\CategoryModel;
use App\Facades\Model\ModelModel;
use App\Facades\Model\NomenklaturModel;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\PenamaanModel;
use App\Facades\Model\SatuanModel;
use App\Http\Requests\AssetRequest;
use App\Http\Requests\PenamaanRequest;
use App\Services\Master\CreateService;
use App\Services\Master\UpdateService;
use Plugins\Alert;
use Plugins\Response;
use Spatie\SimpleExcel\SimpleExcelReader;

class PenamaanController extends MasterController
{
    use CreateFunction, UpdateFunction;

    private $code;
    private $insert = [];

    public function __construct(PenamaanModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $category = CategoryModel::getOptions();
        $satuan = SatuanModel::getOptions();
        $tech = TechnologyType::getOptions();

        $fungsi = array_combine(range(1,10), range(1,10));
        $aplikasi = array_combine(range(1,5), range(1,5));
        $maintenance = array_combine(range(1,5), range(1,5));

        self::$share = [
            'maintenance' => $maintenance,
            'aplikasi' => $aplikasi,
            'fungsi' => $fungsi,
            'tech' => $tech,
            'satuan' => $satuan,
            'category' => $category,
        ];
    }

    public function postCreate(PenamaanRequest $request, CreateService $service)
    {
        $data = $service->save($this->model, $request);

        return Response::redirectBack($data);
    }

    public function postUpdate($code, PenamaanRequest $request, UpdateService $service)
    {
        $data = $service->update($this->model, $request, $code);

        return Response::redirectBack($data);
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

                $file->storeAs('/public/files/penamaan/', $name);

                $rows = SimpleExcelReader::create(storage_path('app/public/files/penamaan/' . $name))
                    ->noHeaderRow()
                    ->getRows()
                    ->each(function (array $row) {

                        if ($row[0] != null && is_int($row[0]) && !empty($row[1])) {

                            if($this->code != trim($row[0]))
                            {
                                $this->code = trim($row[0]);

                                $this->insert[] = [
                                    Penamaan::field_nomenklatur() => trim($row[0]),
                                    Penamaan::field_name() => trim($row[1]),
                                ];
                            }
                        }
                    });

                if(!empty($this->insert))
                {
                    Penamaan::insert($this->insert);
                }

                Alert::info('Data berhasil di upload');

            }

        }

        return Response::redirectBack();
    }
}
