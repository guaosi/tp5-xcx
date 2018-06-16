import{Base} from '../../utils/base.js';
class Order extends Base
{
  constructor(){
    super();
    this._storageKeyName='newOrder'
  }
  doOrder(orderInfo,callback)
  {
    var that=this;
   var param={
    'url':'order',
    'type':'POST',
    data:{
      products:orderInfo
    },
    sCallback:function(data)
    {
     that.exeSetStorageSync(true);
     callback&&callback(data);
    },eCallbakc:function(){
    }
   };
   this.request(param);
  }
  getAllOrder(pageIndex,callback)
  {
    var param={
      'url':'order/by_user?page='+pageIndex,
      sCallback:function(res)
      {
        callback&&callback(res);
      },eCallback:function()
      {

      }
    }
    this.request(param);
  }
  getOrderInfoById(id,callback)
  {
    var param={
      url:'order/'+id,
      sCallback:function(res)
      {
       callback&&callback(res)
      }
    }
    this.request(param);
  }
  exeSetStorageSync(data)
  {
    wx.setStorageSync(this._storageKeyName, data);
  }
  execPay(orderNumber, callback) {
    var allParams = {
      url: 'pay/pre_order',
      type: 'post',
      data: { id: orderNumber },
      sCallback: function (data) {
        var timeStamp = data.timeStamp;
        if (timeStamp) { //可以支付
          wx.requestPayment({
            'timeStamp': timeStamp.toString(),
            'nonceStr': data.nonceStr,
            'package': data.package,
            'signType': data.signType,
            'paySign': data.paySign,
            success: function () {
              callback && callback(2);
            },
            fail: function () {
              callback && callback(1);
            }
          });
        }
        else {
          callback && callback(0);
        }
      }
    };
    this.request(allParams);
  }
  hasNewOrder() 
  {
    var flag = wx.getStorageSync(this._storageKeyName);
    return flag ? true : false;
  }
  //当有微信支付时，请屏蔽这个函数，非常危险！！！
  successPay(id, formId,callback) {
    var param={
      url:'pay/successpay',
      type:'POST',
      data:{
        'id':id,
        'formId': formId
      },
      sCallback:function(res)
      {
         callback&&callback(res);
      },eCallback:function(){

      }
    }
    this.request(param);
  }

}
export {Order};