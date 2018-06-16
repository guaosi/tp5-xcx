<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 18:23
 */

namespace app\api\controller\v1;
use app\api\model\Category as Categorymodel;
use app\lib\exception\CategoryException;

class Category
{
    /**
     * 获取所有分类信息
     * @url /category/all
     */
   public function getAllCategory(){
       $categories=Categorymodel::getTopicImg();
       if($categories->isEmpty())
       {
          throw new CategoryException();
       }
       return $categories;
   }
}