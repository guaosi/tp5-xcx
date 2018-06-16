// cart.js
import{Cart} from 'cart-model.js';
var cart=new Cart();
Page({

  /**
   * 页面的初始数据
   */
  data: {
  
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
  
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
   wx.setNavigationBarTitle({
     title: '购物车',
   })
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {
    var cartData = cart._getDataFromLocal();
    // var countInfo=cart.getCartCount(true);
    var cal = this._calcTotalAccountAndCounts(cartData);
    this.setData({
      cartData: cartData,
      account: cal.account,
      selectedTypeCounts: cal.selectedTypeCounts,
      selectedCounts: cal.selectedCounts
    })
  },
  _calcTotalAccountAndCounts: function (data) {
    // 商品选中的金额  这里要注意小数精度问题
    // 商品选中的总数
    // 商品选中的类型数
    var selectedAccount = 0, selectedCount = 0, selectedType = 0;
    var multiple=100;;
    for (var i = 0; i < data.length; i++) {
      if (data[i].selectStatus) {
        selectedAccount += Number(data[i].price) * multiple * data[i].count*multiple;
             selectedCount += data[i].count;
             selectedType++;
      }
    }
    return {
      selectedCounts: selectedCount,
      selectedTypeCounts: selectedType,
      account: selectedAccount/(multiple*multiple)
    }
  },
  toggleSelect:function(event)
  {
    var id=cart.getDataSet(event,'id');
    var status=cart.getDataSet(event,'status');
    var index = this._getProductIndexById(id);
    var cartDataFromLocal = cart._getDataFromLocal();
    // cartDataFromLocal[index].selectStatus = !status;
    // wx.setStorageSync('cart', cartDataFromLocal);
    this.data.cartData[index].selectStatus = !status;
    this._resetCartData();

  },
  toggleSelectAll:function(event)
  {
    var status = cart.getDataSet(event, 'status');
    this._allProductSelected(status);
    this._resetCartData();

  },
  _resetCartData:function()
  {
    var cal = this._calcTotalAccountAndCounts(this.data.cartData);
    this.setData({
      cartData: this.data.cartData,
      account: cal.account,
      selectedTypeCounts: cal.selectedTypeCounts,
      selectedCounts: cal.selectedCounts
    })
  },
  _allProductSelected: function (status)
  {
    var flag=!status;
    console.log(flag);
    var cartDataFromLocal = this.data.cartData;
    for (var i = 0; i < cartDataFromLocal.length; i++)
    {
      cartDataFromLocal[i].selectStatus = flag;
    }
    this.data.cartData = cartDataFromLocal;
    // wx.setStorageSync('cart', cartDataFromLocal);
  },
  changeCount:function(event)
  {
    var id = cart.getDataSet(event, 'id');
    var typeName = cart.getDataSet(event, 'type');
    var index = this._getProductIndexById(id)
    var count=1;
    if(typeName=='add')
    {
      cart.addCount(id);
    }
    else if (typeName == 'sub')
    {
      cart.subCount(id);
      count=-1;
    }
    if (this.data.cartData[index].count > 1 || typeName=='add')
    {
      this.data.cartData[index].count += count;
    }
    this._resetCartData();
  },
  deleteProduct: function (event)
  {
    var id = cart.getDataSet(event, 'id');
    var index = this._getProductIndexById(id);
    this.data.cartData.splice(index,1);
    cart.deleteProduct(id);
    this._resetCartData();
  },
  _getProductIndexById(id)
  {
    var cartData=this.data.cartData;
    for(var i=0;i<cartData.length;i++)
    {
      if (cartData[i].id==id)
        {
          var index=i;
          break;
        }
    }
    return index;
  },
  submitCart:function()
  {
    var account = this.data.account;
    wx.navigateTo({
      url: '../order/order?account='+account+'&form=cart',
    })
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function () {
    cart.exesetStorageSync(this.data.cartData);
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