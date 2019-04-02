---
title:  Change Device Name
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: updateDevice_en.html
folder: mydoc
layout: page_en
---


- Production environment URL: ``` https://cn(区域)-api.coolkit.cn:8080/api/user/device/:deviceid``` 

- Note:( :deviceid is a parameter)

- Request example：``` https://cn-api.coolkit.cn:8080/api/user/device/100070b402``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/user/device/:deviceid``` 

- Request method： POST

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|name     |Yes  |String | Device name |
|group |Yes  |String | null can be passed |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |String | error message returned.error：0 operation succeeded  |
|device |Yes  |Object | Device info,returned upon success  |

- Device info

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|name |Yes  |String | Device name  |
|type |Yes  |String | Type  |
|deviceid |Yes  |String | Device id  |
|apikey |Yes  |String | User apikey  |
|extra |Yes  |Object | Reference to associated tables  |
|onlineTime |Yes  |String | Last Time when device was online  |
|ip |Yes  |String | Device IP  |
|location |Yes  |String | Device location  |
|settings |Yes  |Object | Device Settings  |
|groups |Yes  | [String] | Group ID for groups device belongs to.One device can belong to multiple group.If device not in group,returns empty array[]  |
|params |Yes  |Object | Group ID for groups device belongs to.One device can belong to multiple group.If device not in group,returns empty array[]  |
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



