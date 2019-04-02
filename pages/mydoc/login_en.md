---
title: Login
last_updated: 2019-03-20
weight: 10
sidebar: mydoc_en_sidebar
permalink: login_en.html
folder: mydoc
layout: page_en
---


- Production environment URL:  ``` https://cn(区域)-api.coolkit.cn:8080/api/user/login``` 

- Test environmentURL: ``` https://testapi.coolkit.cn:8080/api/user/login``` 

- Request method： POST

- Request parameters：Note that ‘email’ and ‘to’ can’t be passed at the same time. ‘email’ is passed for registration with email, while ‘to’ for phone number.

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|email |No  |String |Email.Check if email is activated when login |
|phoneNumber |No  |String | Phone number（Check this first）    |
|password     |Yes  |String | password |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |String | error code,no error returned when success，return error when failed  |
|user |Yes  |Object | user info  |
|at |Yes  |String | Access Token  |
|rt |Yes  |String | Refresh Token  |
|region |Yes  |String | server region of user, such as：China:cn  |

```
Error code：
200:Failed to get authorization token
301:user in another server region,app need to relocate server and reconnect
400:Missing parameter
401:Wrong account or password
402:Email inactivated
404:User does not exist
500:Server error
```

