---
title: 查询设备分组
sidebar: mydoc_sidebar
last_updated: 2019-10-21
permalink: findGroup.html
folder: mydoc
---

获取设备所在的所有分组，以及分组的创建时间，分组的排序编号。

---

接口地址： https://cn-api.coolkit.cn:8080/api/group

请求方法： get

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Params：

|参数名|必选|类型|说明|
|apikey |是  |String | 用户apikey  |
|groupType |是  |Int | 分组：0  |

 **响应参数:**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |否  |Int | 返回的异常信息,成功不返回error  |
|groupinfos |否  |Object | 分组信息  |

- GroupInfos说明：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|id |是  |Sting | 分组id  |
|name |是  |String | 分组名称  |
|index |是  |Int | 排序编号，客户端根据它决定显示顺序  |
|createdAt |是  |Date| 分组创建时间  |

