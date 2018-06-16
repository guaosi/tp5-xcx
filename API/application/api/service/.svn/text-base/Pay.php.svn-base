<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/4/0004
 * Time: 11:51
 */

namespace app\api\service;

use app\api\model\Order as orderModel;
use app\lib\enum\OrderStatus;
use app\lib\exception\OrderException;
use app\lib\exception\TokenException;
use app\lib\exception\WxchatException;
use think\Exception;
use think\Loader;
use think\Log;
Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');
class Pay
{
    protected $orderId;
    protected $orderNo;

    public function __construct($orderId)
    {
        if (!$orderId) {
            throw new Exception('订单号不允许为NULL');
        }
        $this->orderId = $orderId;
    }

    public function pay()
    {
//        先进行检查 1. 订单是否存在  2.订单与客户是否相符合  3.订单的状态
        $this->checkOrderStatus();
//   支付的时候，还要进行一次库存量检测，因为用户下单有可能不会立即支付
        $orderService=new Order();
        $status=$orderService->checkOrderstock($this->orderId);
        if(!$status['pass'])
        {
            return $status;
        }
        $preOrder=$this->makeWxPreOrder($status['orderPrice']);
        return $preOrder;
    }
    private function makeWxPreOrder($totalPrice){
        $openid=Token::getCurrentTokenVar('openid');
        if(!$openid)
        {
            throw new TokenException();
        }
//        设置微信支付预订单的参数
        $WxPay=new \WxPayUnifiedOrder();
//        设置订单编号
        $WxPay->SetOut_trade_no($this->orderNo);
//        小程序是JSAPI
        $WxPay->SetTrade_type('JSAPI');
//        订单总价格，微信单位是分
        $WxPay->SetTotal_fee($totalPrice*100);
        $WxPay->SetBody('V度零食贩');
//        用户小程序ID
        $WxPay->SetOpenid($openid);
//        支付回调地址
//        将WxPay.Api.php 第537行改为false 就可以不用https
        $WxPay->SetNotify_url(config('secure.pay_back_url'));
        return $this->getPaysignTrue($WxPay);
    }
    private function getPaysignTrue($WxOrderData){
//           获取微信预订单
        $wxOrder=\WxPayApi::unifiedOrder($WxOrderData);
        dump($wxOrder);
        if($wxOrder['return_code']!='SUCCESS'||$wxOrder['result_code']!='SUCCESS')
        {
            Log::record($wxOrder,'error');
            Log::record('获取预订单失败','error');
            throw new WxchatException([
              'msg'=>'由于没有商户号,所以微信预订单获取失败',
                'errorCode'=>80005
            ]);
        }
//        $wxOrder是一个数组 其中prepay_id是返回用户一条消息的，需要保存到数据库
        $this->prepayIdToSave($wxOrder['prepay_id']);
        return $this->sign($wxOrder['prepay_id']);

    }
//    制作签名
    private function sign($prepay_id){
      $jsApiPayData=new \WxPayJsApiPay();
      $jsApiPayData->SetAppid(config('wx.appid'));
      $jsApiPayData->SetTimeStamp((string)time());
      $rand=md5(time().mt_rand(0,1000));
      $jsApiPayData->SetNonceStr($rand);
      $jsApiPayData->SetPackage('prepay_id='.$prepay_id);
      $jsApiPayData->SetSignType('md5');
//      制作签名
      $sign=$jsApiPayData->MakeSign();
//      获得设置过的数据
      $signValue=$jsApiPayData->GetValues();
      $signValue['paySign']=$sign;
//      因为appid没有用，所以可以去掉
      unset($signValue['appid']);
      return $signValue;

    }
    private function prepayIdToSave($prepay_id){
        \app\api\model\Order::get($this->orderId)->save(['prepay_id'=>$prepay_id]);

    }


    private function checkOrderStatus(){
         $orderinfo=orderModel::get($this->orderId);
         if(!$orderinfo)
         {
             throw new OrderException();
         }
         if(!Token::checkOrderwithUser($orderinfo->user_id))
         {
            throw new OrderException([
                'msg'=>'订单与当前用户不匹配',
                'errorCode'=>'80004'
            ]);
         }
         if($orderinfo->status!=OrderStatus::UNPAID)
         {
            throw new OrderException([
                'msg'=>'订单已经支付过啦~',
                'errorCode'=>80003
            ]);
         }
         $this->orderNo=$orderinfo->order_no;
         return true;
    }
    //    当有微信支付时，请屏蔽这个函数，非常危险！！！
    public static function successPay($id,$uid,$formId)
    {
       $orderInfo=\app\api\model\Order::get($id);
       if($orderInfo->user_id!=$uid)
       {
           throw new OrderException([
               'msg'=>'订单与当前用户不匹配',
               'errorCode'=>'80004'
           ]);
       }
       else
       {
           if($orderInfo->status!=1)
           {
               throw new OrderException([
                   'msg'=>'订单已经支付过啦~',
                   'errorCode'=>80003
               ]);
           }
           $orderInfo->save(['status'=>'2','form_id'=>$formId]);
           return true;
       }
    }
}