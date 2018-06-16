<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/3/0003
 * Time: 20:49
 */

namespace app\lib\exception;


class OrderException extends BaseException
{
    public $code=404;
    public $msg='请求的订单不存在';
    public $errorCode=80000;
}