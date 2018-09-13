<?php

namespace App\Api\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\Navigation;

class PermissionContorller extends BaseController
{
    public function demo()
    {
        $nav =make_tree(Navigation::get()->toArray());
        return  response()->json(['data'=>$nav]);
    }
}
