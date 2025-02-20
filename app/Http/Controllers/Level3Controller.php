<?php

namespace App\Http\Controllers;

use App\Dao\Models\Core\User;
use App\Dao\Models\Level1;
use App\Dao\Models\Level2;
use App\Dao\Models\Level3;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\Level3Model;
use Illuminate\Support\Facades\DB;
use Monolog\Level;
use Plugins\Alert;
use Plugins\Query;
use Plugins\Response;
use Spatie\SimpleExcel\SimpleExcelReader;

class Level3Controller extends MasterController
{
    use CreateFunction, UpdateFunction;

    private $level1;
    private $level2;
    private $level3;
    private $insert = [];

    public function __construct(Level3Model $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $level2 = Level2::getOptions();
        $user = User::getOptions();

        self::$share = [
            'user' => $user,
            'level2' => $level2,
        ];
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

                $file->storeAs('/public/files/level/', $name);

                Level3::query()->delete();
                Level2::query()->delete();
                Level1::query()->delete();

                $rows = SimpleExcelReader::create(storage_path('app/public/files/level/' . $name))
                    ->noHeaderRow()
                    ->getRows()
                    ->each(function (array $row){

                        if(!empty($row[0]) && $row[0] != 'LEVEL 1')
                        {
                            $code = Query::autoNumber(Level1::getTableName(), Level1::field_primary(), 'LV1', 15);
                            $this->level1 = $code;

                            Level1::updateOrCreate([
                                Level1::field_primary() => $code,
                            ], [
                                Level1::field_name() => trim($row[0]),
                            ]);
                        }

                        if ($row[1] != null && is_numeric($row[1]) && !empty($row[2]))
                        {
                            if($this->level2 != $row[1])
                            {
                                $this->level2 = trim($row[1]);

                                Level2::updateOrCreate([
                                    Level2::field_primary() => $this->level2,
                                ], [
                                    Level2::field_name() => trim($row[2]),
                                    Level2::field_id_level1() => $this->level1,
                                ]);

                            }
                        }

                        if ($row[3] != null && is_numeric($row[3]) && !empty($row[4]))
                        {
                            if($this->level3 != $row[3])
                            {
                                $this->level3 = trim($row[3]);

                                $this->insert[] = [
                                    level3::field_primary() => $this->level3,
                                    Level3::field_name() => trim($row[4]),
                                    Level3::field_id_level2() => $this->level2
                                ];
                            }
                        }
                    });

                   if(!empty($this->insert))
                   {
                        Level3::insert($this->insert);
                   }

                Alert::info('Data berhasil di upload');

            }

        }

        return Response::redirectBack();
    }
}
