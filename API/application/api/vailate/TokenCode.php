<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 20:45
 */

namespace app\api\vailate;


class TokenCode extends BaseVailate
{
   protected $rule=[
       'code'=>'require|isNotEmpty'
   ];
   protected $message=[
       'code'=>'没有code无法获取token'
   ];
}