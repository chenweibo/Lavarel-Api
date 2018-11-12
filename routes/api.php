<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/
$api = app('Dingo\Api\Routing\Router');
$api->version('v1', function ($api) {
    $api->group(['namespace' => 'App\Http\Controllers\Api\Admin\Controllers','middleware' => ['cors']], function ($api) {
        $api->post('user/login', 'AuthController@authenticate');  //登录授权
        $api->post('user/register', 'AuthController@register');
        $api->post('user/logout', 'AuthController@logout');
        $api->group(['middleware' => 'jwt.auth'], function ($api) {
            $api->post('tests', 'TestsController@index');
            $api->get('tests/{id}', 'TestsController@show');
            $api->get('user/info', 'AuthController@AuthenticatedUser'); //获取用户信息
            $api->post('permission/role/create','PermissionContorller@createRole');//创建角色
        });
        $api->get('txt', 'PermissionContorller@demo'); //开发测试类，随意调整
    });
});
