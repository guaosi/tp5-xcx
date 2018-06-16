import{Base} from '../../utils/base.js';
class Product extends Base
{
  constructor(){
    super();
  }
  getProductDetail(id,callback){
    var param={
      'url':'product/'+id,
      'sCallback':function(res){
          callback&&callback(res);
      }
    };
    this.request(param);
  }
}
export{Product}
