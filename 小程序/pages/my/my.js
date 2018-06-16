// my.js

import { Address } from '../../utils/address.js';
import { Order } from '../order/order-model.js';
import { My } from '../my/my-model.js';

var address = new Address();
var order = new Order();
var my = new My();
Page({

  /**
   * 页面的初始数据
   */
  data: {
   pageIndex:1,
   orderArr:[],
   isOrderAll:false
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this._onLoad();
    this._getAddressInfo();
    this._getAllOrders();
  },
  _onLoad:function()
  {
    my.getUserInfo((res)=>{
      this.setData({
        userInfo:res
      });
    });

  },
  /**
 * 生命周期函数--监听页面显示
 */
  onShow: function () {
    if (order.hasNewOrder())
    {
      order.exeSetStorageSync(false);
      this._refresh();
    }

  },
  _refresh:function()
  {
   
    this.data.pageIndex=1,
    this.data.orderArr=[],
    this.data.isOrderAll=false
    this._getAllOrders();
    

  },
  _getAllOrders:function(){

    order.getAllOrder(this.data.pageIndex,(res)=>{
      var data = res.data;
      if(data.length>0)
      {
        for(var i=0;i<data.length;i++)
        {
          this.data.orderArr.push(data[i]);
        }
        this.setData({
          'orderArr': this.data.orderArr
        })
      }
       else
       {
        this.data.isOrderAll=true;
       }
    })
  },
  _getAddressInfo:function(){
    address.getAddressInfo((res)=>{
      this._bindAddressInfo(res)
    })
  },
  _bindAddressInfo:function(res)
  {
    this.setData({
      'addressInfo':res
    })
  },
  showOrderDetailInfo:function(event)
  {
    var id = my.getDataSet(event,'id');
    wx.navigateTo({
      url: '../order/order?id='+id+'&from=my',
    })
  },
  rePay:function(event)
  {
    var id = order.getDataSet(event, 'id');
    var index = order.getDataSet(event, 'index');
    // 有微信支付，请启用下面这一行代码，删除其他代码即可
    // this._execPay(id, index);
    var formId = event.detail.formId;
    order.successPay(id,formId,(res)=>{
      console.log(res);
      var flag = res.result;
      if (flag)
      {
      wx.navigateTo({
        url: '../pay-result/pay-result?id=' + id + '&flag=' + flag + '&from=my'
      });
      this.data.orderArr[index].status = 2;
      this.setData({
        orderArr: this.data.orderArr
      });
      }
      else
      {
        wx.navigateTo({
          url: '../pay-result/pay-result?id=' + id + '&flag=' + flag + '&from=my'
        });
      }
    })
    
    
  },
  _execPay: function (id, index) {
    var that = this;

    order.execPay(id, (statusCode) => {

      if (statusCode > 0) {
        var flag = statusCode == 2;

        //更新订单显示状态
        if (flag) {
          that.data.orderArr[index].status = 2;
          that.setData({
            orderArr: that.data.orderArr
          });
        }

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

  /*
 * 提示窗口
 * params:
 * title - {string}标题
 * content - {string}内容
 * flag - {bool}是否跳转到 "我的页面"
 */
  showTips: function (title, content) {
    wx.showModal({
      title: title,
      content: content,
      showCancel: false,
      success: function (res) {

      }
    });
  },
  editAddress: function () {
    var that = this;
    wx.chooseAddress({
      success: function (res) {
        var addressinfo = {
          name: res.userName,
          mobile: res.telNumber,
          totalDetail: address.setAddressInfo(res),
        }
        that._bindAddressInfo(addressinfo);
        address.submitAddress(res, (flag) => {
          if (!flag) {
            that.showTips('操作提示', '地址信息更新失败！');
          }
        })

      }
    })
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
  },



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
    this.onLoad(() => {
      wx.stopPullDownRefresh()
    });
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
    if (!this.data.isOrderAll)
  {
      this.data.pageIndex++;
      this._getAllOrders();
  }
  else
  {
      wx.showToast({
        title: '没有其他订单啦~',
      })
  }

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function () {
    return {
      title: 'V度零食贩',
      path: 'pages/my/my'
    }
  },
})