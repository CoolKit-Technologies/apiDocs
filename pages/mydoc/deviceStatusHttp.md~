---
title: 查询设备状态
last_updated: 2019-03-20
sidebar: mydoc_sidebar
permalink: deviceStatusHttp.html
folder: mydoc
---



查询设备的状态。比如：定时器，开关状态等
- 现网环境URL： ``` https://cn(区域)-api.coolkit.cn:8080/api/user/device/status ```
- 测试环境URL：``` https://testapi.coolkit.cn:8080/api/user/device/status ```
- 请求方法： GET
- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|deviceid |是  |String |设备id  |
|params |否  |String | 参数列表，指定要查询的参数，用符号分隔（需要做URI encode）。如果为空，表示查询所有参数    |

```
params举例说明：
需要查询switch和timers，请求url为:
https://cn-api.coolkit.cc:8080/api/user/device/status?deviceid=1234abcd
```

- 响应参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |错误码  |
|errmsg |否  |String | 错误说明，error非0时返回 |
|params |否  |Params | 参数  |

```
错误码
0:操作成功
400:参数错误
401:认证失败
403:无权限
500:服务器内部错误

Params说明：
返回对应参数的json值，如果没有查询到任何参数值，则返回空对象，例如：

{ "error": 0,"params": { "switch": "on" } }
没有查询到任何参数：
{ "error": 0,"params": { } }
```


