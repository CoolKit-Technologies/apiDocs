---
title: 删除设备分组
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: deleteGroup.html
folder: mydoc
---

删除分组后分组下的设备会进入未分组状态。

---

接口地址： https://cn-api.coolkit.cn:8080/api/group

请求方法： delete

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Body：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|id |是  |String | 分组id |
|type |是  |Int | 默认为0 |

**响应参数:**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int | 状态码  |

状态码：

    0：操作成功
    400：参数错误
    401：认证失败
    500：服务器错误
