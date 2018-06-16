<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 16:29
 */

namespace app\api\controller\v1;

use app\api\model\Product as ProductModel;
use app\api\vailate\Count;
use app\api\vailate\IdMustBeInt;
use app\lib\exception\ProductException;

class Product
{
    /**
     * 获取最新商品
     * @url /product/recent?[count=15]
     * @param int $count 根据传入的count决定显示数量
     * @return string
     */
    public function getRecent($count=15){
        (new Count())->goCheck();
        $products=ProductModel::getRecentProducts($count);
        if($products->isEmpty())
        {
           throw new ProductException();
        }
        $products->hidden(['summary']);
        return $products;
    }
    public function getAllByCategoryId($id=''){
        (new IdMustBeInt())->goCheck();
         $products=ProductModel::getProductByCategoty($id);
         if($products->isEmpty())
         {
             throw new ProductException();
         }
         return $products;
    }
    public function getOne($id=''){
        (new IdMustBeInt())->goCheck();
         $product=ProductModel::getProductDetail($id);
         if(!$product)
         {
           throw new ProductException();
         }
         return $product;
    }
}