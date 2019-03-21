---
title: 查询当前区域
last_updated: 2019-03-20
sidebar: mydoc_sidebar
permalink: region.html
folder: mydoc
---

    
 返回app当前所属的区域。区域主要作用是让设备就近连接到服务器，拥有更好的设备体验。帐号注册时确定用户所属区域，随之用户下的设备也会连接到用户对应区域的服务器。
 比如：用户在cn区域，帐号注册到eu区域，随之设备也会连接到eu区域服务器，有可能会出现设备响应慢。

- 现网环境URL： ``` https://api.coolkit.cn:8080/api/user/region ```

- 测试环境URL： ``` https://testapi.coolkit.cn:8080/api/user/region ```   不需要使用region功能

  
**请求方式：**
- GET 

**参数：** 

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|country_code |否  |String |国家代码   |
|ts |是  |Int | 时间戳到秒    |
|nonce     |是  |String | 32位随机整型16进制字符表示，即8位字母数字随机值    |

 **返回示例**

``` 
{
    "requestid": "1543229049906-asbsedwq",
    "region": "cn",   //cn,eu,us,as四个区域
    "error": 0
}
```



