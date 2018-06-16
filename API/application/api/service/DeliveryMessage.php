<?php
/**
 * Create By guaosi
 * Author guaosi
 * Date: 2017/8/8/0008
 * Time: 18:53
 */

namespace app\api\service;


use app\api\model\User;
use app\lib\exception\OrderException;
use app\lib\exception\UserException;

class DeliveryMessage extends WxMessage
{
    const DELIVERY_MSG_ID ='4aJvWMNDrtlC-FITcr6zxYa-0p8m4Z7bEq-uCrdkoGE';

    public function sendDeliveryMessage($order, $tplJumpPage = '')
    {
        if (!$order) {
            throw new OrderException();
        }
        $this->tplID = self::DELIVERY_MSG_ID;
//        $this->formID = $order->prepay_id;
        $this->formID=$order->form_id;
        $this->page = $tplJumpPage;
        $this->prepareMessageData($order);
        $this->emphasisKeyWord='keyword2.DATA';
        return parent::sendMessage($this->getUserOpenID($order->user_id));
    }

    private function prepareMessageData($order)
    {

        $dt = new \DateTime();
        $data = [
            'keyword1' => [
                'value' => $order->order_no
            ],
            'keyword2' => [
                'value' => $order->snap_name,
                'color' => '#27408B'
            ],
            'keyword3' => [
                'value' => $order->update_time
            ],
            'keyword4' => [
                'value' => $dt->format("Y-m-d H:i")
            ],
            'keyword5' => [
                'value' => $order->total_price
            ],
            'keyword6' => [
                'value' => '当您看到此则消息，表示已经发货了~当然是假的啦~感谢您的耐心体验~'
            ]

        ];
        $this->data = $data;
    }

    private function getUserOpenID($uid)
    {
        $user = User::get($uid);
        if (!$user) {
            throw new UserException();
        }
        return $user->openid;
    }

}