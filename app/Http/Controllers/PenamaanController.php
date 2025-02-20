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
        $kalibrasi = YesNoType::getOptions();

        $fungsi = array_combine(range(1,10), range(1,10));
        $aplikasi = array_combine(range(1,5), range(1,5));
        $maintenance = array_combine(range(1,5), range(1,5));

        self::$share = [
            'maintenance' => $maintenance,
            'aplikasi' => $aplikasi,
            'fungsi' => $fungsi,
            'kalibrasi' => $kalibrasi,
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

                Penamaan::query()->delete();

                $category = Category::get()->mapWithKeys(function($item){
                    return [$item->field_name => $item->field_primary];
                })->toArray();

                $rows = SimpleExcelReader::create(storage_path('app/public/files/penamaan/' . $name))
                    ->noHeaderRow()
                    ->getRows()
                    ->each(function (array $row) use ($category) {

                        if ($row[0] != null && (is_numeric($row[0])) && !empty($row[1])) {

                            $id_category = $kalibrasi = $tech = null;

                            if(!empty($row[2]) && isset($category[$row[2]]))
                            {
                                $id_category = $category[$row[2]];
                            }

                            if(!empty($row[7]))
                            {
                                $kalibrasi = $row[7] == 'Ya' ? 'Yes' : 'No';
                            }

                            if(!empty($row[3]))
                            {
                                $tech = strtoupper($row[3]);
                            }

                            $fungsi = $row[4] ?? null;
                            $aplikasi = $row[5] ?? null;
                            $maintenance = $row[6] ?? null;

                            $this->insert[] = [
                                Penamaan::field_nomenklatur() => trim($row[0]),
                                Penamaan::field_name() => trim($row[1]),
                                Penamaan::field_category_id() => $id_category,
                                Penamaan::field_technology() => $tech,
                                Penamaan::field_angka_fungsi() => $fungsi,
                                Penamaan::field_angka_aplikasi() => $aplikasi,
                                Penamaan::field_angka_maintenance() => $maintenance,
                                Penamaan::field_kalibrasi() => $kalibrasi,
                            ];

                        }
                    });

                    // dd($this->insert);

                if(!empty($this->insert))
                {
                    try {

                        Penamaan::insert($this->insert);
                        Alert::info('Data berhasil di upload');

                    } catch (\Throwable $th) {
                        Alert::error($th->getMessage());
                    }
                }
            }

        }

        return Response::redirectBack();
    }
}
