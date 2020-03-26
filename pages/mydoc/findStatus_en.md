---
title: Check Device Status
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: findStatus_en.html
folder: mydoc
layout: page_en
---

Device and app send this command to server to check device statuses or parameters.
- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|action |Yes  |String |query   |
|apikey |Yes  |String | user apikey    |
|deviceid     |Yes  |String | device id    |
|userAgent     |Yes  |String | device：device app: app    |
|params     |Yes  |[String] | String array of specified parameters.when this parameter is empty, returns all parameters.    |

```
params description：
["switch","timers"]
```

- Response parameters

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |Yes  |Int |error code   |
|apikey |Yes  |String | user apikey    |
|deviceid     |Yes  |String | device id    |
|params     |Yes  |Params | key-value pair    |


Error code:

0:ok(operation succeeded)  
400:Bad Request（wrong parameter）  
403:Forbidden（no permission）  
500:Internal Server Error（Internal server error）  

PARAM description：

Returns specified json value.When no parameter is found, returns 0 (for device) or empty object( for app).

For example:：

```
{ "error": 0, "apikey": "123e4567­e89b­12d3­a456­426655440000",  "deviceid": "01ad0253f2", "params": { "switch": "on" } }
```

Query from app，while no parameter was found

```
{ "error": 0, "apikey": "123e4567­e89b­12d3­a456­426655440000",  "deviceid": "01ad0253f2", "params": { } }
```
