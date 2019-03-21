---
title: 配对过程
permalink: pair.html
sidebar: mydoc_sidebar
last_updated: 2019-03-20
folder: mydoc
---

```
配对目的：
1,获取设备数据
2,让设备联网
3,设备添加到用户帐号下
```

 **说明：**

```
1,配对过程仅适用于不通过易微联APP配对添加设备的应用。比如：自主研发的APP配对添加设备。通过易微联APP配对添加设备的应用，不需要实现配对过程。
2,文档中的 IP 以及各项数据仅是示例
3,设备配对分为Touch和AP两种配对模式
```

## touch配对过程

① 设备进入配置模式：touch模式

② 设备等待APP广播 SSID & password

③ 设备获取到 SSID & password 后连上路由器，返回 touch UDP 确认包

④ 设备建立 TCP server（http server）

⑤ 手机发送：（请求配对）

```
GET /device HTTP/1.1
Host: 192.168.1.1
Connection: Keep-Alive
```

⑥ 设备回应： （回应 deviceID 、apikey）

```
HTTP/1.1 200 OK
Content-Type: application/json
Connection: keep-alive
Content-Length: 99

{
   "deviceid":"100000788a",
   "apikey":"4b21ebbe-8870-4d4a-93f2-7c6cfeff5fea",
   "chipid":"sjljb",
   "accept":"post"
}
```

⑦ 手机回应：（回应 分配服务器地址，端口号，wifi 热点 SSID、密码）

```
POST /ap HTTP/1.1
User-Agent: Dalvik/1.6.0 (Linux; U; Android 4.4.2; SM705 Build/SANFRANCISCO)
Host: 192.168.1.1
Connection: Keep-Alive
Accept-Encoding: gzip
Content-Type: application/x-www-form-urlencoded
Content-Length: 76

{"port":443,"serverName":"54.223.98.144","password":"12345678","ssid":"ITT"}
```

⑧ 设备回应：

```
HTTP/1.1 200 OK
Content-Type: application/json
Connection: keep-alive
Content-Length: 11

{"error":0}
```

⑨ 配对完成


## AP配对过程

① 设备进入配置模式：AP 热点，TCP server（http server）

② 手机连到 AP

③ 手机发送：（请求配对）

```
GET /device HTTP/1.1
Host: 192.168.1.1
Connection: Keep-Alive
```

④ 设备回应： （回应 deviceID 、apikey）

```
HTTP/1.1 200 OK
Content-Type: application/json
Connection: keep-alive
Content-Length: 99

{
   "deviceid":"100000788a",
   "apikey":"4b21ebbe-8870-4d4a-93f2-7c6cfeff5fea",
   "chipid":"sjljb",
   "accept":"post"
}
```

⑤ 手机回应：（回应 分配服务器地址，端口号，wifi 热点 SSID、密码）

```
POST /ap HTTP/1.1
User-Agent: Dalvik/1.6.0 (Linux; U; Android 4.4.2; SM705 Build/SANFRANCISCO)
Host: 192.168.1.1
Connection: Keep-Alive
Accept-Encoding: gzip
Content-Type: application/x-www-form-urlencoded
Content-Length: 76

{"port":443,"serverName":"54.223.98.144","password":"12345678","ssid":"ITT"}
```

⑥ 设备回应：

```
HTTP/1.1 200 OK
Content-Type: application/json
Connection: keep-alive
Content-Length: 11

{"error":0}
```

⑦ 手机重新连接 wifi ，与服务器交互
