---
title: Server Dispatch
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: dispatch_en.html
folder: mydoc
layout: page_en
---

All APIs are based on websocket protocol except for server dispatch.

Client accesses Server Dispatch API to get the ip,domain and port of persistent connection,creates persistent connection,and send handsake command to register.Then it is ready to send other commands to control devices.

After connecting to websocket, the client needs to send a websocket ping every n second to keep connection alive. n is determined by the return value of handshake.In case no pong from server is received in 3 seconds, connection will be closed and rebuilding connection is needed.

**Comman Note(Important)：**

Format of websocket address: ```wss://ip_address:port/api/ws```

ip_address: returned by Server Dispatch API.(use ip first,only use domain name when impossible to skip certificate check)

port: returned by Server Dispatch

/api/ws:fixed suffix，to build complete url with previous dynamic paramters.

Note：When wss connection is created, client will verify whether visiting domain name matches certificate domain.Therefore,error will be returned when connection is built by ip.If possible, client must skip certificate domain check(android and java can do this).In case that certificate check can’t be skipped, then wss connection has to be built with domain name.

App accesses this API to check the info(ip,port) of persistent connection for websocket, and then build persistent connection.
- Note：Authorization header should contain access token.
- Production environment URL: ``` https://cn(区域)-disp.coolkit.cn:8080/dispatch/app``` 
- Test environment URL: ``` https://testapi.coolkit.cn:8080/dispatch/app``` 
- Request method： POST

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|accept |Yes  |String |only ws now  |
|version | Yes |Int | version:8    |
|appid     |Yes  |String | app id provided by Coolkit   |
|ts     |Yes  |Int | timestamp to second(from 1970)    |
|nonce     |Yes  |String | 32-digit random integer in hexadecimal，say 8-digit random value of letters and numbers   |

- Response parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |Yes  |Int |error code   |
|reason |Yes  |String | error description    |
|requestid     |Yes  |String | ts+"-"+nonce    |
|IP     |Yes  |String | persistent connection to server IP    |
|port     |Yes  |Int | persistent connection to server port    |
|domain     |Yes  |String | persistent connection to server domain.Currently, only app client returns domain.IP should be the first selection of android client to reduce issues caused by dns resolution.As js client could not skip certificate check,only domain can be used.   |

```
error code
0:success
400:wrong parameter
401:authorization failed(remind to login)
402:expired(app auto refreshes access token)
403:no permission(app prompts no permission,e.g.app no access to OTA)(401-403 are authorization errors sent by internal authorization system)
500:server error
```



