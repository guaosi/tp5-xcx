import{Config} from 'config.js';

class Token
{
 constructor()
 {
   this._verifyUrl = Config.baseUrl +'token/verify';
   this._userUrl = Config.baseUrl +'token/user';
 }
  verify(){
   var token=wx.getStorageSync('token');
   if(!token)
   {
     this.getTokenFromServer();
   }
   else
   {
     this._verifyFromServer(token);
   }
  }
  getTokenFromServer(callback)
  {
    var that=this;
    wx.login({
      success:function(res){
        wx.request({
          url: that._userUrl,
          method: 'POST',
          data: {
            code: res.code
          },
          success: function (res) {
            wx.setStorageSync('token', res.data.token);
            callback && callback(res.data.token);
          }
        })
      }
    })
  }
  _verifyFromServer(token)
  {
    var that=this;
     wx.request({
       url: this._verifyUrl,
       method:'POST',
       data:{
         token: token
       },
       success:function(res)
       {
         if (!res.data.isValis)
         {
           that.getTokenFromServer();
         }
       }
     })
  }
}
export{Token}