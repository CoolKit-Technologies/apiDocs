---
title: Pairing Process
permalink: pair_en.html
sidebar: mydoc_en_sidebar
last_updated: 2019-03-20
folder: mydoc
layout: page_en
---

```
Purposes for pairing：
1,Get device data
2,Connect device to internet
3,Add device to user account
```

 **Note：**

```
1,Pairing only fits for devices that can not be paired by eWeLink APP, such as a device whose APP is developed by third parties. APP that add its device through eWeLink APP do not need to go through the pairing process.
2,IP and all other data in this documentation are for references only.
3,There are two pairing modes, Touch and AP.
```

## Touch pairing process

① Device enters pairing mode: Touch mode.

② Device waits for APP to broadcast SSID & password.

③ Device acquires SSID & password and connect to router. Return touch UDP ACK packet.

④ Device establishes TCP server（http server）

⑤ Smartphone sends: (Pairing request)

```
GET /device HTTP/1.1
Host: 192.168.1.1
Connection: Keep-Alive
```

⑥ Device responds： （Responds deviceID 、apikey）

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

⑦ Smartphone responds：（Responds server IP address，Port，wifi hotspot SSID、password）

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

⑧ Device responds：

```
HTTP/1.1 200 OK
Content-Type: application/json
Connection: keep-alive
Content-Length: 11

{"error":0}
```

⑨ Pairing is completed


## AP Pairing Process

① Device enters pairing mode：AP hotspot，TCP server（http server）

② Smartphone connects to AP

③ Smartphone connects to AP

```
GET /device HTTP/1.1
Host: 192.168.1.1
Connection: Keep-Alive
```

④ Device responds： （Responds deviceID 、apikey）

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

⑤ Device responds： （Responds deviceID 、apikey）

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

⑥ Device responds：

```
HTTP/1.1 200 OK
Content-Type: application/json
Connection: keep-alive
Content-Length: 11

{"error":0}
```

⑦ Smartphone reconnects wifi and interact with server
