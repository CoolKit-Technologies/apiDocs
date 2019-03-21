---
title: 登录
last_updated: 2019-03-20
weight: 10
sidebar: mydoc_sidebar
permalink: login.html
folder: mydoc
---


- 正式环境URL: ``` https://cn(区域)-api.coolkit.cn:8080/api/user/login``` 

- 测试环境URL: ``` https://testapi.coolkit.cn:8080/api/user/login``` 

- 请求方法： POST

- 请求参数：注意email和phoneNumber不会同时存在，邮箱登录只传email，电话号码登录只传phoneNumber

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|email |否  |String |邮箱。登录时需要判断邮箱是否已经激活。 |
|phoneNumber |否  |String | 手机号 （优先检查）    |
|password     |是  |String | 密码 |

**响应参数:**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |否  |String | 错误码,成功不返回error，失败返回error  |
|user |是  |Object | 用户信息  |
|at |是  |String | Access Token  |
|rt |是  |String | Refresh Token  |
|region |是  |String | 用户所属区域代码，如：中国:cn  |

```
错误码：
200:获取认证token失败
301:用户在其他大区，需要客户端结合region重定向,重新连接
400:缺少参数
401:用户名密码错误
402:邮件未激活
404:用户不存在
500:服务器错误
```

