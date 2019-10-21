---
title: 撤销分享
sidebar: mydoc_sidebar
last_updated: 2019-03-20
permalink: shareCancel.html
folder: mydoc
---

分享方撤销分享后，设备会在被分享用户app上的设备列表中删除，失去控制设备的权限。

说明：撤销分享时，可能已经被撤销过了，此处响应参数不做区分。

- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|apikey |是  |String |用户apikey   |
|deviceid |是  |String | 设备id    |
|action     |是  |String | 值为 cancelShare    |
|userAgent     |是  |String | 值为 app    |
|params     |是  |ShareParam |     |
|sequence     |是  |String | 时间戳，精确到毫秒    |

- ShareParam定义

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|uid |是  |String |用户手机号，中文版客户端直接加上+86，国际版需要用户选择国家或者email   |
|deviceName |是  |String | 设备名称   |

- 响应参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |总可以成功，除非内部错误   |
|sequence     |是  |String | 从请求参数中获取    |




