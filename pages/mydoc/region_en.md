---
title: Check current region
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: region_en.html
folder: mydoc
layout: page_en
---

    
 Returns the region where the app is now.Regions allow users to connect to nearest server and have a better device experience. User server region is assigned during registration.Devices in the account will connect to the server of assigned region.

For example：User is in cn region, but account was created in eu region.Devices in this account will connect to eu server, causing slow response on device.

- Production environment URL： ``` https://api.coolkit.cn:8080/api/user/region ```

- Test environment URL： ``` https://testapi.coolkit.cn:8080/api/user/region ```   No need to use Region here

  
**Request method：**
- GET 

**Parameters：** 

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|country_code |No  |String |Country code   |
|ts |Yes  |Int | Timestamp to second    |
|nonce     |Yes  |String | 32-digit random integer in hexadecimal，say 8-digit random value of letters and numbers    |

 **Return example**

``` 
{
    "requestid": "1543229049906-asbsedwq",
    "region": "cn",   //cn,eu,us,as  Four regions
    "error": 0
}
```



