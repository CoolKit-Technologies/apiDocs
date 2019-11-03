---
title: 设备状态查询
last_updated: 2019-10-31
sidebar: mydoc_sidebar
permalink: findStatus.html
folder: mydoc
---

设备端和app向服务器发送该指令，查询设备状态或者参数。

---

请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|action |是  |String |query   |
|apikey |是  |String | 绑定用户的apikey    |
|deviceid     |是  |String | 设备id    |
|userAgent     |是  |String | device：设备端。app: app端    |
|params     |是  |[string] | 字符串数组，指定要查询的参数。如果为空表示查询所有参数    |

```
params说明：
["switch"," timers"]
```

响应参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |状态码   |
|apikey |是  |String | 绑定用户的apikey    |
|deviceid     |是  |String | 设备id    |
|params     |是  |Params | 键值对    |

状态码：

    0：操作成功
    400：Bad Request（参数错误）
    403：Forbidden（无权限）
    500：internal Server Error（服务器内部错误）






