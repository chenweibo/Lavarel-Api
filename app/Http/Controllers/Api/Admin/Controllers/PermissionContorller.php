<?php

namespace App\Http\Controllers\Api\Admin\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Navigation;
use JWTAuth;
use App\Models\User;

class PermissionContorller extends BaseController
{
    public function demo()
    {
        //$data = changeMeta(Navigation::get()->toArray());
        //$nav = make_tree($data);
       $user = JWTAuth::parseToken()->authenticate(); //获取用户信息
        //$user =User::find(2);
        // $user->assignRole('普通管理员');
         //$user->assignRole('writer');
        //$user = User::permission('edit articles')->get();
        //$user->hasRole('writer');
        //$role = Role::findById(2);
        //$role->givePermissionTo('edit articles');
        // $d=  $user->can('edit articles');
        // $roles = $user->getRoleNames(); // 返回一个集合
        //$permissions = User::permission('edit articles')->get();

        return response()->json(['user'=>$user->getPermissionsViaRoles(),'d'=>$d]);
    }

    /****
     * 创建角色
     * @return \Illuminate\Http\JsonResponse
     ****/
    public function createRole(Request $request)
    {
        $role = Role::create(['name' => $request->name]);
        $permission = Permission::create(['name' => 'create']);
        $permission = Permission::create(['name' => 'edit']);

        return response()->json(['code' => 200]);
    }
}
