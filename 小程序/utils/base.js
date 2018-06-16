
import {Config} from 'config.js';
import {Token} from 'token.js';
class Base
{
  constructor(){
    this.baseRequestUrl = Config.baseUrl;
  }

 request(param,norefresh)
 {
   var that=this;
   var url = this.baseRequestUrl+param.url
   if(!param.data)
   {
     param.data='';
   }
   if(!param.type)
   {
     param.type='GET';
   }
   wx.request({
     url: url ,
     data: param.data,
     header: {
       'content-type':'application/json',
       'token':wx.getStorageSync('token')
     },
     method: param.type,
     success: function(res) {
       var code=res.statusCode.toString();
       var starChar=code.charAt(0);
       if(starChar==2)
       {
         param.sCallback && param.sCallback(res.data);
       }
       else
       {
         if(code=='401')
         {
           if(!norefresh){
             that._refresh(param);
           }

         }
         if(norefresh)
         {
           param.eCallback && param.eCallback(res.data);
         }

       }
     },
     fail: function(res) {},
   })
 }
  _refresh(param)
{
  var token=new Token();
  token.getTokenFromServer((res)=>{
    this.request(param, true);
  });
  
}




 getDataSet(event,key){
   return event.currentTarget.dataset[key];
 }
}
export{Base}