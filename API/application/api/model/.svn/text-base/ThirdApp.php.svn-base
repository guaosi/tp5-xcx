<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/8/0008
 * Time: 15:55
 */

namespace app\api\model;


use app\lib\exception\TokenException;

class ThirdApp extends Base
{
    public static function check($ac,$se)
    {
      $res=self::where('app_id','=',$ac)->where('app_secret','=',md5($se))->find();
      return $res;

    }
}