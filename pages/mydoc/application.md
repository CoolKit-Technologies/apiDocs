---
title: 创建第一个应用
last_updated: 2019-03-20
summary: "本文从登录、获取设备数据、建立长连接到设备控制等方面讲解如何在酷宅云平台上面实现与设备的数据交互。让你可以快速地开发应用，并了解用户与设备之间的关系，设备控制和响应的过程。下面一起来通过示例应用快速入门如何开发自己的应用"
sidebar: mydoc_sidebar
permalink: application.html
folder: mydoc
---


# 示例
示例提供开发参考，具体开发过程中，请替换成自己的参数。

```
第一步：登录，认证帐号获取认证token，通过认证后才能获取访问服务的权限。
第二步：设备列表，获取帐号下添加的所有设备。设备控制时需要提供相关设备数据以及用户数据。
第三步：访问分配服务，获取连接信息。
第四步：建立连接，通过第三步获取的连接信息，建立连接。
第五步：握手，通过第一步获取的认证信息(at即access token)，进行握手。握手成功后，表示认证通过可以接下来进行设备控制。
第六步：控制设备，通过第二步获取的设备信息，发送update指令进行设备控制。
```

## 创建websocket连接和发送控制命令流程
![](https://www.showdoc.cc/server/api/common/visitfile/sign/2ab3e0e98d38e1204d4e85d71ae84ab3?showdoc=.jpg)

## 登录
调用登录接口 ``` https://testapi.coolkit.cn:8080/api/user/login``` 

请求方法： POST

请求参数：(appid由销售提供,phoneNumber,password,ts,nonce请替换成自己的参数)

参数说明请查看[开发通用说明](instruction.html)和[登录服务](login.html)

```
{"appid":"I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF","phoneNumber":"+8613570211955","password":"lybywl163","ts":1545219251123,"version":8,"nonce":"asbsedwq"}
请求头：
Authorization:Sign QtKh6EnKoNmPnv17Ump3b/6r2hjojWb4nqSt4lnyj2U=
Content-Type:application/json
认证头说明：Sign+空格+签名值。签名值通过传递的参数算出。注意参数顺序传递不一样，签名值也会不一样。
```

关于签名，请查看[开发通用说明](instruction.html)
  
  **调试工具：Postman**
  
  ![](https://www.showdoc.cc/server/api/common/visitfile/sign/c93e9a4cd4c96ebb320cd2ef8535199e?showdoc=.jpg)
  
注意：截图红框中返回的at作为登录后的接口签名值。当at失效时，通过rt刷新at。
  
  **认证头截图：**

  ![](https://www.showdoc.cc/server/api/common/visitfile/sign/5861408dc344e5716c8618a2454b8a87?showdoc=.jpg)
  
**返回参数** 

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |否  |String |失败时返回，且只会返回error|
|at |否  |String |acess token，at有效期为一个月（注意：每登录一次，at会重新生成，不支持同帐号多处使用）   |
|rt |否  |String | refresh token，rt有效期为两个月    |
|user     |否  |String | 用户信息    |
|region     |否  |String | 区域    |
  
```
error错误码
400: 缺少参数
301：用户在其他大区，需要客户端结合region重定向,重新连接
401:用户名密码错误
402：邮箱未激活
404：用户不存在
406：认证失败
500：服务器错误
```

 **返回示例**

``` 
{
    "at": "b1d576f797ae86d276d366e7b8772ecbacecc18d",  //请求其他接口的签名值。有效期一个月
    "rt": "436adf6b1f1e5e6fdc6061317b3aca6bcefa45c1",  //token失效时，刷新token时使用。有效期两个月
    "user": {
        "_id": "5bf3b28e9ac7c1788fc27f1b",
        "phoneNumber": "+8613570211955",
        "appId": "I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF",
        "lang": "cn",
        "online": false,
        "onlineTime": "2018-12-20T01:45:36.771Z",
        "ip": "113.110.230.62",
        "location": "广东",
        "offlineTime": "2018-12-20T01:46:40.978Z",
        "createdAt": "2018-11-20T07:06:54.710Z",
        "apikey": "a4e77f7e-2116-4215-b961-6f3fc5982667"
    },
    "region": "cn"
}
```

## 请求设备列表
调用获取设备列表接口 ``` https://testapi.coolkit.cn:8080/api/user/device?version=8```

请求方法： GET

请求头：
Authorization:Bearer b1d576f797ae86d276d366e7b8772ecbacecc18d(上文登录成功返回的at，即access token)

Content-Type:application/json

认证头说明：Bearer+空格+at。关于签名，请查看[开发通用说明](instruction.html)

**调试工具：Postman**

![](https://www.showdoc.cc/server/api/common/visitfile/sign/416fb269d043615cb621d0020212e953?showdoc=.jpg)


**返回参数** 

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |String |成功返回error:0|
|devicelist |否  |Object |设备信息列表   |

```
设备信息列表重点数据解析：
sharedBy：分享方的信息（被分享方查看显示）
sharedTo：被分享方的信息（分享方查看显示）
```

**返回示例**

``` 
{
    "error": 0,
    "devicelist": [
        {
            "name": "我的设备00140e",
            "deviceid": "100000140e",
            "apikey": "a4e77f7e-2116-4215-b961-6f3fc5982667",
            "onlineTime": "2018-12-20T08:58:44.177Z",
            "ip": "113.110.230.62",
            "location": "广东",
            "groups": [],
            "params": {
                "startup": "off",
                "staMac": "18:FE:34:FE:70:7D",
                "rssi": -73,
                "fwVersion": "1.6.0",
                "switch": "off"
            },
            "online": true,
            "createdAt": "2018-12-20T08:58:39.582Z",
            "sharedTo": [],
            "uiid": 1
        }
    ]
}
```

## 访问分配服务 
调用分配服务接口 ``` https://testapi.coolkit.cc:8080/dispatch/app```

请求方法： POST

请求参数：(appid由销售提供,ts,nonce自己替换)

请求参数说明请查看[分配服务](https://www.showdoc.cc/coolkit?page_id=1202173029627789 "分配服务")
```{"accept":"ws","version":8,"appid":"I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF","ts":1545219251123,"nonce":"asbsedwq"}```

**调试工具：Postman**

![](https://www.showdoc.cc/server/api/common/visitfile/sign/db18156609b7ef8046ea3a251f98bea0?showdoc=.jpg)

**返回参数：重点参数详解（通过返回的IP或者domain+port请求下文的建立连接），详情查看[分配服务](dispatch.html)**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|IP     |是  |String | 长连接服务器外网IP    |
|port     |是  |Int | 长连接服务器外网端口    |
|domain     |是  |String | 长连接服务器域名。目前只有app端才会返回域名。android客户端尽量选择用ip建立长连接，这样可以减少dns解析带来的问题，js版客户端无法跳过证书检查，那么就只能用域名了。    |

## 建立连接 
通过分配服务返回的IP或者domain建立握手。请求 ```wss://test-pconnect1.coolkit.cc:8080/api/ws```

websocket测试工具： ```http://www.blue-zero.com/WebSocket/```

![](https://www.showdoc.cc/server/api/common/visitfile/sign/1c7e025cea9e4aac37f0ed6982749940?showdoc=.jpg)

如上图，连接已建立，正在等待数据...。表示连接成功，可以开始接下来的握手了。

## 握手
![](https://www.showdoc.cc/server/api/common/visitfile/sign/00f0ca63f139131ff6c90eb3ef38a82d?showdoc=.jpg)

参数说明请查看[握手](handshake.html)

	握手示例数据：at和apikey都在登录后返回的参数中有。
	注意：ts为到秒的时间戳，ts不符合规则会请求失败。
	at，apikey，appid，nonce，sequence替换成自己的参数

	{"action":"userOnline","version":8,"ts":1545219251,"at":"351bc7395e03a39fd537db8d6137d6f3d9548568","userAgent":"app","apikey":"a4e77f7e-2116-4215-b961-6f3fc5982667","appid":"I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF","nonce":"asbsedwq","sequence":"1545219251123"}

握手成功响应：

	{"error":0,"apikey":"a4e77f7e-2116-4215-b961-6f3fc5982667","config":{"hb":1,"hbInterval":145},"sequence":"1545219251123","socketid":"0298c7fffec9eeca-0000602f-00052b04-c10ec99a40f6e6d4-6739904a"}

hbInterval为心跳时间，需要在145S内发送ping，保持心跳，服务器收到ping后会响应pong
![](https://www.showdoc.cc/server/api/common/visitfile/sign/d704be6a5a227dd05808aed4ddf1d73b?showdoc=.jpg)

## 发送控制指令
![](https://www.showdoc.cc/server/api/common/visitfile/sign/03eb49909867fe056bf952c484c7147a?showdoc=.jpg)

控制指令示例参数。params的协议根据不同设备有所不同。商务合作后会根据对接的设备提供协议文档。apikey,deviceid,sequence,params替换成自己的参数
参数说明请查看[更新/上报状态](deviceStatus.html)

	{"action":"update","apikey":"a4e77f7e-2116-4215-b961-6f3fc5982667","deviceid":"100000140e","userAgent":"app","sequence":"1545219251123","params":{"switch":"on"}}

控制指令回复：回复error:0表示成功。更多错误码请查看[更新/上报状态](deviceStatus.html)

	{"error":0,"deviceid":"100000140e","apikey":"a4e77f7e-2116-4215-b961-6f3fc5982667","sequence":"1545219251123","socketid":"0298c7fffec9eeca-0000602f-00053240-e2b44b54e6e6afaa-e8a60ede"}

**注意：**

一：如果设备是别人分享给你的，apikey一定要从设备列表接口返回的apikey参数中获取值。如果设备主人就是自己，则登录返回的apikey和设备列表返回的apikey，都可以。

二：设备一定要在线。成功后，观察设备是否执行了开或者关


整个流程顺利完成。接下来在[API中心](apiOverview.html)查看如何使用区域功能，帐号功能，设备管理功能，设备控制功能，认证功能。

