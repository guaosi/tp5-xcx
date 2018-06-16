import {Base} from '../../utils/base.js';
class Theme extends Base
{
  constructor()
  {
    super();
  }
  getProductByTheme(id,callback)
  {
    var param={
      'url':'theme/'+id,
      'sCallback':function(res){
        callback&&callback(res);
      }
    }
    this.request(param);
  }
}
export{Theme}