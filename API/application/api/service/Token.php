<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/2/0002
 * Time: 10:54
 */

namespace app\api\service;


use app\lib\enum\ScopeEnum;
use app\lib\exception\TokenException;
use app\lib\exception\ForbiddenException;
use think\Cache;
use think\Exception;
use think\Request;

class Token
{
//    颁发token
   protected function generatetoken(){
        $str=getRandChar(32);
        $timestamp=time();
        $salt=config('secure.salt_token');
        return md5($str.$timestamp.$salt);
   }
   public static function getCurrentTokenVar($key){
//       从header获取token
       $token=Request::instance()->header('token');
       if(!$token)
       {
           throw new TokenException();
       }
       $cache=cache($token);
       if(!$cache)
       {
           throw new TokenException();
       }
       else
       {
           //       将cache转为数组，判断cache是否为数组，因为如果是redis，则取得缓存就是数组形式
           if(!is_array($cache))
           {
               $cache=json_decode($cache,true);
           }
//       根据$key判断是否有这个索引，没有的话证明是乱传入的索引
           if(!array_key_exists($key,$cache))
           {
               throw new Exception('尝试获取的索引不存在');
           }
           return $cache[$key];
       }

   }
//   获取当前用户的UID
   public static function getCurrentId(){
         return self::getCurrentTokenVar('uid');
   }
//   需要普通用户权限与cms管理员权限
   public static function checkPrimaryScope(){
        $scope=self::getCurrentTokenVar('scope');
        if($scope)
        {
            if($scope<ScopeEnum::User)
            {
                throw new ForbiddenException();
            }
            else
            {
                return true;
            }
        }
        else
        {
            throw new TokenException();
        }
    }
//   只能普通用户权限
    public static function checkExclusiveScope(){
        $scope=self::getCurrentTokenVar('scope');
        if($scope)
        {
            if($scope==ScopeEnum::User)
            {
                return true;

            }
            else
            {
                throw new ForbiddenException();
            }
        }
        else
        {
            throw new TokenException();
        }
    }
    public static function checkOrderwithUser($checkUID){
             if(!$checkUID)
             {
                throw new Exception('被检查的UID不存在');
             }
             $uid=self::getCurrentId();
             if($uid==$checkUID)
             {
                 return true;
             }
             return false;
    }
    public static function isVerifyToken($token)
    {
       $res=Cache::get($token);
       if(!$res)
       {
           return false;
       }
       return true;
    }
}