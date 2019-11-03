---
title: 找回密码
permalink: findpassword.html
last_updated: 2019-11-03
sidebar: mydoc_sidebar
folder: mydoc
---

忘记密码的情况下，通过注册的帐号接收验证码，重新设置密码。

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/user/password/reset  

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Sign+空格+签名值|是|Sign 1zMaXhUQsSORdLo3mfA5igVSbrlkdDIStLtInz5Bjeg=|
|Content-Type|application/json|是|application/json|

Body：

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|verificationCode|string|是|验证码|
|email|string|-|邮箱账号|
|phoneNumber|string|-|手机账号|
|password|string|是|新密码|
|appid|string|是|APPID|
|nonce|string|是|8位字母数字随机数|
|ts|int|是|时间戳精确到秒|
|version|int|是|接口版本：8|

示例：

```Json
{
    "verificationCode": "1234",
    "phoneNumber":"+8613123456789",
    "password":"12345678",
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "ts": 1558004249,
    "version":8,
    "nonce":"q3wz95p6"
}
```


**响应参数：**

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|error|string|否|失败时返回，且只会返回error|
|at|string|否|Access Token|
|rt|string|否|Refresh Token|
|user|object|否|用户信息|
|region|string|否|注册区域|


状态码：

    0：操作成功
    400:   参数错误
    401：认证失败
    403：没有权限
    405：原始密码不正确
    498：验证码不正确
    500：服务器错误

返回示例(数据已脱敏)：

```Json
{
    "at":"a527297584f1ca030579a90d2e800481e22e850a",
    "rt":"24670a9e493ba18cf5d9750f14505705824fcfd9",
    "user":{
        "_id":"5c984cd3dc8295fa0ef3e592",
        "phoneNumber":"+8613123456789",
        "appId":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
        "lang":"cn",
        "online":false,
        "onlineTime":"2019-05-16T10:48:42.091Z",
        "ip":"113.87.160.95",
        "location":"广东",
        "offlineTime":"2019-05-16T10:51:22.090Z",
        "appInfos":[
            {
                "appVersion":"3.13.0",
                "os":"android"
            }
        ],
        "nickname":"eWelink",
        "createdAt":"2019-03-25T03:36:51.335Z",
        "apikey":"95da0fea-5692-469a-c562-4dd5ee9a51f1"
    },
    "region":"cn"
}
```
