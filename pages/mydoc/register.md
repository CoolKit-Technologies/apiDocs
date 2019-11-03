---
title: 注册
last_updated: 2019-11-03
sidebar: mydoc_sidebar
permalink: register.html
folder: mydoc
---

基本的账号注册，后续可以实现基本的设备管理与控制。

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/user/register

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Sign+空格+签名值|是|Sign XKbl6wRU0DuIgF6qPV8JHBto9HKB5+namy6hoFWO5cg=|
|Content-Type|application/json|是|application/json|

Body：

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|verificationCode|string|是|验证码|
|email|string|-|注册邮件|
|phoneNumber|string|-|注册手机|
|password|string|是|注册密码|
|appid|string|是|APPID|
|nonce|string|是|8位字母数字随机数|
|ts|int|是|时间戳精确到秒|
|version|int|是|接口版本：8|

示例：

```Json
{
    "verificationCode":"1234",
    "phoneNumber":"+8613123456789",
    "email":"",
    "password":"12345678",
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "ts": 1558004249,
    "version":8,
    "nonce":"asbsedwq"
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

User说明：

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|apikey|string|是|用户apikey|
|phoneNumberat|string|是|用户账号|
|email|string|是|用户邮箱|
|createdAt|date|是|注册时间|

状态码：

    409：用户已经存在
    498：验证码错误
    500：服务器错误

返回示例：

```Json
{
    "at":"074e8af6f5f10183647a6a4f5b51fdc6788f617a",
    "rt":"24670a9e493ba18cf5d9750f14505705824fcfd9",
    "user":{
        "_id":"5c984cd3dc8295fa0ef3e592",
        "phoneNumber":"+8613123456789",
        "appId":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
        "lang":"cn",
        "online":false,
        "onlineTime":"2019-05-16T10:48:42.091Z",
        "ip":"110.110.110.110",
        "location":"广东",
        "offlineTime":"2019-05-16T10:51:22.090Z",
        "appInfos":[
            {
                "appVersion":"3.12.0",
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