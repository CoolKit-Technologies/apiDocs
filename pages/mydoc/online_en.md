---
title: Device Online/Offline
sidebar: mydoc_en_sidebar
last_updated: 2019-03-20
permalink: online_en.html
folder: mydoc
layout: page_en
---

When server detects device going online or offline, app will be notified of the update.Such notification is sent by server automatically. No need to request from app.
- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|action |Yes  |String |sysmsg   |
|apikey |Yes  |String | User apikey    |
|deviceid     |Yes  |String | Device id    |
|params     |Yes  |Params | Device parameters    |

- Params

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|online |Yes  |String |true: device is online false: Device is offline   |



