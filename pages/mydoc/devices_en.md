---
title: Device List
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: devices_en.html
folder: mydoc
layout: page_en
---

Returns info of all devices in user account including devices shared by others.
- Production environment URL: ``` https://cn(区域)-api.coolkit.cn:8080/api/user/device``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/user/device``` 

- Request method： GET

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|lang |No  |String | cn Response returns info in Chinese.en Response returns info in English. |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |string | Returned error message. error：0 Operation succeeded  |
|devicelist |Yes  |[Object] | List of Device info, returned when success  |

- Device Info List

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|name |Yes  |String | Device name  |
|type |Yes  |String | Type  |
|deviceid |Yes  |String | Device id  |
|apikey |Yes  |String | User apikey  |
|extra |Yes  |Object | Reference to associated tables  |
|onlineTime |Yes  |String | Last Time when device was online  |
|ip |Yes  |String | ip address of device  |
|location |Yes  |String | Device location  |
|settings |Yes  |Object | Device settings  |
|groups |Yes  | [String] | Group ID for groups device belongs to.One device can belong to multiple group.If device not in group,returns empty array[]  |
|params |Yes  |Object | Device parameters  |
|online |Yes  |Boolean | Device online or not  |
|createdAt |Yes  |Date | When device was added  |
|sharedBy |No  |Object | To Whom device is shared  |
|devicekey |Yes  |String | Device apikey  |
|deviceUrl |No  |String | Url of device detail page  |
|brandName |Yes  |String | Brand  |
|productModel |Yes  |String | Product model  |
|showBrand |Yes  |Boolean | Display brand and product model or not  |
|uiid |Yes  | Int | id of device ui  |



