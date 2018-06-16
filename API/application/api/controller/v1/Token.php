<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 20:44
 */

namespace app\api\controller\v1;


use app\api\service\ThirdApp;
use app\api\service\UserToken;
use app\api\vailate\AppToken;
use app\api\vailate\TokenCode;
use app\lib\exception\ParameterException;
use app\api\service\Token as TokenService;
use app\api\service\ThirdApp as ThirdAppService;
use app\api\model\ThirdApp as ThirdAppModel;
class Token
{
    /**
     * 获取token(不是考虑token是否过期)
     * /token/user?code=hasodihaoisdhioas
     * @param string $code
     */
   public function getToken($code=''){
       (new TokenCode())->goCheck();
      $userToken=new UserToken($code);
      $token=$userToken->getUserToken();
      $token=[
          'token'=>$token
      ];
      return $token;
   }
   public function verifyToken($token='')
   {
     if(!$token)
     {
         throw new ParameterException([
             'msg'=>'token不允许为空值'
         ]);
     }
     $res=TokenService::isVerifyToken($token);
     return [
       'isValis'=>$res
     ];
   }
    /**
     * @url token/app
     * @param string $ac 用户
     * @param string $se 密码
     */
    public function getAppToken($ac='',$se='')
    {
        (new AppToken())->goCheck();
        $ThirdAppService=new ThirdApp();
        $token=$ThirdAppService->get($ac,$se);
        return [
            'token'=>$token
        ];
    }

}