<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/7/31/0031
 * Time: 11:15
 */

namespace app\lib\exception;


class BannerMissException extends BaseException
{
   public $code=404;
   public $msg='请求的Banner信息没有找到';
   public $errorCode=40000;
}