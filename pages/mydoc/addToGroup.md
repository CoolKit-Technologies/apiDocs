---
title: 添加设备到分组
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: addToGroup.html
folder: mydoc
---

给设备进行分组，支持设备在多个分组内。如果目标分组id为空，则表示把设备从分组中移出。

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/group/addDevice

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Body：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|deviceinfos |是  |[device] | 设备数组 |
|apikey |是  |string | 用户apikey  |
|groupType |是  |int | 固定参数：0  |
|appid|是|string|APPID|
|nonce|是|string|8位字母数字随机数|
|ts|是|int|时间戳精确到秒|
|version|是|int|接口版本：8|


device说明：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|source_id |是  |string | 原分组ID，可以为空 |
|target_id |是  |string | 目标分组ID，可以为空 |
|deviceid |是  |string | 设备ID |
|type |否  |int |固定参数：1|

举例：

```Json
{
    "deviceinfos":{
        "source_id":"10001",
        "target_id":"10002",
        "deviceid":"10000000001",
        "type":1
    },
    "groupType":0,
    "apikey":"xxxx-xxxx-xxx",
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