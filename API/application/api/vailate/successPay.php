<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/8/0008
 * Time: 17:39
 */

namespace app\api\vailate;


class successPay extends BaseVailate
{
   protected $rule=[
       'id'=>'require|number|IdMustPositive',
       'formId'=>'require|isNotEmpty'
   ];
}