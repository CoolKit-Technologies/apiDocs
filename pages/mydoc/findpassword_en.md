---
title: Reset password
permalink: findpassword_en.html
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
folder: mydoc
layout: page_en
---


When user forgets password,reset password by verification code through account email or phone number.
- Production environment URL:``` https://cn(区域)-api.coolkit.cn:8080/api/user/password/reset``` 

- Test environmentURL:``` https://testapi.coolkit.cn:8080/api/user/password/reset``` 

- Request method： POST

- Request parameters：Note that ‘email’ and ‘to’ can’t be passed at the same time. ‘email’ is passed for registration with email, while ‘to’ for phone number.

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|email |No  |String |Email. When phone number is empty,email will be used to reset password.  |
|phoneNumber |No  |String | Phone number （Check this first）    |
|verificationCode     |Yes  |String | SMS verification code  |
|password     |Yes  |String | password |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |String | error code  |
|jwt |Yes  |String | authorization for AP mode  |
|user |Yes  |Object | user info  |
|at |Yes  |String | Access Token  |
|rt |Yes  |String | Refresh Token  |
|region |Yes  |String | server region of user, such as：China:cn  |

```
error code：
409:Account already registered
498:wrong verification code
500:server error
```

