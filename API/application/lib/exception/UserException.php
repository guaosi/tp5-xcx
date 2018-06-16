<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/2/0002
 * Time: 20:39
 */

namespace app\lib\exception;


class UserException extends BaseException
{
  public $code='404';
  public $msg='用户不存在';
  public $errorCode='60000';
}