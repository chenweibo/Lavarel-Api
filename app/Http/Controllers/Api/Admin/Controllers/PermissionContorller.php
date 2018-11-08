<?php

namespace App\Http\Controllers\Api\Admin\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Navigation;

class PermissionContorller extends BaseController
{
    public function demo()
    {
        $data = changeMeta(Navigation::get()->toArray());
        $nav =make_tree($data);
        return  response()->json(['data'=>$nav,'demo'=>$nav[0]['meta']]);
    }
}
