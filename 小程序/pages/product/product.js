// product.js
import{Product}from 'product-model.js';
import{Cart} from '../cart/cart-model.js';
var product=new Product;
var cart=new Cart;

Page({

  /**
   * 页面的初始数据
   */
  data: {
      id:null,
      countArray:[1,2,3,4,5,6,7,8,9,10],
      productCount:1,
      tabArray:['商品详情','产品参数','售后保障'],
      currentIndex:0,
      productName:''
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    this.data.id=options.id;
    this._onload();
  },
  _onload(){
    var id=this.data.id;
    product.getProductDetail(id,(res)=>{
      var name=res.name.split(' ');
      wx.setNavigationBarTitle({
        title: name[0]
      })
         this.setData({
           'product':res,
           'cartCount': cart.getCartCount(false)
         })

    });
  },
  onCartTap: function () {
    wx.switchTab({
      url: '/pages/cart/cart',
    })
  },
  bindPickerChange:function(event){
    var index=event.detail.value;
    var selectedCount=this.data.countArray[index];
    this.setData({
       'productCount':selectedCount
    });
  },
  onTabItemsTap:function(event){
     var index=product.getDataSet(event,'index');
     this.setData({
       'currentIndex':index
     })
  },
  onAddingCartTap: function (events)
  {

    if (this.data.isFly) {
      return;
    }
    this._flyToCartEffect(events);
    this._addToCart();
  },
  _addToCart:function()
  {
    var obj={};
    var key=['id','name','main_img_url','price'];
    for (var keys in this.data.product)
    {
      if(key.indexOf(keys)>=0)
      {
        obj[keys] = this.data.product[keys];
      }
    }
    var Count = this.data.productCount;
    cart.add(obj,Count);
  },
  /*加入购物车动效*/
  _flyToCartEffect: function (events) {
    //获得当前点击的位置，距离可视区域左上角
    var touches = events.touches[0];
    var diff = {
      x: '25px',
      y: 25 - touches.clientY + 'px'
    },
      style = 'display: block;-webkit-transform:translate(' + diff.x + ',' + diff.y + ') rotate(350deg) scale(0)';  //移动距离
    this.setData({
      isFly: true,
      translateStyle: style
    });
    var that = this;
    setTimeout(() => {
      that.setData({
        isFly: false,
        translateStyle: '-webkit-transform: none;',  //恢复到最初状态
        isShake: true,
      });
      setTimeout(() => {

        var counts = that.data.cartCount + that.data.productCount;
        that.setData({
          isShake: false,
          cartCount: counts
        });
      }, 200);
    }, 1000);
  },

  //分享效果
  onShareAppMessage: function () {
    return {
      title: 'V度零食贩',
      path: 'pages/product/product?id=' + this.data.id
    }
  },

})