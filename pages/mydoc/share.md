---
title: 设备分享
last_updated: 2019-10-31
sidebar: mydoc_sidebar
permalink: share.html
folder: mydoc
---

客户端发送指令给服务端，分享设备给同区域下的其他用户。

---

说明：

1. 分享的设备不能被再次分享。

2. 分享时需要被分享方在线，没有接收分享导致超时后，三分钟之后才能再次分享给该用户。

3. 用户接收分享后，没有分享时间限制。
   
4. 分享成功后被分享用户也可以控制设备，被分享用户不能进行分享、定时、修改设备名称等操作。


请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|apikey |是  |String |用户apikey   |
|deviceid |是  |String | 设备id    |
|action     |是  |String | 值为 share    |
|userAgent     |是  |String | 值为 app    |
|params     |是  |ShareParam |     |
|sequence     |是  |String | 时间戳，精确到毫秒    |
|s_seq     |否  |String | 时间戳，精确到毫秒    |

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

```Json
{
    "action":"share",
    "apikey":"用户APIKEY",
    "deviceid":"1000000001",
    "sequence":15452192511000,
    "userAgent":"app",
    "params":{
        "uid":"+86127123456789",
        "deviceName":"我的设备00001",
        "userName":"朋友",
        "permit":15,
        "note":"这是一次测试分享"
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


状态码：

     0：ok(操作成功)
     400：Bad Request（参数错误）
     401：认证不通过
     403：Forbidden（无权限）
     406：用户在其他设备登录
     500：Internal Server Error（服务器内部错误）
     504：分享超时（对方没有拒绝也没有同意）

返回示例：

```Json
{
  "error": 0,
  "result": 2,
  "apikey":"用户APIKEY",
  "deviceid": "1000000001",
  "sequence": "1571141530100"
}
```


