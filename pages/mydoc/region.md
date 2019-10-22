---
title: 查询当前区域
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: region.html
folder: mydoc
---

返回app当前所属的区域。

区域主要作用是让设备就近连接到服务器，拥有更好的设备体验。帐号注册时确定用户所属区域，随之用户下的设备也会连接到用户对应区域的服务器。

比如：用户在cn区域，帐号注册到eu区域，随之设备也会连接到eu区域服务器，有可能会出现设备响应慢。

---

接口地址： https://cn-api.coolkit.cn:8080/api/user/region  
请求方法： get

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Sign+空格+签名值|是|Sign RRyShsd7/ZjfxMZY7qe5M3v99ix2izyBHZGCiHgghIk=|
|Content-Type|application/json|是|application/json|

Params:

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|country_code|String|否|[国家或地区码](http://www.yadexp.com/yadexp/209/d.htm)|
|appid|String|是|APPID|
|nonce|String|是|8位字母数字随机数|
|ts|Int|是|时间戳精确到秒|
|version|Int|是|预设版本|

示例：

```
https://cn-api.coolkit.cn:8080/api/user/region?country_code=86&appid=McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr&nonce=q3wz95p6&ts=1558004249&version=8
```

**响应参数(基础):**

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|error|String|是|正常返回0|
|region|String|是|注册区域|

状态码：暂无

返回示例：

```Json
{
    "region": "cn",   //cn,eu,us,as四个区域
    "error": 0
}
```