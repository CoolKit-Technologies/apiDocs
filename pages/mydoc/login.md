---
title: 登录
last_updated: 2019-11-03
weight: 10
sidebar: mydoc_sidebar
permalink: login.html
folder: mydoc
---

基本的账号登录，后续可以实现基本的设备管理与控制。

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/user/login  

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Sign+空格+签名值|是|Sign Qbd+knKCUb8LAP6yMv1SSqYwmm1vDIxG3rHeq1Ul+|
|Content-Type|application/json|是|application/json|

Body：

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|phoneNumber|string|-|登录手机（优先）|
|email|string|-|登录邮箱|
|password|string|是|登录密码|
|appid|string|是|APPID|
|nonce|string|是|8位字母数字随机数|
|ts|int|是|时间戳精确到秒|
|version|int|是|接口版本：8|

示例：

```Json
{
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "phoneNumber":"+8613123456789",
    "password":"12345678",
    "ts": 1558004249,
    "version":8,
    "nonce":"q3wz95p6"
}
```

备注：

接口地址中的区域可根据实际用户所属地区更改，目前已有区域：cn、as、eu、us

中国内陆区域建议使用：https://{区域}-api.coolkit.cc:8080 -> .cn域名后缀
其他地区建议使用：https://{区域}-api.coolkit.cc:8080 -> .cc域名后缀

签名值计算规则请查看 [开发通用说明](instruction.html)

**响应参数(基础):**

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|error|string|否|失败时返回，且只会返回error|
|at|string|否|Access Token，at有效期为一个月（注意：每登录一次，at会重新生成，不支持同帐号多处使用）|
|rt|string|否|Refresh Token，rt有效期为两个月，用于刷新at|
|user|object|否|用户信息|
|region|string|否|注册区域|


状态码（以实际为准）：

    400：参数不完整或错误  
    301：账号注册在其他区域，需要查询「区域接口」重定向  
    401：账号密码错误  
    402：账号未激活  
    404：账号不存在  
    406：认证失败（APPID错误或签名错误）  
    500：服务器内部错误  

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

备注：

    at为其他请求必须携带的参数，代替Authorization的值（Authorization：Bearer+空格+at）
    rt存在的目的是刷新at
    region为账号注册所在区域
