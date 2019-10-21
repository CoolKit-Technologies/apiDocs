---
title:  修改设备名称
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: updateDevice.html
folder: mydoc
---

---

接口地址： https://cn-api.coolkit.cn:8080/api/user/device/{deviceid} 

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
|name     |是  |String | 设备名称 |
|group |是  |String | 传递空字符 |

**响应参数:**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |否  |String | 返回的异常信息。error：0 操作成功  |
|device |是  |Object | 设备信息，成功才返回  |

- 设备信息

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|name |是  |String | 设备名称  |
|type |是  |String | 类型  |
|deviceid |是  |String | 设备id  |
|apikey |是  |String | 用户apikey  |
|extra |是  |Object | 关联表引用信息  |
|onlineTime |是  |String | 设备最后上线时间  |
|ip |是  |String | 设备上线的ip地址  |
|location |是  |String | 设备上线的地方  |
|settings |是  |Object | 设备配置信息  |
|groups |是  | [String] | 设备所属的分组ID，设备可以属于多个分组。如果不属于任何分组，则返回空数组[]  |
|params |是  |Object | 设备参数  |
|online |是  |Boolean | 设备是否在线  |
|createdAt |是  |Date | 设备添加时间  |
|sharedBy |否  |Object | 分享列表,分享方返回  |
|sharedTo |否  |Object | 分享列表，被分享方返回  |
|devicekey |是  |String | 设备apikey  |
|deviceUrl |否  |String | 设备详情界面url  |
|brandName |是  |String | 品牌  |
|productModel |是  |String | 产品型号  |
|showBrand |是  |Boolean | 是否展示品牌和产品型号  |
|uiid |是  | Int | 设备ui的id  |



