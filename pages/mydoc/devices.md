---
title: 设备列表
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: devices.html
folder: mydoc
---

返回用户帐号下，添加的所有设备，包括分享设备。

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/user/device  

请求方法： get

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Parmas：

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|lang|string|是|cn响应返回中文信息；en 响应返回英文信息|
|appid|string|是|APPID|
|nonce|string|是|8位字母数字随机数|
|ts|int|是|时间戳精确到秒|
|version|int|是|接口版本：8|

举例：

```Json
https://{区域}-api.coolkit.cc:8080/api/user/device?lang=cn&appid=McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr&ts=1558004249&version=8&nonce=asbsedwq
```

**响应参数：**

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|error|string|否|失败时返回，且只会返回error|
|devicelist|object|否|设备信息列表|

设备信息列表：

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|name|string|是|设备名称|
|type|string|是|设备类型|
|deviceid|string|是|设备id|
|apikey|string|是|用户apikey|
|extra|object|是|关联表引用信息|
|onlineTime|string|是|设备最后上线时间|
|ip|string|是|设备上线的ip地址|
|location|string|是|设备上线的地方|
|settings|object|是|设备配置信息|
|groups|object|是|设备所属的分组ID|
|params|object|是|设备参数|
|online|Boolean|是|设备是否在线|
|createdAt|string|是|设备添加时间|
|sharedBy|object|否|分享列表|
|devicekey|string|是|设备apikey|
|deviceUrl|string|是|设备详情界面url|
|brandName|string|是|品牌名称|
|productModel|string|是|产品型号|
|showBrand|Boolean|是|是否展示品牌和产品型号|
|uiid|int|是|设备ui的id|

返回示例：

```Json
[
    {
        "_id": "***************",
        "name": "我的设备213ac8",
        "type": "10",
        "deviceid": "1000213ac8",
        "apikey": "3541f7af-*ec5-4502-9bf3-eb4b09e9e12*",
        "extra": {
            "_id": "***************",
            "extra": {
                "model": "PSA-B11-GL",
                "ui": "单通道开关",
                "description": "WWJG001111",
                "manufacturer": "深圳创易智能系统有限公司",
                "mac": "**:**:**:**:**:**",
                "apmac": "**:**:**:**:**:**",
                "modelInfo": "***************",
                "brandId": "***************",
                "uiid": 6,
                "staMac": "**:**:**:**:**:**",
                "chipid": "********"
            }
        },
        "__v": 0,
        "onlineTime": "2019-10-15T07:22:14.361Z",
        "ip": "110.110.110.110",
        "location": "广东",
        "settings": {
            "opsNotify": 0,
            "opsHistory": 1,
            "alarmNotify": 1,
            "wxAlarmNotify": 0,
            "wxOpsNotify": 0,
            "wxDoorbellNotify": 0,
            "appDoorbellNotify": 1
        },
        "devGroups": [],
        "groups": [],
        "params": {
            "pulseWidth": 500,
            "pulse": "off",
            "init": 1,
            "startup": "off",
            "staMac": "**:**:**:**:**:**",
            "rssi": -50,
            "fwVersion": "3.0.1",
            "switch": "off",
            "sledOnline": "on",
            "version": 8
        },
        "online": true,
        "createdAt": "2019-10-15T07:22:11.700Z",
        "group": "",
        "sharedTo": [],
        "devicekey": "***************",
        "deviceUrl": "",
        "brandName": "Maker",
        "showBrand": true,
        "brandLogoUrl": "",
        "productModel": "Sonoff basic R2",
        "devConfig": {},
        "uiid": 6
    }
]
```

