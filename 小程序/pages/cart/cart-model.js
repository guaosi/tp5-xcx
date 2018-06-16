import{Base} from '../../utils/base.js';
class Cart extends Base
{
  constructor()
  {
    super();
    this._Srorage='cart';
  }
  // 添加购物车  
  // 1.获得购物车缓存
  // 2.检查缓存 有的话 累加,没有的话 新增
  add(item,count)
  {
    var data = this._getDataFromLocal();
    var isHasInfo = this._isHasThatOne(item.id, data);
    // 证明是新增
    if (isHasInfo.index==-1)
    {
     item.count=count;
     item.selectStatus=true;
     data.push(item);
    }
    // 证明是增加
    else
    {
      data[isHasInfo.index].count += count;
    }
    wx.setStorageSync(this._Srorage, data);
  }
  _getDataFromLocal(flag)
  {
    var Data = wx.getStorageSync(this._Srorage);
    if(!Data)
    {
      return [];
    }
    else
    {
     if(flag)
     {
      var newarr=[]; 
      for(var i=0;i<Data.length;i++)
      {
        if (Data[i].selectStatus)
        {
           newarr.push(Data[i]);
        }
      }
      Data=newarr;
     }
      return Data;
    }
  }
  _isHasThatOne(id, data)
  {
    //只进行判断，有则返回下标，没有则返回其他
    
    var result={index:-1};
    for(var i=0;i<data.length;i++)
    {
      if(id==data[i].id)
      {
        result={index:i};
        break;
      }
    } 
    return result;
  }
  getCartCount(flag)
  {
    var data=this._getDataFromLocal();
    var count=0;
    for(var i=0;i<data.length;i++)
    {
      if(flag)
      {
        if (data[i].selectStatus)
        {
          count += data[i].count;
        }
      }
      else
      {
        count += data[i].count;
      }
      
    }
    return count
  }
  _changeCount(id,count)
  {
    var cartData=this._getDataFromLocal();
    var isHasInfo = this._isHasThatOne(id, cartData);
    if (isHasInfo.index!=-1)
    {
      if (cartData[isHasInfo.index].count>1||count==1)
      {
        cartData[isHasInfo.index].count += count;
      }
      wx.setStorageSync(this._Srorage, cartData);
    }
  }
  addCount(id)
  {
    this._changeCount(id,1);
  } 
  subCount(id) {
    this._changeCount(id, -1);
  } 

  deleteProduct(ids)
  {
    if(!(ids instanceof Array))
    {
      ids=[ids];
    }
    var cartData=this._getDataFromLocal();
    for(var i=0;i<ids.length;i++)
    {
      var isHasInfo = this._isHasThatOne(ids[i],cartData);
      if(isHasInfo.index!=-1)
      {
        cartData.splice(isHasInfo.index,1);
        wx.setStorageSync(this._Srorage, cartData);
      }
    }
  }
  exesetStorageSync(cartData)
  {
    wx.setStorageSync(this._Srorage, cartData);
  }

}
export{Cart}