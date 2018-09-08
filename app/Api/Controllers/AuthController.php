<?php

namespace App\Api\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;

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
                return response()->json(['error' => 'token不通过验证'], 401);
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
        // code...
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
            return response()->json(['token_expired'], $e->getStatusCode());
        } catch (TokenInvalidException $e) {
            return response()->json(['token_invalid'], $e->getStatusCode());
        } catch (JWTException $e) {
            return response()->json(['token_absent'], $e->getStatusCode());
        }
        // the token is valid and we have found the user via the sub claim
        return response()->json(['code'=>20000,'data'=>['baseUserInfo'=>$user,'roles'=>['editor','admin']]]);
    }
}
