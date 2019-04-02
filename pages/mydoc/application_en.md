---
title: Create Your First Application
last_updated: 2019-03-20
summary: This article explains in details on Login, Accessing device data, Building persistent connection and many other topics, for you to understand how device data are interchanged on Coolkit Cloud platform.You will be able to develop your application faster with it.It helps you understand the interaction between users and devices and the process of controlling devices and the response from devices.Quick start to learn how to develop your own application by referring to the example below.
sidebar: mydoc_en_sidebar
permalink: application_en.html
folder: mydoc
layout: page_en
---


# Example
The example here is for reference only. Please use your own parameters when developing your own application.

```
First step: Login, authenticate your account and get authentication token. You will be granted access to services after you are authenticated.
Second step：Device List. Obtain all the devices in your account. When you control the device, you need to provide the device data and user info.
Third step：Access dispatched server to get connection info.
Fourth step：Build connection.Build connection with the connection info from third step.
Fifth step：Handshake.Handshake with the access token(‘at’ means access token) you get on the first step.If handshake is done successfully, you have passed the authentication and should be ready to control devices.
Sixth step：Control the device. Send update command to the device through the device info you get on the second step.
```

## The workflow of building websocket connection and sending command to control device

<img src="{{ "images/controlFlow.jpg" }}" alt="workflow"/>

## Login
Login API ``` https://testapi.coolkit.cn:8080/api/user/login``` 

Request Method： POST

Request Parameters：(appid provided by your salesperson,phoneNumber,password,ts, nonce Please use your own 'nonce' here)

Click here to check Parameter descriptions [General Developer instructions](instruction_en.html) and [Login](login_en.html)

```
{"appid":"I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF","phoneNumber":"+8613570211955","password":"lybywl163","ts":1545219251123,"version":8,"nonce":"asbsedwq"}
Request Header：
Authorization:Sign QtKh6EnKoNmPnv17Ump3b/6r2hjojWb4nqSt4lnyj2U=
Content-Type:application/json
Authorization header decription：Sign+Space+Signature value.Signature value is calculated by the passed parameters.Note that signature value will be different in case the order of parameters changes.
```

For more about signature, please click to check [General developer instructions](instruction_en.html)
  
  **Debug Tool：Postman**
  
  <img src="{{ "images/postman_loginParams.jpg" }}" alt="Login"/>
  
Note：The marked 'at' in screenshot works as signature value for socket after login.When at expires,refresh 'at' via 'rt'.
  
  **Screenshot for Authorization header：**

  <img src="{{ "images/postmanSign.jpeg" }}" alt="Authorization"/>
  
**Return parameters** 

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |String |returned if failed，and only error will be returned|
|at |No  |String |acess token，at remains valid for a month（Note:at will be regenerated everytime you login,and one account can’t be used for multiple smartphones.)   |
|rt |No  |String | refresh token，rt stays valid for two months    |
|user     |No  |String | user info    |
|region     |No  |String | region server    |
  
```
error code
400: missing parameters
301：user in another region server,app need to relocate server and reconnect
401: wrong account or password
402：inactivated email
404：account does not exist
406：authorization failed
500：server error
```

 **Response Example**

``` 
{
    "at": "b1d576f797ae86d276d366e7b8772ecbacecc18d",  //signature value to access other interfaces.Valid for a month
    "rt": "436adf6b1f1e5e6fdc6061317b3aca6bcefa45c1",  //when token expires，use this to refresh token.Valid for two months
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

## Request device list
API for accessing device list ``` https://testapi.coolkit.cn:8080/api/user/device?version=8```

Request method： GET

Request Header：
Authorization:Bearer b1d576f797ae86d276d366e7b8772ecbacecc18d('at' retrieved after login，say 'access token')

Content-Type:application/json

Authorization header decription：Bearer+Space+at.For more about signature, please click to check [General developer instructions](instruction_en.html)

**Debug Tool：Postman**

  <img src="{{ "images/postman_deviceList.jpg" }}" alt="Device List"/>


**Return parameters** 

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |Yes  |String |return 'error:0' when success|
|devicelist |No  |Object |Device list   |

