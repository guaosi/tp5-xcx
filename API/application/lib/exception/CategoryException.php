<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/1/0001
 * Time: 18:27
 */

namespace app\lib\exception;


class CategoryException extends BaseException
{
  public $code=404;
  public $msg='请求的分类参数错误';
  public $errorCode=50000;
}