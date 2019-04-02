---
title: Verification code
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: code_en.html
folder: mydoc
layout: page_en
---

 As a security verification method, verification code is sent to the email or phone number user input to register and reset password.

- Production environment URL:  ``` https://cn(region)-api.coolkit.cn:8080/api/sms``` 

- Test environment URL:  ``` https://testapi.coolkit.cn:8080/api/sms``` 

- Request method： POST

- Request parameters：Note that 'email' and 'to' can’t be passed at the same time. 'email' is passed for Email registration, while 'to' for phone number.

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|sendType |Yes  |String |Send Type：sendType:0 Register ：Verification code will be sent as long as phone number or email is valid and unregistered. Code will not be sent to registered account. sendType:1 Reset password：Check if phone number or email is used in user list. Verification code will not be sent to inexistent account and app should prompt “user does not exist” error,to avoid user typo.   |
|email |No  |String | Email address(either email or to will be passed，not both)   |
|to     |No  |String | User phone number with country code.Format: +8615815725225 (+86 China)   |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |Yes  |String | error code  |
|region |No  |String | error：Region server code of user in case of 301，such as：China(cn)   |

```
Error code：
0:Success
301:user in another server region,app need to relocate server and reconnect
400:Wrong parameters
401:User does not exist
409:Account already registered
500:Server error
504:Failed to send
160038:Sending too soon,exceeds frequency limit
```
