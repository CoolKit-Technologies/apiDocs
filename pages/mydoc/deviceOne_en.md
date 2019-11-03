---
title: Check Device
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: device_en.html
layout: page_en
---

Check Device info by Device id
- Production environment URL: ``` https://cn(区域)-api.coolkit.cn:8080/api/user/device/:deviceid``` 

- Note:( :deviceid is a parameter)
- Request example：``` https://{区域}-api.coolkit.cc:8080/api/user/device/100070b402``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/user/device/:deviceid``` 

- Request method： GET

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|deviceid     |Yes  |String | Device id |
|lang |No  |String | Language(cn,eu,us) |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |String | Returned error message.error：0 Operation succeeded  |
|device |Yes  |Object | Device info, returned upon success  |

- Device Info

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
|settings |Yes  |Object | Device Settings  |
|groups |Yes  | [String] | Group ID for groups device belongs to.One device can belong to multiple group.If device not in group,returns empty array[] |
|params |Yes  |Object | Device parameters  |
|online |Yes  |Boolean | Device online or not  |
|createdAt |Yes  |Date | When device was added  |
|sharedBy |No  |Object | To whom device is shared, returned to Sharee  |
|sharedTo |No  |Object | By whom device is shared,returned to Sharer  |
|devicekey |Yes  |String | Device apikey  |
|deviceUrl |No  |String | Url of device detail page  |
|brandName |Yes  |String | Brand  |
|productModel |Yes  |String | Product model  |
|showBrand |Yes  |Boolean | Display brand and product model or not  |
|uiid |Yes  | Int | id of device ui  |



