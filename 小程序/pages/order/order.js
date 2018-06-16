// order.js
import{Cart} from '../cart/cart-model.js';
import{Order}from 'order-model.js';
import{Address}from '../../utils/address.js';
var cart=new Cart();
var order=new Order();
var address=new Address();

Page({

  /**
   * 页面的初始数据
   */
  data: {
   account:0,
   orderStatus: 0,
   id:null
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var from=options.form;
    if (from=='cart')
    {
      this.data.account = options.account;
      this._fromCart();
    }
    else
    {
      this.data.id = options.id;
      this._fromMy(this.data.id);
    }

  },
  onShow: function () {
    if (this.data.id) {
      this._fromMy(this.data.id);
    }
  },
  _fromMy:function(id)
  {

      // 订单结果的返回页面
      var that = this;
      //下单后，支付成功或者失败后，点左上角返回时能够更新订单状态 所以放在onshow中
      // var id = this.data.id;
      order.getOrderInfoById(id, (data) => {
        that.setData({
          orderStatus: data.status,
          productsArr: data.snap_items,
          account: data.total_price,
          basicInfo: {
            orderTime: data.create_time,
            orderNo: data.order_no
          },
        });

        // 快照地址
        var addressInfo = data.snap_address;
        addressInfo.totalDetail = address.setAddressInfo(addressInfo);
        that._bindAddressInfo(addressInfo);
      });

  },
  _fromCart:function()
  {
    var account = this.data.account;
    var Data = cart._getDataFromLocal(true);
    this.setData({
    productsArr:Data,
    account:account,
    orderStatus:0
    });
    this._getAddressinfo();
  },

  _getAddressinfo()
  {
    address.getAddressInfo((res)=>{
      this._bindAddressInfo(res)
    });
  },
  editAddress:function()
  {
    var that=this;
    wx.chooseAddress({
      success:function(res){
        var addressinfo={
          name: res.userName,
          mobile: res.telNumber,
          totalDetail: address.setAddressInfo(res),
        }
        that._bindAddressInfo(addressinfo);
        address.submitAddress(res,(flag)=>{
             if(!flag)
             {
                that.showTips('操作提示','地址信息更新失败！');
             }
        })
         
      }
    })
  },
  showTips:function(title,content,flag)
  {
   wx.showModal({
     title: title,
     content: content,
     showCancel:false,
     success:function(res)
     {
       if(flag)
       {
         wx.switchTab({
           url: '/pages/my/my',
         });
       }
     }
   })
  },
  _bindAddressInfo(addressinfo)
  {
    this.setData({
      addressInfo: addressinfo
    })
  },
  pay:function(event)
  {
   if(!this.data.addressInfo)
   {
     this.showTips('操作提示','请填写您的收货地址');
     return;
   }
   if (this.data.orderStatus==0)
   {
     this._firstTimepay();
   }
   else
   {
     var formId = event.detail.formId;
     this._oneMoreTimePay(formId);
   }

  },
  _oneMoreTimePay: function (formId)
  {
    var id=this.data.id;
    // 有微信支付，请启用下面这一行代码，删除其他代码即可
    // this._execPaymore(id);
    order.successPay(id,formId,(res) => {
      var flag = res.result;
      if (flag) {
        order.exeSetStorageSync(true);
        wx.navigateTo({
          url: '../pay-result/pay-result?id=' + id + '&flag=' + flag + '&from=my'
        });
      }
      else {
        wx.navigateTo({
          url: '../pay-result/pay-result?id=' + id + '&flag=' + flag + '&from=my'
        });
      }
    })
  },
  _firstTimepay:function()
  {
   var orderinfo=[];
   var productInfo = this.data.productsArr;
   for (var i = 0; i < productInfo.length;i++)
   {
     orderinfo.push({
       'product_id': productInfo[i].id,
       'count': productInfo[i].count
     })
   }
    var that=this;

    // 订单分为两步，第一步是生成订单，第二步是支付
    order.doOrder(orderinfo,(res)=>{
        if(res.pass)
        {
          var id = res.order_id;
          that.data.id=id;
          that.data.fromCartFlag=false;
          // 发送支付请求
          that._execPay(id);
          // 如果有微信支付账号，请删除以下两行代码

          // 伪成功代码
          wx.navigateTo({
            url: '../pay-result/pay-result?id=' + id
            + '&flag=false' + '&from=order'
          });
          that.deleteProducts();
        }
        else
        {
          that._orderFail(res);
        }

    });
  },
  /*
     *下单失败
     * params:
     * data - {obj} 订单结果信息
     * */
  _orderFail: function (data) {
    console.log(data);
    var nameArr = [],
      name = '',
      str = '',
      pArr = data.pstatusArray;
    for (let i = 0; i < pArr.length; i++) {
      if (!pArr[i].haveStock) {
        name = pArr[i].name;
        if (name.length > 15) {
          name = name.substr(0, 12) + '...';
        }
        nameArr.push(name);
        if (nameArr.length >= 2) {
          break;
        }
      }
    }
    str += nameArr.join('、');
    if (nameArr.length > 2) {
      str += ' 等';
    }
    str += ' 缺货';
    wx.showModal({
      title: '下单失败',
      content: str,
      showCancel: false,
      success: function (res) {
      }
    });
  },


  /*
*开始支付
* params:
* id - {int}订单id
*/
  _execPay: function (id) {

    var that = this;

    order.execPay(id, (statusCode) => {

      if (statusCode != 0) {

        //将已经下单的商品从购物车删除
        that.deleteProducts();
        var flag = statusCode == 2;
        wx.navigateTo({
          url: '../pay-result/pay-result?id=' + id
          + '&flag=' + flag + '&from=order'
        });
      }
    });
  },

  //将已经下单的商品从购物车删除
  deleteProducts: function () {
    var ids = [], arr = this.data.productsArr;
    for (let i = 0; i < arr.length; i++) {
      ids.push(arr[i].id);
    }
    cart.deleteProduct(ids);
  },
// 再次支付的时候调用此函数
  _execPaymore: function (id) {
    var that = this;
    order.execPay(id, (statusCode) => {
      if (statusCode > 0) {
        var flag = statusCode == 2;
        //跳转到 成功页面
        wx.navigateTo({
          url: '../pay-result/pay-result?id=' + id + '&flag=' + flag + '&from=my'
        });
      }
      else {
        that.showTips('支付失败', '商品已下架或库存不足');
      }
    });
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {

  },

  /**
   * 生命周期函数--监听页面显示
   */
 

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
  
  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function () {
  
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function () {
  
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
  
  }
})