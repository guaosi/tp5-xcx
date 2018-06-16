<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/7/30/0030
 * Time: 15:47
 */

namespace app\api\controller\v1;
use app\api\model\Banner as BannerModel;
use app\api\vailate\IdMustBeInt;
use app\lib\exception\BannerMissException;

class Banner
{
    /**
     * 该函数用来获取指定轮播图的信息
     * @url:banner/:id
     * @http:GET
     * @id 需要的轮播图id
     */
    public function getbanner($id='')
    {
        (new IdMustBeInt())->goCheck();
        $res=BannerModel::getBannerById($id);
       if(!$res)
       {
         throw new BannerMissException();
       }


       return $res;

    }
}