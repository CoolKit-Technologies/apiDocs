---
title: Check Device Status
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: deviceStatusHttp_en.html
folder: mydoc
layout: page_en
---



Check device statuses, such as timers, on/off, etc.
- Production environment URL: ``` https://cn(区域)-api.coolkit.cn:8080/api/user/device/status ```
- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/user/device/status ```
- Request method： GET
- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|deviceid |Yes  |String |device id  |
|params |No  |String | parameters list，specify which parameter to check,separated with sign（need URI encode）. When empty,all parameters will be checked   |

```
params example：
to check switch and timers，request url is:
https://cn-api.coolkit.cc:8080/api/user/device/status?deviceid=1234abcd
```

- Response parameters

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |Yes  |Int |error code  |
|errmsg |No  |String | error discription，returned when error is not 0 |
|params |No  |Params | parameters  |

```
error code
0:success
400:wrong parameter
401:authorization failed
403:no permission
500:server error

Params Description：
return json value of parameter,return empty object if no paramter found.For example：

{ "error": 0,"params": { "switch": "on" } }
No parameter is found：
{ "error": 0,"params": { } }
```


