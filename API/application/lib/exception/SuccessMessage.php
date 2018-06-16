<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/2/0002
 * Time: 21:01
 */

namespace app\lib\exception;


class SuccessMessage extends BaseException
{
    public $code=201;
    public $msg='ok';
    public $errorCode=0;
}