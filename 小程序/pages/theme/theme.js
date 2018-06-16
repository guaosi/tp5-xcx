import { Theme } from 'theme-model.js';
var theme = new Theme();
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
    this.data.description = options.description;
    this.data.id = options.id;
    this._onload()
  },
  _onload: function () {


    theme.getProductByTheme(this.data.id, (res) => {
      this.setData({
        'Products': res
      });
    });
  },
  onProductItemsTap: function (event) {
    var id = theme.getDataSet(event, 'id');
    wx.navigateTo({
      url: '../product/product?id=' + id,
    })
  },
  
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
   wx.setNavigationBarTitle({
     title: this.data.description,
   })
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function () {

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

  //分享效果
  onShareAppMessage: function () {
    return {
      title: 'V度零食贩',
      path: 'pages/theme/theme?id='+this.data.id
    }
  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {

  },

  /**
   * 用户点击右上角分享
   */
})