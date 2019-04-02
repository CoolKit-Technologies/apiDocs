---
title: Change Password
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: updatePassword_en.html
folder: mydoc
layout: page_en
---

For security concerns,no need to verify user identity when changing password through original password.

- Production environment URL:  ``` https://cn(区域)-api.coolkit.cn:8080/api/user/password``` 

- Test environment URL:  ``` https://testapi.coolkit.cn:8080/api/user/password``` 

- Request method： POST

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|oldPassword |Yes  |String |original password  |
|newPassword |Yes  |String | new password    |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |String | error message,return error means failed  |
|message |No  |String | return message mean success  |


