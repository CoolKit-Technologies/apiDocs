---
title: Delete Device
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: deleteDevice_en.html
folder: mydoc
layout: page_en
---

Delete device in account.Device will be offline thereafter.
- Production environment URL: ``` https://cn(region)-api.coolkit.cn:8080/api/user/device/:deviceid``` 
- Note:( :deviceid is a parameter)
- Request example：``` https://{区域}-api.coolkit.cc:8080/api/user/device/100070b402``` 
- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/user/device/:deviceid``` 

- Request method：DELETE

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|deviceid     |Yes  |String | Device id |
|subDeviceId |No  |String | When isSub:1， subDeviceId is required |
|isSub |No  |String | Sub device or not 0：No 1：Yes |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|device |Yes  |Object | Device info, returned upon success  |

- 设备信息

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
|groups |Yes  | [String] | Group ID for groups device belongs to.One device can belong to multiple group.If device not in group,returns empty array[]  |
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



