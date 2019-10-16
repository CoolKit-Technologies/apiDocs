---
title: 配对过程
permalink: pair.html
sidebar: mydoc_sidebar
last_updated: 2019-10-15
folder: mydoc
---


### 配对目的

- 获取设备数据
- 让设备联网
- 将设备添加到用户帐号下

说明：

- 配对过程仅适用于不通过易微联APP配对添加设备的应用，比如：自主研发的APP配对添加设备。
- 通过易微联APP配对添加设备的应用，不需要实现配对过程。
- 文档中的 IP 以及各项数据仅是示例。
- 设备配对分为Touch和AP两种配对模式。
- 我们的Touch配对基于「[乐鑫 ESP-TOUCH SDK](https://www.espressif.com/zh-hans/products/software/esp-touch/resources)」实现。


### 配对过程

![配对过程](img/pair.png)

#### Touch配对过程

**说明：易微联Touch配对过程对密码做了加密，此部分内容需要询问对接市场。见文章最底部「[易微联配对加密规则](#易微联配对加密规则)」**

1. 设备进入配置模式：Touch模式
2. 设备等待APP广播 SSID & Password 
3. 设备获取到 SSID & Password 后连上路由器，返回 touch UDP 确认包
4. 设备建立 TCP Server（HTTP Server）
5. 手机发送：（请求配对）
```
GET /device HTTP/1.1
Host: 192.168.1.1
Connection: Keep-Alive
```
6. 设备回应：（回应 deviceID 、apikey）
```
HTTP/1.1 200 OK  
Content-Type: application/json  
Connection: keep-alive
Content-Length: 99
```
```
{
  "deviceid":"100000788a",
  "apikey":"4b21ebbe-8870-4d4a-93f2-******",
  "chipid":"sjljb",
  "accept":"post"
}
```
7. APP请求添加设备接口，直接携带设备参数添加到用户账号下
8. APP发送：分配服务器地址、端口号、SSID、WiFi密码
```
POST /ap HTTP/1.1
User-Agent: Dalvik/1.6.0 (Linux; U; Android 4.4.2; SM705 Build/SANFRANCISCO)
Host: 192.168.1.1
Connection: Keep-Alive
Accept-Encoding: gzip
Content-Type: application/x-www-form-urlencoded
Content-Length: 76
```
```
{"port":443,"serverName":"cn-disp.coolkit.cc","password":"12345678","ssid":"eWelink"}
```
9. 设备回应：
```
HTTP/1.1 200 OK
Content-Type: application/json
Connection: keep-alive
Content-Length: 11
```
```
{"error":0}
```
配对完成

#### AP配对过程

1-7步一致，第8步放到最后（先POST分配服务器地址，再添加），WiFi不加密传输。

配对过程略复杂，本文如有错误内容，请指正。

#### 易微联配对加密规则

为保证易微联平台设备安全，易微联制定了加密规则，拒绝非法客户端连接我们的设备。酷宅合作伙伴开发客户端可以与对接市场沟通，我司会提供对应资料。