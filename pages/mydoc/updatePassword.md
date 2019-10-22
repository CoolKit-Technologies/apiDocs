---
title: 修改密码
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: updatePassword.html
folder: mydoc
---

出于帐号安全的考虑，通过原来的密码设置帐号新密码，不需要通过验证码方式校验。

---

接口地址： https://cn-api.coolkit.cn:8080/api/user/password

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Sign+空格+签名值|是|Bearer 074e8af6f5f10183647a6a4f5b51fdc6788f617a|
|Content-Type|application/json|是|application/json|

Body：

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|oldPassword|String|是|旧的密码|
|newPassword|String|是|新的密码|
|appid|String|是|APPID|
|nonce|String|是|8位字母数字随机数|
|ts|Int|是|时间戳精确到秒|
|version|Int|是|预设版本|

示例：

```Json
{
    "oldPassword":"12345678",
    "newPassword":"123456789",
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "ts":15452192511,
    "version":8,
    "nonce":"asbsedwq"
}
```

**响应参数:**

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|error|String|否|错误信息，只要返回有error表示失败|
|message|String|否|返回message表示修改密码成功|

状态码：暂无

示例：

```Json
{
    "message": "Change password is success!"
}
```