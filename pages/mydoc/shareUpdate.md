---
title: 修改分享
sidebar: mydoc_sidebar
permalink: shareUpdate.html
last_updated: 2019-10-31
folder: mydoc
---

app向服务端发送指令，修改被分享方对定时器的控制权限。

- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|apikey |是  |String |用户apikey   |
|deviceid |是  |String | 设备id    |
|action     |是  |String | 值为 updateShare    |
|userAgent     |是  |String | 值为 app    |
|params     |是  |ShareParam |     |
|sequence     |是  |String | 时间戳，精确到毫秒    |

ShareParam定义

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|uid |是  |String |用户手机号，中文版客户端直接加上+86，国际版需要用户选择国家或者email   |
|deviceName |是  |String | 设备名称   |
|userName     |是  |String | 用户名称    |
|permit     |否  |Int | 权限值之和，采用位移操作计算，权限值定义如下：1:新增定时器;2:修改定时器;4:删除定时器;8:启用定时器    |
|shareTime     |否  |Long |   GMT标准时间，毫秒数，主要用来在客户端显示排序  |
|note     |是  |String | 分享备注，长度为10个汉字    |

permit计算规则：1：新增定时器；2：修改定时器；4:删除定时器；8:启用定时器；四者之和为15

示例：

示例：

```Json
{
    "action":"updateShare",
    "apikey":"用户APIKEY",
    "deviceid":"1000000001",
    "sequence":15452192511000,
    "userAgent":"app",
    "params":{
        "uid":"+86127123456789",
        "deviceName":"我的设备00001",
        "userName":"朋友",
        "permit":11,
        "note":"这是一次修改分享"
    }
}
```

响应参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |状态码   |
|result |否  |Int | 1：手机号不存在；2：用户接受分享；3：用户不接受分享；4：已分享    |
|apikey     |否  |String | 分享方用户的apikey    |
|deviceid     |否  |String | 设备id    |
|sequence     |否  |String | 时间戳，精确到毫秒从请求参数中获取    |






