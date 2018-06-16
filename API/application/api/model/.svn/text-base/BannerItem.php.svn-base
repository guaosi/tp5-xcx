<?php

namespace app\api\model;

use think\Model;

class BannerItem extends Model
{
    protected $hidden=['id','img_id','update_time','delete_time','banner_id'];
    //
    public function img(){
        return $this->belongsTo('Image','img_id','id');
    }
}
