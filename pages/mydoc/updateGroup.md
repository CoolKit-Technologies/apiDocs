---
title: 修改设备分组
last_updated: 2019-11-03
sidebar: mydoc_sidebar
permalink: updateGroup.html
folder: mydoc
---

支持修改分组顺序以及分组名称

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/group

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Body：

|名称|类型|是否必须|示例|
|:----    |:---|:----- |-----   |
|id |string |是| 分组id |
|name |string |否| 分组名称 |
|index |int |否| 用户可以修改分组顺序 |
|apikey |string |是| 用户apikey  |
|groupType |int |是| 固定参数：0  |
|appid|string|是|APPID|
|nonce|string|是|8位字母数字随机数|
|ts|int|是|时间戳精确到秒|
|version|int|是|接口版本：8|


举例：

```Json
{
    "id":"123456789123",
    "index":0,
    "apikey":"xxxx-xxxx-xxx",
    "name":"我的分组-1L",
    "groupType":0,
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "ts":15452192511,
    "version":8,
    "nonce":"asbsedwq"
}
```

**响应参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |int | 状态码  |

状态码：

    0：操作成功
    400：参数错误
    401：认证失败
    500：服务器错误

返回示例：

```Json
{
    "error": 0
}
```