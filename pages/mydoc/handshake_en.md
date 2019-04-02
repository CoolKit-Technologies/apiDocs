---
title: Handshake
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: handshake_en.html
folder: mydoc
layout: page_en
---
 
Handshake completes authorization during connection,reports environment data from client,and receives configuaration data returned from server.

Handshake happens on app and device.

**APP Handshake**
- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|action |Yes  |String |userOnline   |
|version |Yes  |Int | IOT agreement version, current is 8    |
|imei |No  |String | available in app client only,imei of cellphone   |
|ts |Yes  |Int | timestamp to second on app client   |
|os |No  |String | available in mobile app only, value is：android/ios  |
|at |Yes  |String | APP should provide access token to be authorized  |
|userAgent |Yes  |String | app  |
|apikey |Yes  |String | user apikey  |
|appid |Yes  |String | app id assigned by Coolkit  |
|nonce |Yes  |String | 32-digit random integer in hexadecimal，say 8-digit random alphanumeric value  |
|sequence |Yes  |String | timestamp string to millisecond  |


**Device Handshake**
- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|action |Yes  |String |register   |
|version |Yes  |Int | IOT agreement version, current is 8    |
|deviceid     |Yes  |String | device id    |
|ts |Yes  |Int | uint32 uint32 variable turns into decimal string   |
|userAgent |Yes  |String | device  |
|apikey |Yes  |String | default device apikey  |
|mac |Yes  |String | authentic mac address of device  |


- Response parameters

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |Yes  |Int |0 means success   |
|apikey |No  |String | returns user apikey    |
|config     |No  |Config | configuration info    |

- Config

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|hb |No  |Int |heartbeat，whether to send heardbeat or not. 0：no， 1：yes   |
|hbInterval |No  |Int | heartbeat interval in seconds.client should add 7 to this value and use the result as interval for sending ping to keep alive the heartbeat. By default,the interval is 90 seconds.   |




