---
title: 添加GSM设备
last_updated: 2019-11-03
sidebar: mydoc_sidebar
permalink: addGsm.html
folder: mydoc
---

扫描二维码添加GSM设备，如果设备已经被添加会提示设备已经被添加，需要删除设备后才能添加。

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/user/device/addGsm 

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
|id     |是  |string | GsmId编码，公式：MD5(deviceid+apikey)注意顺序 |
|apikey     |是  |string | 设备apikey |
|name |是  |string | 设备名称 |
|appid|是|string|APPID|
|nonce|是|string|8位字母数字随机数|
|ts|是|int|时间戳精确到秒|
|version|是|int|接口版本：8|


举例：

```Json
{
    "id":"1bc29b36f623ba82aaf6724fd3b16718",
    "apikey":"xxxx-xxxx-xxx",
    "name":"我的设备0002",
    "chipid": "zaqozs",
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "ts":15452192511,
    "version":8,
    "nonce":"asbsedwq"

}
```

**响应参数：**

成功返回：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|device |否  |object | 设备信息，成功才返回  |

失败返回：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|code |否  |Int | 错误代码  |
|error |否  |string | 错误描述  |

```
1.Device name, id and apikey must not be empty! (传递的参数不完整) code：400
2.Invalid device id format! (设备id不符合规范)     code：401
3.Add device failed! (添加设备失败)   code：500
4.Device does not exist! (设备不存在)  code：404
5.Device not belong to this brand! (设备不属于该品牌)  code：403
6.Device has already been added!' : 'Device belongs to other user! (设备已经被添加)  code：409
7.find brand failed! (查找品牌失败 ps：设备列表展现字段)  code：502
8.find modelInfo failed! (查找产品型号失败 ps：设备列表展现字段)  code：503
```

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
|online |是  |boolean | 设备是否在线  |
|createdAt |是  |date | 设备添加时间  |
|sharedBy |否  |object | 分享列表,分享方返回  |
|sharedTo |否  |object | 分享列表，被分享方返回  |
|devicekey |是  |string | 设备apikey  |
|deviceUrl |否  |string | 设备详情界面url  |
|brandName |是  |string | 品牌  |
|productModel |是  |string | 产品型号  |
|showBrand |是  |boolean | 是否展示品牌和产品型号  |
|uiid |是  | Int | 设备ui的id  |

返回示例：

```Json
{
    "error": 0
}
```