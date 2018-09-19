<?php

namespace App\Api\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use App\Models\Navigation;

class AuthController extends BaseController
{
    /**
     * The authentication guard that should be used.
     *
     * @var string
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function authenticate(Request $request)
    {
        $payload = [
            'email' => $request->get('username'),
            'password' => $request->get('password')
        ];
        try {
            if (!$token = JWTAuth::attempt($payload)) {
                return response()->json(['error' => 'token不通过验证'], 50012);
            }
        } catch (JWTException $e) {
            return response()->json(['error' => '不能创建token'], 500);
        }
        return response()->json(['code'=>20000,'data'=>['token'=>$token]]);
    }

    /**
     * @param Request $request
     */
    public function register(Request $request)
    {
        $newUser = [
            'email' => $request->email,
            'name' => $request->name,
            'password' => bcrypt($request->password)
        ];
        $user = User::create($newUser);
        $token = JWTAuth::fromUser($user);
        return $token;
    }

    public function logout()
    {
        return response()->json(['code'=>20000]);
    }

    /****
     * 获取用户的信息
     * @return \Illuminate\Http\JsonResponse
     */
    public function AuthenticatedUser()
    {
        try {
            if (!$user = JWTAuth::parseToken()->authenticate()) {
                return response()->json(['user_not_found'], 404);
            }
        } catch (TokenExpiredException $e) {
            return response()->json(['token_expired','code'=>50014], $e->getStatusCode());
        } catch (TokenInvalidException $e) {
            return response()->json(['token_invalid','code'=>50012], $e->getStatusCode());
        } catch (JWTException $e) {
            return response()->json(['token_absent'], $e->getStatusCode());
        }

        // $str ='[{"path":"/example","component":"Layout","redirect":"/example/table","name":"Example","meta":{"title":"Example","icon":"example","roles":["editor"]},"children":[{"path":"table","name":"Table","meta":{"title":"Table","icon":"table"}},{"path":"tree","name":"Tree","component":"@/views/tree/index","meta":{"title":"Tree","icon":"tree","roles":["editor"]}}]},{"path":"/form","component":"Layout","children":[{"path":"index","name":"Form","component":"@/views/form/index","meta":{"title":"Form","icon":"form"}}]},{"path":"external-link","component":"Layout","children":[{"path":"https://panjiachen.github.io/vue-element-admin-site/#/","meta":{"title":"externalLink","icon":"link"}}]}]';
        // // the token is valid and we have found the user via the sub claim
        $asyncRouterMap=$this->getNav();
        $user->avatar = 'https://avatars3.githubusercontent.com/u/19586007?s=460&v=4';

        return response()->json(['code'=>20000,'data'=>['baseUserInfo'=>$user,'roles'=>['editor','admin'],'asyncRouterMap'=>$asyncRouterMap ]]);
    }

    /****
     * 获取后台左侧导航
     * @return （array）
     */

    public function getNav()
    {
        $data = changeMeta(Navigation::get()->toArray());
        $nav =make_tree($data);
        return  $nav;
    }
}
