<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/8/0008
 * Time: 15:53
 */

namespace app\api\service;


use app\lib\exception\TokenException;

class ThirdApp extends Token
{
  public function get($ac,$se)
  {
      $res=\app\api\model\ThirdApp::check($ac,$se);
      if(!$res)
      {
          throw new TokenException([
              'msg'=>'授权失败',
              'errorCode'=>10004
          ]);
      }
      else
      {
          $values=[
              'scope'=>$res->scope,
              'id'=>$res->id
          ];
          $token=$this->toSaveCache($values);
          return $token;
      }
  }
  public function toSaveCache($values)
  {
     $tokenService=new Token();
     $token=$tokenService->generatetoken();
     $res=cache($token,json_encode($values),config('setting.token_expire_in'));
     if(!$res)
     {
         throw new TokenException([
             'msg'=>'服务器缓存异常',
             'errorCode'=>10005
         ]);
     }
     return $res;
  }

}