<?php

namespace App\Http\Controllers;

use App\Dao\Enums\Core\YesNoType;
use App\Dao\Models\Group;
use App\Http\Controllers\Core\MasterController;
use App\Http\Function\CreateFunction;
use App\Http\Function\UpdateFunction;
use App\Services\Master\SingleService;
use App\Facades\Model\GroupModel;
use App\Facades\Model\UserModel;
use App\Http\Requests\Core\GeneralRequest;
use App\Services\CreateRelationUserService;
use App\Services\UpdateRelationUserService;
use Plugins\Response;

class GroupController extends MasterController
{
    use CreateFunction, UpdateFunction;

    public function __construct(GroupModel $model, SingleService $service)
    {
        self::$service = self::$service ?? $service;
        $this->model = $model::getModel();
    }

    protected function beforeForm()
    {
        $user = UserModel::getOptions();
        $notification = YesNoType::getOptions();

        self::$share = [
            'user' => $user,
            'notification' => $notification,
        ];
    }

    public function getUpdate($code)
    {
        $this->beforeForm();

        $model = $this->get($code, ['has_user']);
        $selected = $model->has_user->pluck(Group::field_user_id(), Group::field_user_id());

        return moduleView(modulePathForm(), $this->share([
            'model' => $model,
            'selected' => $selected,
        ]));
    }

    public function postCreate(GeneralRequest $request, CreateRelationUserService $service)
    {
        $data = $service->save($this->model, $request);

        return Response::redirectBack($data);
    }

    public function postUpdate($code, GeneralRequest $request, UpdateRelationUserService $service)
    {
        $data = $service->update($this->model, $request, $code);

        return Response::redirectBack($data);
    }
}
