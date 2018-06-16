<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/3/0003
 * Time: 23:26
 */

namespace app\api\model;


use think\Model;

class Order extends Model
{
  protected $hidden=[
      'user_id','delete_time','update_time'
  ];
  protected $autoWriteTimestamp=true;
  public function getSnapItemsAttr($value){
         if(!$value){
             return null;
         }
         return json_decode($value,true);
  }
    public function getSnapAddressAttr($value){
        if(!$value){
            return null;
        }
        return json_decode($value,true);
    }
  public static function getSummaryByUser($uid,$page,$size)
  {
     return self::where('user_id','=',$uid)
         ->order('id','desc')
         ->paginate($size,true,['page'=>$page]);
  }
  public static function getSummaryAll($page, $size)
  {
      return self::order('id','desc')->paginate($size,true,['page'=>$page]);

  }
}