---
title: Register
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: register_en.html
folder: mydoc
layout: page_en
---

 
- Production environment URL:  ``` https://cn(region)-api.coolkit.cn:8080/api/user/register``` 

- Test environmentURL:  ``` https://testapi.coolkit.cn:8080/api/user/register``` 

- Request method： POST

- Request parameters：Note that 'email' and 'to' can’t be passed at the same time. 'email' is passed for registration with email, while 'to'c for phone number.

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|email |No  |String |Email，interface will check whether phone number is passed.Phone number will be used for registration if there is any, otherwise email.If neither is passed, return error  |
|phoneNumber |No  |String | phone number （This will be checked first）    |
|verificationCode     |Yes  |String | SMS verfication code  |
|password     |Yes  |String | password |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |String | error code，error returned if failed，no error returned if success |
|jwt |Yes  |String | authorization for AP mode |
|user |Yes  |Object | user info  |
|at |Yes  |String | Access Token  |
|rt |Yes  |String | Refresh Token  |
|region |Yes  |String | server region of user, such as：China:cn |

```
Error code：
409:Account already registered
498:Wrong verification code
500:Server error
```

