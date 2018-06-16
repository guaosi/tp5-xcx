<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/2/0002
 * Time: 20:43
 */

namespace app\api\model;


use think\Model;

class UserAddress extends Model
{
   protected $hidden=[
       'delete_time','update_time','user_id'
   ];
}