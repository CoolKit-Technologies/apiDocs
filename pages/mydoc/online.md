---
title: 设备上线/离线
sidebar: mydoc_sidebar
last_updated: 2019-03-20
permalink: online.html
folder: mydoc
---

服务端检测到设备上线或者下线以后，会向app发送通知指令。该指令app端是被动接收，不需要主动发送。
- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|action |是  |String |sysmsg   |
|apikey |是  |String | 绑定用户的apikey    |
|deviceid     |是  |String | 设备id    |
|params     |是  |Params | 设备参数    |

- Params

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|online |是  |String |true:设备上线。false:设备下线   |



