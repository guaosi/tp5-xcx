<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/2/0002
 * Time: 23:47
 */

namespace app\lib\exception;


use think\Exception;

class ForbiddenException extends BaseException
{
    public $code=403;
    public $msg='权限不足';
    public $errorCode=10001;
}