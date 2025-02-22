<?php

namespace Plugins;

use App\Dao\Models\Area;
use App\Dao\Models\Brand;
use App\Dao\Models\Level1;
use App\Dao\Models\Level2;
use App\Dao\Models\Level3;
use App\Dao\Models\Lokasi;
use App\Dao\Models\Model;
use App\Dao\Models\Penamaan;
use App\Facades\Model\FilterModel;
use App\Facades\Model\GroupsModel;
use App\Facades\Model\LinkModel;
use App\Facades\Model\MenuModel;
use App\Facades\Model\PermisionModel;
use App\Facades\Model\RoleModel;
use App\Facades\Model\UserModel;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class Query
{
    public static function groups($role = false)
    {
        if (env('CACHE_ACCESS', false)) {
            if (Cache::has('groups')) {
                $cache = Cache::get('groups');
                if ($role && ! empty($cache)) {
                    $cache = $cache->where('system_role_code', auth()->user()->role);
                }

                return $cache;
            }
        }

        $groups = [];
        try {
            $groups = GroupsModel::with([
                'has_menu' => function ($query) {
                    $query->orderBy('system_menu_sort', 'DESC');
                },
                'has_menu.has_link' => function ($query) {
                    $query->orderBy('system_link_sort', 'DESC');
                },
            ])
                ->leftJoin('system_group_connection_role', 'system_group_connection_role.system_group_code', 'system_group.system_group_code')
                ->orderBy('system_group_sort', 'DESC')
                ->get();
            Cache::put('groups', $groups);

        } catch (\Throwable$th) {
            throw $th;
        }

        if ($role) {
            $groups = $groups->where('system_role_code', auth()->user()->role);
        }

        return $groups;
    }

    public static function getMenu($action = false)
    {
        if (env('CACHE_ACCESS', false)) {
            if (Cache::has('menu')) {
                $cache = Cache::get('menu');
                if ($action && ! empty($cache)) {
                    $cache = $cache->where('menu_code', $action)->first();
                }

                return $cache;
            }
        }

        $menu = [];
        try {
            $menu = DB::table(MenuModel::getTableName())
                ->select([
                    DB::raw('COALESCE(system_link.system_link_code, system_menu.system_menu_code) as menu_code'),
                    DB::raw('COALESCE(system_link.system_link_controller, system_menu.system_menu_controller) as menu_controller'),
                    DB::raw('COALESCE(system_link.system_link_action, system_menu.system_menu_action) as menu_action'),
                    DB::raw('COALESCE(system_link.system_link_name, system_menu.system_menu_name) as menu_name'),
                    DB::raw('COALESCE(system_link.system_link_url, system_menu.system_menu_url) as menu_url'),
                ])
                ->leftJoin('system_menu_connection_link', 'system_menu.system_menu_code', '=', 'system_menu_connection_link.system_menu_code')
                ->leftJoin(LinkModel::getTableName(), 'system_menu_connection_link.system_link_code', '=', 'system_link.system_link_code')
                ->get();

            Cache::put('menu', $menu);
        } catch (\Throwable $th) {
            //throw $th;
        }

        if ($action) {
            $menu = $menu->where('menu_code', $action)->first();
        }

        return json_decode(json_encode($menu), true);

        // return $menu;
    }

    public static function filter()
    {
        if (Cache::has('filter')) {
            return Cache::get('filter');
        }

        $filter = [];
        try {
            $filter = FilterModel::get();
            Cache::put('filter', $filter, 1200);
        } catch (\Throwable $th) {
            //throw $th;
        }

        return $filter;
    }

    public static function role()
    {
        if (env('CACHE_ACCESS', false)) {
            if (Cache::has('role')) {
                return Cache::get('role');
            }
        }

        $role = [];
        try {
            $role = RoleModel::get();
            Cache::put('role', $role, 1200);
        } catch (\Throwable$th) {
            //throw $th;
        }

        return $role;
    }

    public static function permision()
    {
        if (env('CACHE_ACCESS', false)) {
            if (Cache::has('permision')) {
                return Cache::get('permision');
            }
        }

        $permision = [];
        try {
            $permision = PermisionModel::query()->get();
            Cache::put('permision', $permision, 1200);
        } catch (\Throwable$th) {
            //throw $th;
        }

        return $permision;
    }

    public static function upsert($model, $where, $data)
    {
        $batch = $model->where($where)->first();
        if ($batch) {
            $batch->update($data);
        } else {
            $model->create($data);
        }
    }

    public static function autoNumber($tablename, $fieldid, $prefix = 'AUTO', $codelength = 15)
    {
        $db = DB::table($tablename);
        $db->select(DB::raw('max('.$fieldid.') as maxcode'));
        $db->where($fieldid, 'like', "$prefix%");

        $ambil = $db->first();
        $data = $ambil->maxcode;

        if ($db->count() > 0) {
            $code = substr($data, strlen($prefix));
            $countcode = ($code) + 1;
        } else {
            $countcode = 1;
        }
        $newcode = $prefix.str_pad($countcode, $codelength - strlen($prefix), '0', STR_PAD_LEFT);

        return $newcode;
    }

    public static function getUserByRole($role)
    {
        $data = [];
        $user = UserModel::select(UserModel::field_primary(), UserModel::field_name())
            ->where(UserModel::field_type(), $role)
            ->get();

        if ($user) {
            $data = $user->pluck(UserModel::field_name(), UserModel::field_primary());
        }

        return $data;
    }

    public static function getLevelMap()
    {
        $query = Level3::select([Level3::field_primary(), Level3::field_name(), Level2::field_name(), Level1::field_name()])
        ->leftJoinRelationship(HAS_LEVEL_2.'.'.HAS_LEVEL_1)
        ->leftJoinRelationship(HAS_LEVEL_2)
        ->get()
        ->mapWithKeys(function($item){

            return [$item->field_primary => '( '.$item->{Level1::field_name()}.' ) '.$item->{Level2::field_name()}.' - '.$item->field_name];
        }) ?? [];

        return $query;
    }

    public static function getModelMap()
    {
        $query = Model::select([Model::field_primary(), Model::field_name(), Brand::field_name()])
        ->leftJoinRelationship(HAS_BRAND)
        ->get()
        ->mapWithKeys(function($item){

            return [$item->field_primary => $item->{Brand::field_name()}.' - '.$item->field_name];
        }) ?? [];

        return $query;
    }

    public static function getPenamaanMap()
    {
        $query = Penamaan::select(Penamaan::field_primary(), Penamaan::field_nomenklatur(), Penamaan::field_name())
        ->get()
        ->mapWithKeys(function($item){

            $nama = $item->field_name;

            if(!empty($item->field_nomenklatur))
            {
                $nama = $nama. ' - '.$item->field_nomenklatur;
            }

            return [$item->field_primary => $nama];
        }) ?? [];

        return $query;
    }

    public static function getLocationMap()
    {
        $query = Lokasi::select(Lokasi::field_primary(), Area::field_name(), Lokasi::field_name())
        ->leftJoinRelationship('has_area')
        ->get()
        ->mapWithKeys(function($item){

            $nama = $item->field_name;

            if(!empty($item->{Area::field_name()}))
            {
                $nama = $nama. ' - '.$item->{Area::field_name()};
            }

            return [$item->field_primary => $nama];
        }) ?? [];

        return $query;
    }
}
