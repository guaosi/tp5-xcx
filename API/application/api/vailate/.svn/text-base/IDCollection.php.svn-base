<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 13:55
 */

namespace app\api\vailate;


class IDCollection extends BaseVailate
{
  protected $rule=[
    'ids'=>'require|checkIDs'
  ];
  protected $message=[
      'ids'=>'ids里的每一个都是正整数'
  ];
  protected function checkIDs($value,$rule='',$data='',$field=''){
       $value=str_replace('，',',',$value);
       $values=explode(',',$value);
       foreach ($values as $val)
       {
           if(!$this->IdMustPositive($val))
           {
               return false;
           }
       }
       return true;
  }
}