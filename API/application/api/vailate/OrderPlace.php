<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/3/0003
 * Time: 16:33
 */

namespace app\api\vailate;


use app\lib\exception\ParameterException;

class OrderPlace extends BaseVailate
{
//   数据格式 $products=[
//           ['product_id'=>1,'count'=>3],
//           ['product_id'=>2,'count'=>3],
//           ['product_id'=>3,'count'=>3],
//           ],
    protected $rule=[
        'products'=>'checkproducts'
    ];
    protected $singlerule=[
        'product_id'=>'require|IdMustPositive',
        'count'=>'require|IdMustPositive'
    ];
    public function checkproducts($value,$rule='',$data='',$field='')
    {
        if(empty($value))
        {
            throw new ParameterException([
                'msg'=>'商品列表不能为空'
            ]);
        }
        if(!is_array($value))
        {
            throw new ParameterException([
                'msg'=>'商品列表参数错误'
            ]);
        }
        foreach ($value as $key=>$val)
        {
           $this->checkproduct($val);
        }
        return true;
    }
    protected function checkproduct($val){
        $vailate=new BaseVailate($this->singlerule);
        $result=$vailate->check($val);
        if(!$result)
        {
            throw new ParameterException([
                'msg'=>'商品列表参数错误'
            ]);
        }
    }

}