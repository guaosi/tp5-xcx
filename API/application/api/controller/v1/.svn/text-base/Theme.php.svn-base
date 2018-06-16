<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 12:11
 */

namespace app\api\controller\v1;


use app\api\vailate\IDCollection;
use app\api\model\Theme as ThemeModel;
use app\api\vailate\IdMustBeInt;
use app\lib\exception\ThemeException;

class Theme
{
    /**
     * 返回根据$ids获得的专题图片信息
     * @url /theme?ids=1,2,3......
     * @param $ids 必须是正整数
     */
    public function getSimpleList($ids=''){
        (new IDCollection())->goCheck();
         $res=ThemeModel::getSimpleListByIds($ids);
         if($res->isEmpty())
         {
             throw new ThemeException();
         }
         return $res;
    }

    /**
     * 返回根据id获得的专题信息以及信息底下所有商品
     * @url /theme/id
     * @param $id 必须是正整数
     *
     */
    public function getComplexOne($id=''){
        (new IdMustBeInt())->goCheck();
        $res=ThemeModel::getThemeWithProductsById($id);
        if(!$res)
        {
            throw new ThemeException();
        }
        return $res;
    }


}