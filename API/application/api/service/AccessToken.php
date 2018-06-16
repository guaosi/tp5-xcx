<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/8/0008
 * Time: 18:29
 */

namespace app\api\service;


use think\Exception;

class AccessToken
{
 private $tokenUrl;
 const TOKEN_CACHED_KEY='access';
 const TOKEN_EXPIRE_IN=7000;
 public function __construct()
 {
     $url=config('wx.access_token_url');
     $url=sprintf($url,config('wx.appid'),config('wx.secret'));
     $this->tokenUrl=$url;
 }
 public function get()
 {
     $Accesstoken=$this->getFromCache();
     if(!$Accesstoken)
     {
         return $this->getFromServer();
     }
     else
     {
         return $Accesstoken;
     }
 }
 private function getFromCache()
 {
     $Accesstoken=cache(self::TOKEN_CACHED_KEY);
     if($Accesstoken)
     {
        return $Accesstoken;
     }
     return null;
 }
private function getFromServer()
{
    $token=curl_get($this->tokenUrl);
    $token=json_decode($token,true);
    if(!$token)
    {
        throw new Exception('获取AccessToken异常');
    }
    if(!empty($token['errcode']))
    {
        throw new Exception($token['errmsg']);
    }
    $this->saveToCache($token['access_token']);
    return $token['access_token'];
}
private function saveToCache($token)
{
    cache(self::TOKEN_CACHED_KEY, $token, self::TOKEN_EXPIRE_IN);
}

}