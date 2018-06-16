<?php

namespace app\api\model;

use think\Model;

class Base extends Model
{
    //
    protected function prefixImgUrl($value,$data){
        $finalUrl='';
        if($data['from']==1)
        {
            $finalUrl=config('setting.IMG_PREFIX').$value;
        }
        else if ($data['from']==2)
        {
            $finalUrl=$value;
        }
        return $finalUrl;
    }
}
