---
title: 添加GSM设备
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: addGsm.html
folder: mydoc
---

扫描二维码添加GSM设备，如果设备已经被添加会提示设备已经被添加，需要删除设备后才能添加。

---

接口地址： https://cn-api.coolkit.cn:8080/api/user/device/addGsm 

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Body：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|id     |是  |String | id编码，公式：MD5(deviceid+apikey)注意顺序 |
|apikey     |是  |String | 设备apikey |
|name |否  |String | 设备名称 |

**响应参数:**
- 成功返回

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|device |否  |Object | 设备信息，成功才返回  |

- 失败返回

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|code |否  |Int | 错误代码  |
|error |否  |Sting | 错误描述  |

```
1.Device name, id and apikey must not be empty! (传递的参数不完整) code：400
2.Invalid device id format! (设备id不符合规范)     code：401
3.Add device failed! (添加设备失败)   code：500
4.Device does not exist! (设备不存在)  code：404
5.Device not belong to this brand! (设备不属于该品牌)  code：403
6.Device has already been added!' : 'Device belongs to other user! (设备已经被添加)  code：409
7.find brand failed! (查找品牌失败 ps：设备列表展现字段)  code：502
8.find modelInfo failed! (查找产品型号失败 ps：设备列表展现字段)  code：503
```

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



