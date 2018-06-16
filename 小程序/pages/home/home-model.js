
import { Base } from '../../utils/base.js';


class Home extends Base {
  constructor() {
    super();
  }
  getBannerData(id, callback) {
    var param = {
      url: 'banner/' + id,
      sCallback: function (res) {
        callback && callback(res.item);
      }
    };
    this.request(param);
    // wx.request({
    //   url: 'http://z.cn/api/v1/banner/'+id,
    //   method:'GET',
    //   success:function(res){
    //      callback(res);
    //   }
    // })
  }
  getThemeData(ids, callback) {
    var param = {
      url: 'theme?ids=' + ids,
      sCallback: function (res) {

        callback && callback(res);
      }
    };
    this.request(param);
  }
  getRecentData(callback){
    var param={
      url:'product/recent',
      sCallback:function(res){
          callback&&callback(res);
      }
    }
    this.request(param);
  }


}
export { Home }