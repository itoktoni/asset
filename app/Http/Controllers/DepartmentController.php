<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\YesNoType;
use App\Dao\Models\Department;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\DepartmentModel;
use App\Facades\Model\UserModel;
use App\Http\Requests\Core\GeneralRequest;
use App\Services\CreateRelationUserService;
use App\Services\UpdateRelationUserService;
use Plugins\Response;

class DepartmentController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(DepartmentModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $user = UserModel::getOptions();
        $notification = YesNoType::getOptions();
        $selected = [];

        self::$share = [
            'user' => $user,
            'notification' => $notification,
            'selected' => $selected,
        ];
    }

    public function postCreate(GeneralRequest $request, CreateRelationUserService $service)
    {
        $data = $service->save($this->model, $request);

        return Response::redirectBack($data);
    }

    public function getUpdate($code)
    {
        $this->beforeForm();

        $model = $this->get($code, ['has_user']);
        $selected = $model->has_user->pluck(Department::field_user_id(), Department::field_user_id());

        return moduleView(modulePathForm(), $this->share([
            'model' => $model,
            'selected' => $selected,
        ]));
    }

    public function postUpdate($code, GeneralRequest $request, UpdateRelationUserService $service)
    {
        $data = $service->update($this->model, $request, $code);

        return Response::redirectBack($data);
    }

}
