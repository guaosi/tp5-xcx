<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 18:27
 */

namespace app\api\model;


use think\Model;

class Category extends Model
{
    protected $hidden=['delete_time','update_time'];
   public function imgUrl(){
       return $this->belongsTo('image','topic_img_id','id');
   }
   public static function getTopicImg(){
       return self::with('imgUrl')->select();
   }
}