<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/2/0002
 * Time: 12:20
 */

namespace app\api\model;


use think\Model;

class ProductImage extends Model
{
    protected $hidden=['delete_time','img_id','product_id'];
   public function imgurl(){
       return $this->belongsTo('Image','img_id','id');
   }
}