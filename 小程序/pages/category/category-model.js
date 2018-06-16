import{Base} from '../../utils/base.js';
class Category extends Base
{
  constructor()
  {
    super();
  }
  getCategoryAll(callback)
  {
    var param={
      url:'category/all',
      sCallback:function(res)
      {
        callback&&callback(res);
      }
    };  
    this.request(param);
 }
 getProductByCategory(id,callback)
 {
   var param = {
     url: 'product/by_category?id='+id,
     sCallback: function (res) {
       callback && callback(res);
     }
   };
   this.request(param);
 }
  
}

export{Category}