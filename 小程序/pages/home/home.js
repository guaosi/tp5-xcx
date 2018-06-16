// home.js
import { Home } from 'home-model.js';
var home = new Home;
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
    this._loadData();

  },
  _loadData() {
    var id = 1;
    home.getBannerData(id, (res) => {
      this.setData({
        'banner': res
      });
    });
    var ids = '1,2,3';
    home.getThemeData(ids, (res) => {
      this.setData({
        'theme': res
      });
    home.getRecentData((res)=>{
       this.setData({
         'Products':res
       })
    });  
    })

    //  home.getBannerData(id,this._callback);
  },
  onProductItemsTap:function(event){
    var id =home.getDataSet(event,'id');
    wx.navigateTo({
      url: '../product/product?id='+id,
    })
  } ,
  onThemeItemsTap:function(event){
    var id=home.getDataSet(event,'id');
    var description = home.getDataSet(event,'description');
    wx.navigateTo({
      url: '../theme/theme?id=' + id + '&description=' + description,
    })
  },
  _callback(res) {
    console.log(res)
  },
  /**
   * 生命周期函数--监听页面初次渲染完成
   */

  //分享效果
  onShareAppMessage: function () {
    return {
      title: 'V度零食贩',
      path: 'pages/home/home'
    }
  }
})