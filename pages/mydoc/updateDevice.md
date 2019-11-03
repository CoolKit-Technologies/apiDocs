---
title:  修改设备名称
last_updated: 2019-11-03
sidebar: mydoc_sidebar
permalink: updateDevice.html
folder: mydoc
---

修改单通道设备的名称

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/user/device/{deviceid} 

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
|deviceid     |是  |string | 设备id |
|apikey     |是  |string | 设备APIKEY |
|name     |是  |string | 设备名称 |
|group |是  |string | 默认传递空字符 |
|appid|是|string|APPID|
|nonce|是|string|8位字母数字随机数|
|ts|是|int|时间戳精确到秒|
|version|是|int|接口版本：8|

举例：

```Json
{
    "deviceid":"100000001",
    "apikey":"xxxx-xxxx-xxx",
    "name":"我的设备0002",
    "group":"",
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "ts":15452192511,
    "version":8,
    "nonce":"asbsedwq"
}
```

**响应参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |否  |string | 返回的异常信息。error：0 操作成功  |
|device |是  |object | 设备信息，成功才返回  |

设备信息：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|name |是  |string | 设备名称  |
|type |是  |string | 类型  |
|deviceid |是  |string | 设备id  |
|apikey |是  |string | 用户apikey  |
|extra |是  |object | 关联表引用信息  |
|onlineTime |是  |string | 设备最后上线时间  |
|ip |是  |string | 设备上线的ip地址  |
|location |是  |string | 设备上线的地方  |
|settings |是  |object | 设备配置信息  |
|groups |是  | [string] | 设备所属的分组ID，设备可以属于多个分组。如果不属于任何分组，则返回空数组[]  |
|params |是  |object | 设备参数  |
|online |是  |Boolean | 设备是否在线  |
|createdAt |是  |Date | 设备添加时间  |
|sharedBy |否  |object | 分享列表,分享方返回  |
|sharedTo |否  |object | 分享列表，被分享方返回  |
|devicekey |是  |string | 设备apikey  |
|deviceUrl |否  |string | 设备详情界面url  |
|brandName |是  |string | 品牌  |
|productModel |是  |string | 产品型号  |
|showBrand |是  |Boolean | 是否展示品牌和产品型号  |
|uiid |是  | Int | 设备ui的id  |

返回示例：

```Json
{
   "name": "我的设备00001",
   "deviceid"" "100000001"
   ...
}
```