<?php

namespace app\api\model;

class Image extends Base
{
    protected $visible=['url'];
    //

    public function getUrlAttr($value,$data){
        return $this->prefixImgUrl($value,$data);
    }
}