```
Important info in Device list：
sharedBy：who the device is shared by（For sharee to check）
sharedTo：To whom the device is shared（For sharer to check）
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

## Access Server Dispatch 
API for server dispatch ``` https://testapi.coolkit.cc:8080/dispatch/app```

Request method： POST

Request Parameters：(appid provided by your salesperson,ts,nonce use your own 'ts' and 'nonce' here)

Click to check request parameters descripion [Server Dispatch](dispatch_en.html)
```{"accept":"ws","version":8,"appid":"I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF","ts":1545219251123,"nonce":"asbsedwq"}```

**Debug Tool：Postman**

<img src="{{ "images/postman_dispatch.jpg" }}" alt="Server Dispatch"/>

**Return parameters：For detailed descripion of Key parameters（through returned IP or access following ‘create connection’API via domain+port），Please click to check [Server Dispatch](dispatch_en.html "Server Dispatch")**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|IP     |Yes  |String | Persistent connection to server IP    |
|port     |Yes  |Int | Persistent connection to server port    |
|domain     |Yes  |String | Persistent connection to server domain.Only app returns domain now.android client should select ip to create persistent connection, so as to reduce issues caused by dns resolution.js client can not skip certificate check, so only domain can be used.  |

## Create Connection 
Create handshake through IP returned by Server Dispatch or domain.Call ```wss://test-pconnect1.coolkit.cc:8080/api/ws```

websocket Test Tool： ```http://www.blue-zero.com/WebSocket/```

<img src="{{ "images/connection.jpg" }}" alt="Connection"/>

See pic above，Connect has been created，receiving data….This means connection has been created successfully.Ready to start handshake.

## Handshake

<img src="{{ "images/useronline.jpg" }}" alt="Handshake"/>

Please click to check parameter description.[Handshake](handshake_en.html)

	Example for handshake：at and apikey are both in returned parameters after login.
        Note: ts should be timestamp to second,otherwise request will fail. 
	Use your own  'at'，'apikey'，'appid'，'nonce'，'sequence'

	{"action":"userOnline","version":8,"ts":1545219251,"at":"351bc7395e03a39fd537db8d6137d6f3d9548568","userAgent":"app","apikey":"a4e77f7e-2116-4215-b961-6f3fc5982667","appid":"I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF","nonce":"asbsedwq","sequence":"1545219251123"}

Response of Handshake success：

	{"error":0,"apikey":"a4e77f7e-2116-4215-b961-6f3fc5982667","config":{"hb":1,"hbInterval":145},"sequence":"1545219251123","socketid":"0298c7fffec9eeca-0000602f-00052b04-c10ec99a40f6e6d4-6739904a"}

hbInterval is hearbeat interval.ping needs to be sent in 145S.Server will respond pong when ping is received.

<img src="{{ "images/ping.jpg" }}" alt="hearbeat"/>

## Send control command

<img src="{{ "images/control.jpg" }}" alt="control command"/>

Example of paramters for control commands.Params vary accoridng to protocols.When business agreement is reached,protocol documentation will be provided based on type of device.Use your own apikey,deviceid,sequence,params
For parameter description, please check [Update/Report Status](deviceStatus_en.html)

	{"action":"update","apikey":"a4e77f7e-2116-4215-b961-6f3fc5982667","deviceid":"100000140e","userAgent":"app","sequence":"1545219251123","params":{"switch":"on"}}

Response for control command：Return error:0 means operation success.For more error codes, please check [Update/Report Status](deviceStatus_en.html)

	{"error":0,"deviceid":"100000140e","apikey":"a4e77f7e-2116-4215-b961-6f3fc5982667","sequence":"1545219251123","socketid":"0298c7fffec9eeca-0000602f-00053240-e2b44b54e6e6afaa-e8a60ede"}

**Note：**

a：If device is shared by other user,you must select apikey returned from device list.If you are device owner,both apikey returned from login and apikey from device list will work.

b：Device must be online.After command is sent, check if device turns on/off accordingly.

Until now, everything went on well, next, please check [API Center](apiOverview_en.html) for how to access Region,Account,Device Management,Device Control and Authorization.

