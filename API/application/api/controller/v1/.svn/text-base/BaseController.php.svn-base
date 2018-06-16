<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/3/0003
 * Time: 12:15
 */

namespace app\api\controller\v1;

use app\api\service\Token;
use think\Controller;

class BaseController extends Controller
{
//    用户与管理员都可以访问
    protected function needPrimaryScope(){
      Token::checkPrimaryScope();
    }
    //    只有用户可以访问
    protected function needExclusiveScope(){
        Token::checkExclusiveScope();
    }
}