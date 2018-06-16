import {Base} from 'base.js';
import {Config} from 'config.js';
class Address extends Base
{
  constructor()
  {
    super();
  }
  setAddressInfo(res)
  {
    var province = res.province || res.provinceName
;
    var county = res.country || res.countyName
      ;
    var city = res.city || res.cityName
      ;
    var detail = res.detailInfo||res.detail;
    var totaldetail = county + city + detail;
    if (!this._isCenterCity(province))
    {
      totaldetail = province + totaldetail;
    }
    return totaldetail;

  }
  _isCenterCity(province)
  {
   var centerCity=['北京市','上海市','重庆市','天津市'];
   if(centerCity.indexOf(province)>=0)
   {
     return true;
   }
   return false;
  }
  
  _setUpaddress(res)
  {
     var formData={
       name:res.userName,
       province:res.provinceName,
       city:res.cityName,
       country: res.countyName,
       mobile: res.telNumber,
       detail:res.detailInfo
     }
     return formData;
  }
  submitAddress(data,callback)
  {
    var newData = this._setUpaddress(data)
    var param={
     'url':'address',
      type:'POST',
      data: newData,
      sCallback:function(res)
      {
         callback&&callback(true,res);
      },
      eCallback(res)
      {
        callback && callback(false, res); 
      }
    };
    this.request(param);
  }
  getAddressInfo(callback)
  {
    var that=this;
    var param={
      'url':'address',
      sCallback:function(res)
      {
         if(res)
         {
           res.totalDetail = that.setAddressInfo(res);
         }
         callback&&callback(res)
      }
    }
    this.request(param);
  }
}
export{Address}