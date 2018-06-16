<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/8/0008
 * Time: 15:50
 */

namespace app\api\vailate;


class AppToken extends BaseVailate
{
protected $rule=[
    'ac'=>'require|isNotEmpty',
    'se'=>'require|isNotEmpty'
];
}