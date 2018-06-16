<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 12:12
 */

namespace app\api\model;


class product extends Base
{
   protected $hidden=[
       'delete_time','update_time','category_id','from','create_time','pivot'
   ];
   protected function getmainImgUrlAttr($value,$data){
       return $this->prefixImgUrl($value,$data);
   }
   public function imgs(){
       return $this->hasMany('ProductImage','product_id','id');
   }
   public function property(){
       return $this->hasMany('ProductProperty','product_id','id');
   }



   public static function getRecentProducts($count){
       $products=self::limit($count)
           ->order('create_time desc')
           ->select();
       return $products;
   }
   public static function getProductByCategoty($category_id){
       $products=self::where('category_id','=',$category_id)->select();
       return $products;
   }
   public static function getProductDetail($id){
       $product=self::with(['imgs'=>function($query){
          $query->with('imgUrl')->order('order','asc');
      }])->with(['property'])->find($id);
       return $product;
   }
}