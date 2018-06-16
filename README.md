基于ThinkPHP5.0.10制作零食商城,三端分离，前后端完全分离,支持PHP7.
===============
> 🚀 三端分离: ThinkPHP编写API接口，CMS后台管理，小程序前端
## 特性

- 三端分离，前后端完全分离

- RESTful API

- 接入微信支付(没有商家账号,无法测试能否支付)

- 重写异常类

- 重写验证层

- 小程序上完整购物逻辑

- 后台发货，微信提示

- 用户过期自动认证

> ThinkPHP5.0.10的运行环境要求PHP5.4以上.支持PHP7.

## 体验地址

> 微信-小程序-搜索-v度零食贩

## 要求

| 依赖 | 说明 |
| -------- | -------- |
| PHP| >=`5.4` |
| Thinkphp| `5.0.10` |
| MySQL| >=`5.5` |
| nginx |用于网址代理解析|
| 集成环境[可选的] | LNMP`>=1.5` |

## 注意

1. 做了一次网站迁移上传的,应该没有什么问题,有关问题下面会说明.

## 安装

通过[Github](https://github.com/guaosi/tp5-xcx),fork到自己的项目下
```
git clone git@github.com:<你的用户名>/tp5-xcx.git
```

## 配置

### API配置

#### 数据库配置

>自行导入sql.sql,修改 application/database.php

修改数据库相关配置

#### 微信配置

> 修改 application/extra/wx.php

`appid` `secret` 修改为你微信公众平台商家的或者个人的(个人的无法使用微信支付功能，但是流程都能走通，影响不大)

#### 通用配置

> 修改 application/extra/setting.php

`IMG_PREFIX` 修改为 `https://你的地址/images`

#### 私密配置

> 修改 application/extra/secure.php

`salt_token` 修改为 你想加密的唯一秘钥,如 `guaosi`
`pay_back_url` 修改为 `https://你的地址/api/v1/pay/notify`

#### 注意

> application/api/controller/v1/Pay.php 的 reviceNotify方法 和 successPay方法

如果接入的是商家微信账号并且上线使用的话，请根据注释，**自行注释调试代码**。

### 小程序配置

> 修改 utils/config.js

`Config.baseUrl` 修改为 `https://你的网址/api/v1/`

> 登陆 https://mp.weixin.qq.com

将 `设置`->`开发设置`->`服务器域名
`->`修改` 里的 `request合法域名` 修改为 `你的网址`

> 自行配置SSL,小程序线上只允许请求https接口

> 腾讯修改了wx.getUserInfo接口，需要自行进行修改适配

### CMS配置

> 修改 js/common.js

`g_restUrl` 修改为 `http://你的地址/api/v1/`



## Nginx配置
这个需求应该不大，就不写了.**需要配置SSL**

## 测试账号与密码
以上都完成后
后台登录账号密码

> admin  a123654

后台地址:

> http://网址/pages/login.html

## 使用

因为没有商户账号，所以我在小程序设置了默认点击付款后，第一次去付款是失败，再一次付款就是成功，订单状态会更改为已支付。如果有商户账号，可以关闭这个功能正常调用微信支付。

当订单状态为已支付，此时可以登陆CMS后台，对订单进行发货。用户微信上会收到发货提醒的服务通知。

