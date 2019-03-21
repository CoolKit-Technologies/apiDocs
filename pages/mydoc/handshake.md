---
title: 握手
last_updated: 2019-03-20
sidebar: mydoc_sidebar
permalink: handshake.html
folder: mydoc
---
 
实现连接建立时的认证，客户端上报环境数据，服务器返回配置数据。
握手分APP端和设备端

**APP端握手**
- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|action |是  |String |userOnline   |
|version |是  |Int | IOT协议版本，当前为8    |
|imei |否  |String | App端特有属性：手机的imei号   |
|ts |是  |Int | APP端为到秒时间戳   |
|os |否  |String | 手机APP才上报，值为：android/ios   |
|at |是  |String | APP端必须提供access token实现认证  |
|userAgent |是  |String | app  |
|apikey |是  |String | 用户apikey  |
|appid |是  |String | 酷宅分配给第三方应用的appid  |
|nonce |是  |String | 32位随机整型16进制字符表示，即8位字母数字随机值  |
|sequence |是  |String | 到毫秒的时间戳字符  |


**设备端握手**
- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|action |是  |String |register   |
|version |是  |Int | IOT协议版本，当前为8    |
|deviceid     |是  |String | 设备id    |
|ts |是  |Int | uint32 变量转为10进制字符串   |
|userAgent |是  |String | device  |
|apikey |是  |String | 设备出厂apikey  |
|mac |是  |String | 设备真实的mac地址  |


- 响应参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |0表示握手成功   |
|apikey |否  |String | 返回的是用户apikey    |
|config     |否  |Config | 配置信息    |

- Config

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|hb |否  |Int |heartbeat心跳开关，是否需要发送心跳。0：不需要， 1：需要   |
|hbInterval |否  |Int | 心跳间隔，以秒为单位.客户端需要把这个值加上7 作为间隔时间发送保活ping心跳。如果为空，缺省以90秒为间隔发送。    |




