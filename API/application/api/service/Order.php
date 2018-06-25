<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/3/0003
 * Time: 19:42
 */

namespace app\api\service;

use app\api\model\OrderProduct;
use app\api\model\Product;
use app\api\model\Order as OrderModel;
use app\api\model\UserAddress;
use app\lib\enum\OrderStatus;
use app\lib\exception\OrderException;
use app\lib\exception\UserException;
use think\Db;
use think\Exception;

class Order
{
//    根据post订单传入的信息
    protected $oProducts;
//     根据传入的信息获取到的
    protected $products;
    protected $uid;

    public function place($uid, $products)
    {
        $this->oProducts = $products;
        $this->uid = $uid;
        $this->products = $this->getProductByOrderP();
        $status=$this->getOrderStatus();
        if (!$status['pass']) {
            $status['order_id'] = -1;
            return $status;
        }
        $snap = $this->snapOrder($status);
        $order=$this->createOrder($snap);
        $order['pass']=true;
        return $order;
    }

//  根据客户端传入的商品组id编号来获得商品的信息
    private function getProductByOrderP()
    {
        $productIds = [];
        foreach ($this->oProducts as $val) {
            $productIds[] = $val['product_id'];
        }
        $products = Product::all($productIds);
        $products = $products->visible(['id', 'price', 'stock', 'name', 'main_img_url'])->toArray();
        return $products;
    }

//    创建订单
    public function createOrder($snap)
    {
        Db::startTrans();
        try{
        $order = new \app\api\model\Order();
        $order->order_no = self::makeOrderNo();
        $order->user_id = $this->uid;
        $order->total_price = $snap['orderPirce'];
        $order->snap_img = $snap['snapImg'];
        $order->snap_name = $snap['snapName'];
        $order->snap_address = $snap['snapAddress'];
        $order->total_count = $snap['totalCount'];
        $order->snap_items = json_encode($snap['pStatus']);
        $order->save();
        }
        catch (Exception $ex){
            Db::rollback();
            throw $ex;
        }
        $orderId=$order->id;
        $createTime=$order->create_time;
        foreach ($this->oProducts as &$val)
        {
         $val['order_id']=$orderId;
        }
        $orderProduct=new OrderProduct();
        $orderProduct->allowField(true)->saveAll($this->oProducts);
        Db::commit();
        return [
            'order_no'=>$order->order_no,
            'create_time'=>$createTime,
            'order_id'=>$orderId
        ];
    }

    public static function makeOrderNo()
    {
        $yCode = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J');
        $orderSn =
            $yCode[intval(date('Y')) - 2017] . strtoupper(dechex(date('m'))) . date(
                'd') . substr(time(), -5) . substr(microtime(), 2, 5) . sprintf(
                '%02d', rand(0, 99));
        return $orderSn;
    }


//    生成订单快照的信息
    public function snapOrder($status)
    {
        $snap = [
            'orderPirce' => 0,
            'totalCount' => 0,
            'pStatus' => [],
            'snapImg' => '',
            'snapAddress' => '',
            'snapName' => ''
        ];
        $products = $this->products;
        $number = count($products);
        $snap['orderPirce'] = $status['orderPrice'];
        $snap['totalCount'] = $status['totalCount'];
        $snap['pStatus'] = $status['pstatusArray'];
        $snap['snapImg'] = $products[0]['main_img_url'];
        $snap['snapName'] = $number > 1 ? $products[0]['name'] . '等' : $products[0]['name'];
        $snap['snapAddress'] = json_encode($this->getUserAddress());
        return $snap;
    }

    private function getUserAddress()
    {
        $userAddress = UserAddress::where('user_id', '=', $this->uid)->find();
        if (!$userAddress) {
            throw new UserException([
                'msg' => '用户地址不存在',
                'errorCode' => '60001'
            ]);
        }
        return $userAddress;
    }

//    检查传入的订单的状态 并且存入数组返回
    private function getOrderStatus()
    {
        $status = [
            'pass' => true,
            'orderPrice' => 0,
            'totalCount' => 0,
            'pstatusArray' => []
        ];
        foreach ($this->oProducts as $val) {
            $pstatus = $this->getProductStatus($val['product_id'], $val['count'], $this->products);
            if (!$pstatus['haveStock']) {
                $status['pass'] = false;
            }
            $status['orderPrice'] += $pstatus['totalPrice'];
            $status['totalCount'] += $pstatus['count'];
            $status['pstatusArray'][] = $pstatus;
        }
        return $status;


    }

//   检查每一个商品的状态，并且存入数组返回
    private function getProductStatus($oPid, $oCount, $products)
    {
        $pstatus = [
            'id' => null,
            'haveStock' => false,
            'count' => 0,
            'price'=>0,
            'main_img_url'=>'',
            'name' => '',
            'totalPrice' => 0
        ];
        $pIndex = -1;
        for ($i = 0; $i < count($products); $i++) {
            if ($products[$i]['id'] == $oPid) {
                $pIndex = $i;
            }
        }
        if ($pIndex == -1) {
            throw new OrderException([
                'msg' => '请求的商品不存在,请重新确认'
            ]);
        } else {
            $product = $products[$pIndex];
            $pstatus['id'] = $product['id'];
            $pstatus['count'] = $oCount;
            $pstatus['name'] = $product['name'];
            $pstatus['price'] = $product['price'];
            $pstatus['main_img_url'] = $product['main_img_url'];
            $pstatus['totalPrice'] = $oCount * $product['price'];

            $productinfo=Product::get($product['id']);
            if ($productinfo->stock - $oCount > 0) {
                $pstatus['haveStock'] = true;
            }
            return $pstatus;
        }
    }
//    提供给外部的入口 检查商品库存量 获取商品所有信息
    public function checkOrderstock($orderId){
            $products=OrderProduct::where('order_id','=',$orderId)->select();
            $products=$products->toArray();
            $this->oProducts=$products;
            $this->products=$this->getProductByOrderP($products);
            $status=$this->getOrderStatus();
            return $status;
    }
    public function delivery($orderID, $jumpPage = '')
    {
        $order = OrderModel::where('id', '=', $orderID)
            ->find();
        if (!$order) {
            throw new OrderException();
        }
        if ($order->status != OrderStatus::PAID) {
            throw new OrderException([
                'msg' => '还没付款呢，想干嘛？或者你已经更新过订单了，不要再刷了',
                'errorCode' => 80002,
                'code' => 403
            ]);
        }
        $order->status = OrderStatus::DELIVERED;
        $order->save();
        //            ->update(['status' => OrderStatusEnum::DELIVERED]);
        $message = new DeliveryMessage();
        return $message->sendDeliveryMessage($order, $jumpPage);
    }



}