<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 20:48
 */

namespace app\api\service;

use app\lib\enum\ScopeEnum;
use app\lib\exception\TokenException;
use app\lib\exception\WxchatException;
use think\Exception;
use app\api\model\User;

class UserToken extends Token
{
    protected $code;
    protected $appid;
    protected $secret;
    protected $Login_url;

    public function __construct($code)
    {
        $this->code = $code;
        $this->appid = config('wx.appid');
        $this->secret = config('wx.secret');
        $this->Login_url = sprintf(config('wx.Login_url'), $this->appid, $this->secret, $this->code);
    }

    public function getUserToken()
    {
        $wxres = requestCURL($this->Login_url);
        $wxres = json_decode($wxres, true);
        if (empty($wxres)) {
            throw new Exception('无法获取openid以及session_key，微信服务器内部错误');
        } else {
            $loginfail = array_key_exists('errcode', $wxres);
            if ($loginfail) {
                $this->processLoginError($wxres);
            } else {
                return $this->grantToken($wxres);
            }
        }
    }

    private function processLoginError($wxres)
    {
        throw new WxchatException([
            'code' => $wxres['errcode'],
            'msg' => $wxres['errmsg']
        ]);
    }

    private function grantToken($wxres)
    {
//       1.判断用户是否已经存在 存在，返回uid，不存在，插入后返回uid
//       2.准备缓存  要缓存的字段 wxres uid scope key值设置为令牌 并且将他们保存到缓存中(缓存速度快，用数据库也可以)
//       3.将key返回，作为token令牌，返回客户端
        $openid = $wxres['openid'];
        $user = User::SearchUser($openid);
//        获取uid
        if ($user) {
            $uid = $user->id;
        } else {
            $uid = User::createUser($openid);
        }
        $cacheValue=$this->prepareCacheValue($wxres,$uid);
        return $this->saveToken($cacheValue);

    }
    private function prepareCacheValue($wxres,$uid){
        $cacheValue=$wxres;
        $cacheValue['uid']=$uid;
        $cacheValue['scope']=ScopeEnum::User;
//        $cacheValue['scope']=15;
        return $cacheValue;
    }
    private function saveToken($cacheValue){
        $key=$this->generatetoken();
        $cache=json_encode($cacheValue);
        $cacheres=cache($key,$cache,7200);
        if(!$cacheres)
        {
          throw new TokenException([
              'msg'=>'服务器缓存异常',
              'errorCode'=>10005
          ]);
        }
        return $key;
    }
}