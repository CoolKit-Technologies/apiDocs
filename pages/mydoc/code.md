---
title: 验证码
last_updated: 2019-11-03
sidebar: mydoc_sidebar
permalink: code.html
folder: mydoc
---

验证码作为注册，重置密码，找回密码的用户安全认证校验，向指定电话号码或者邮箱发送。

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/sms

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Sign+空格+签名值|是|Sign 7z8pd9cGSxizuAm5kl4TmRcRzMuVQK/6Ye3DREUnM5E=|
|Content-Type|application/json|是|application/json|

Body：

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|sendType|string|是|"0"注册；"1"重置密码；2；"3"申请注销账号；"4"微信验证码注册登录|
|email|string|-|邮箱账号|
|to|string|-|手机账号，带国家或地区码。格式: +8615815725225 (+86中国)|
|appid|string|是|APPID|
|nonce|string|是|8位字母数字随机数|
|ts|int|是|时间戳精确到秒|
|version|int|是|接口版本：8|

示例：

```Json
{
    "sendType":"0",
    "to":"+8613123456789",
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "ts": 1558004249,
    "version":8,
    "nonce":"asbsedwq"
}
```

备注：

接口地址中的区域可根据实际用户所属地区更改，目前已有区域：cn、as、eu、us

中国内陆区域建议使用：https://{区域}-api.coolkit.cc:8080 -> .cn域名后缀
其他地区建议使用：https://{区域}-api.coolkit.cc:8080 -> .cc域名后缀

签名值计算规则请查看「[开发通用说明](instruction.html)」

注意email和to不会同时存在，邮箱接收验证码只传email，电话号码接收验证码只传to

注册：只要手机号或者email格式合法并且是未注册的用户就可以发送，已注册的用户再请求，不会发送验证码。

**响应参数：**

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|error|string|是|状态码|
|region|string|否|error：301的情况下用户所属区域代码，如：中国(cn)|
|msg|string|否|错误原因|

状态码：

    0：操作成功  
    301：用户在其他大区，需要客户端结合region重定向，重新连接  
    400：参数错误  
    401：账号不存在  
    409：用户已经注册  
    500：服务器错误  
    504：发送失败  
    160038：发送频率高，超过限制  


返回示例：

```Json
{
    "error": 0
}
```