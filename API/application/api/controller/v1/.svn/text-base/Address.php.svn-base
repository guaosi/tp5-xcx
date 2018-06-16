<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/2/0002
 * Time: 16:20
 */

namespace app\api\controller\v1;

use app\api\model\User as UserModel;
use app\api\model\UserAddress;
use app\api\service\Token;
use app\api\vailate\AddressNewVailate;
use app\lib\exception\SuccessMessage;
use app\lib\exception\UserException;

class Address extends BaseController
{
    protected $beforeActionList=[
        'needPrimaryScope'=>['only'=>'createOrSaveUser,getUserAddress']
    ];


   public function createOrSaveUser(){
       $vailate=new AddressNewVailate();
       $vailate->goCheck();
//       获取uid;
         $uid=Token::getCurrentId();
         $user=UserModel::get($uid);
         if(!$user)
         {
             throw new UserException();
         }
//         获取传入的信息
           $dataArray=$vailate->getDataByValue();
//         这样写法指定$uid可以获取user_address的所有信息 手册里可以看到
         $userAddress=$user->getAddress;
         if(!$userAddress)
         {
//             不存在  新增
             $user->getAddress()->save($dataArray);
         }else{
//             存在，更新
             $user->getAddress->save($dataArray);
         }
         return json(new SuccessMessage(),201);

   }
   public function getUserAddress()
   {
       $uid=Token::getCurrentId();
       $address=UserAddress::where('user_id',$uid)->find();
       if(!$address)
       {
           throw new UserException([
               'msg'=>'用户地址不存在',
               'errorCode'=>60001
           ]);
       }
       return $address;
   }
}