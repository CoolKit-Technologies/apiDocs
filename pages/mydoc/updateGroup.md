---
title: 修改设备分组
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: updateGroup.html
folder: mydoc
---

支持修改分组顺序以及分组名称。

---

接口地址： https://cn-api.coolkit.cn:8080/api/group

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Parmas：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|id |是  |String | 分组id |
|name |否  |String | 分组名称 |
|index |否  |Int | 用户可以修改分组顺序 |
|apikey |是  |String | 用户apikey  |
|groupType |是  |Int | 分组：0  |

**响应参数:**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int | 状态码  |

状态码：

    0：操作成功
    400：参数错误
    401：认证失败
    500：服务器错误