<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/7/31/0031
 * Time: 13:01
 */

namespace app\lib\exception;


class ParameterException extends BaseException
{
  public $code=400;
  public $msg='通用参数错误';
  public $errorCode=10000;
}