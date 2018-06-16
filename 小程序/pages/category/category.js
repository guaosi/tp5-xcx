// category.js
import{Category} from 'category-model.js';
var category=new Category;
Page({

  /**
   * 页面的初始数据
   */
  data: {
    currentIndex:0,
    currentCategoryData:{},
    allCategoryData:{}
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
     this._onLoad();
  },
   




  _onLoad:function()
  {
    category.getCategoryAll((res)=>{
      this.data.allCategoryData = res;
         this.setData({
           'categoryAll':res
         });
         this._getProductCategory(res[0].id);
         });
  },

  onCategotyTap: function (event) {
    var id = category.getDataSet(event, 'id');
    this.data.currentIndex = category.getDataSet(event, 'index');
    var index = this.data.currentIndex;
    if (this.data.currentCategoryData[index]) {
      this.setData({
        'currentIndex': index,
      })
      var obj={};
      obj['products' + index] = this.data.currentCategoryData[index];
      this.setData(obj)
    }
    else {
      this._getProductCategory(id);
    }
  },

  _getProductCategory(category_id){
    var index = this.data.currentIndex;
    category.getProductByCategory(category_id, (data) => {
    var newProduct = {
      topImgUrl: this.data.allCategoryData[index].img_url.url,
      title: this.data.allCategoryData[index].name,
      procucts: data
    }
    this.setData({
      'currentIndex':index,
    });
    this.data.currentCategoryData[index] = newProduct;
    var obj = {};
    obj['products' + index] = this.data.currentCategoryData[index];
    this.setData(obj)
    })
  },

  onProductsItemTap:function(event)
  {
    var id = category.getDataSet(event,'id');
    
    wx.navigateTo({
      url: '/pages/product/product?id='+id,
    })
  }
  ,

 
  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function () {
  
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

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function () {
  
  },

  /**
   * 用户点击右上角分享
   */
  onPullDownRefresh: function () {
    this._onLoad(() => {
      wx.stopPullDownRefresh()
    });
  },

  //分享效果
  onShareAppMessage: function () {
    return {
      title: 'V度零食贩',
      path: 'pages/category/category'
    }
  }
})