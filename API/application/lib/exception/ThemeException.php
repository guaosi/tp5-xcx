<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 14:53
 */

namespace app\lib\exception;


class ThemeException extends BaseException
{
   public $code=404;
    public $msg='请求的主题不存在';
    public $errorCode='30000';
}