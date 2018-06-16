<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 12:11
 */

namespace app\api\model;


use app\lib\exception\ThemeException;

class Theme extends Base
{
    public function topImg(){
        return $this->belongsTo('image','topic_img_id','id');
    }
    public function headImg(){
        return $this->belongsTo('image','head_img_id','id');
    }
    public function products(){
        return $this->belongsToMany('product','theme_product','product_id','theme_id');
    }
    public static function getSimpleListByIds($ids){
           $res=self::with(['topImg','headImg'])->where('id','in',$ids)->select();
               return $res;

    }
    public static function getThemeWithProductsById($id){
          $theme=self::with(['products','headImg','topImg'])->find($id);
          return $theme;
    }
}