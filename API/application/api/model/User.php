<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 20:47
 */

namespace app\api\model;


use think\Model;

class User extends Model
{
    public function getAddress(){
        return $this->hasOne('user_address','user_id','id');
    }
    public static function SearchUser($openid)
    {
        return self::where('openid', '=', $openid)->find();
    }

    public static function createUser($openid)
    {
        return self::create(['openid' => $openid]);
    }

}