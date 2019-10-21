---
title: 分配服务
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: dispatch.html
folder: mydoc
---

说明：分配服务、查询设备状态和更新设备状态为HTTP接口，其它接口都基于websocket。

客户端先通过分配服务接口获取长连接的ip、域名、端口号等信息，然后建立websocke长连接，并发送握手指令进行注册。然后就可以发送其他的控制指令对设备进行控制。

客户端连接websocket服务成功后，需要每隔n秒发送一个websocket ping来保活连接，n由握手指令返回值决定。如果3秒内没有收到服务器的pong响应，则需要关闭连接，重建长连接。

**公共说明（重要）：**

websocket接口地址格式：```wss://ip_address:port/api/ws```

ip_address：由分配服务接口返回（尽量使用ip，无法跳过证书检查则使用域名）

port：由分配服务接口返回

/api/ws：固定的url，与前面的动态参数拼接成完整的url

注意：建立wss连接的时候，客户端会校验访问的域名与证书的域名是否一致，所以默认情况下如果用ip建立连接，会报错，导致建立连接失败。所以，如果可以的话，客户端必须跳过证书的域名校验（android和java都可以跳过）。 如果无法跳过证书校验，那么就只能用域名去建立wss连接了。

应用端通过该接口查询websocket长连接服务器的信息（Ip、端口），然后连接长连接服务。


---

接口地址： https://cn-api.coolkit.cn:8080/dispatch/app

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Parmas：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|accept |是  |String |当前只支持 ws   |
|version |是  |Int | version:8    |
|appid     |是  |String | 酷宅给第三方应用分配的appid    |
|ts     |是  |Int | 到秒的unix时间戳（1970开始）    |
|nonce     |是  |String | 32位随机整型16进制字符表示，即8位字母数字随机值    |

- 响应参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |状态码   |
|reason |是  |String | 错误说明    |
|requestid     |是  |String | ts+”-”+nonce    |
|IP     |是  |String | 长连接服务器外网IP    |
|port     |是  |Int | 长连接服务器外网端口    |
|domain     |是  |String | 长连接服务器域名。目前只有app端才会返回域名。android客户端尽量选择用ip建立长连接，这样可以减少dns解析带来的问题，js版客户端无法跳过证书检查，那么就只能用域名了。    |


状态码：

    0：成功
    400：客户端参数错误
    401：认证不通过（ 提示登录 ）
    402：过期 （ APP自动刷新access token）
    403：无权限 （ APP提示无权限，比如APP无权访问OTA接口）（401-403认证错误由内部认证系统给出）
    500：服务端内部错误



