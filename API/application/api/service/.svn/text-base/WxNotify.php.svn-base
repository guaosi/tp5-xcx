<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/4/0004
 * Time: 19:41
 */

namespace app\api\service;

use app\lib\enum\OrderStatus;
use think\Db;
use think\Exception;
use think\Loader;
use app\api\model\Product as ProductModel;
use app\api\model\Order as OrderModel;
use think\Log;

Loader::import('WxPay.WxPay', EXTEND_PATH, '.Api.php');

class WxNotify extends \WxPayNotify
{
    public function NotifyProcess($data, &$msg)
    {
//   return true或者false 只是控制微信是否还要继续回调
        if ($data['result_code'] == 'SUCCESS') {
//      用户支付成功
            $orderNo = $data['out_trade_no'];
            Db::startTrans();
            try {
                $orderinfo = OrderModel::where('order_no', '=', $orderNo)->lock(true)->find();
//          只有状态是未支付的才可以
                if ($orderinfo->status == OrderStatus::UNPAID) {
                    $orderService = new Order();
                    $status = $orderService->checkOrderstock($orderinfo->id);
//              检查库存量
                    if ($status['pass']) {
//                  库存量足够
//                    改变订单状态
                        $this->updateStatus($orderinfo->id, true);
//                    减少库存量
                        $this->reduceStock($status['pstatusArray']);
                    } else {
//                  库存量不足，超卖
                        $this->updateStatus($orderinfo->id, false);
                    }
                    Db::commit();
                    return true;
                }
            } catch (Exception $ex) {
               Db::rollback();
               Log::record($ex,'error');
               return false;
            }
        } else {
//        用户支付失败  微信不用再发送异步回调 发了也没用
            return true;
        }
    }

    private function updateStatus($orderId, $change)
    {
        $statu = $change ? OrderStatus::PAID : OrderStatus::PAID_BUT_OUT_OF;
        $orderModel = new OrderModel();
        $orderModel->where('id', '=', $orderId)->lock(true)->update(['status' => $statu]);
    }

    private function reduceStock($products)
    {
        foreach ($products as $val) {
            ProductModel::where('id', '=', $val['id'])->lock(true)->setDec('stock', $val['count']);
        }
    }
}