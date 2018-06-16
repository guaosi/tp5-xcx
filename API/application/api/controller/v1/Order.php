<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/3/0003
 * Time: 11:56
 */

namespace app\api\controller\v1;


use app\api\vailate\IdMustBeInt;
use app\api\vailate\OrderPlace;
use app\api\service\Token as TokenModel;
use app\api\service\Order as OrderService;
use app\api\model\Order as OrderModel;
use app\api\vailate\PagingParameter;
use app\lib\exception\OrderException;
use app\lib\exception\SuccessMessage;

class Order extends BaseController
{
    protected $beforeActionList = [
        'needExclusiveScope' => ['only' => 'placeOrder'],
        'needPrimaryScope' => ['only' => 'getSummaryByUser']
    ];


    public function placeOrder()
    {
        (new OrderPlace())->goCheck();
        $products = input('post.products/a');
        $uid = TokenModel::getCurrentId();
        $OrderModel = new OrderService();
        $order = $OrderModel->place($uid, $products);
        return $order;
    }

    public function getDetail($id)
    {
        (new IdMustBeInt())->goCheck();
        $order=OrderModel::get($id);
        if(!$order){
            throw new OrderException();
        }
        return $order->hidden(['prepay_id']);
    }

    public function getSummaryByUser($page = 1, $size = 15)
    {
        (new PagingParameter())->goCheck();
        $uid = TokenModel::getCurrentId();
        $pageData = OrderModel::getSummaryByUser($uid, $page, $size);
        if ($pageData->isEmpty()) {
            return [
                'data' => [],
                'page' => $pageData->currentPage()
            ];
        }
        return [
            'data' => $pageData->hidden(['snap_items', 'snap_address', 'prepay_id'])->toArray(),
            'page' => $pageData->currentPage()
        ];
    }

    public function getSummaryAll($page = 1, $size = 20)
    {
        (new PagingParameter())->goCheck();
        $pageData = OrderModel::getSummaryAll($page, $size);
        if ($pageData->isEmpty()) {
            return [
                'data' => [],
                'page' => $pageData->currentPage()
            ];
        }
        return [
            'data' => $pageData->hidden(['snap_items', 'snap_address', 'prepay_id'])->toArray(),
            'page' => $pageData->currentPage()
        ];
    }
    public function delivery($id){
        (new IdMustBeInt())->goCheck();
        $order = new OrderService();
        $success = $order->delivery($id);
        if($success){
            return new SuccessMessage();
//            return [
//               'code'=>$result->code,
//                'msg'=>$result->msg,
//                'errorCode'=>$result->errorCode
//            ];
        }
    }
}