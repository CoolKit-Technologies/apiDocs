---
title: Add Device
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: addDevice_en.html
folder: mydoc
layout: page_en
---

Add device to user account, returning the data of successfully added device.
- Production environment URL: ``` https://cn(region)-api.coolkit.cn:8080/api/user/device/add``` 

- Test environment URL:  ``` https://testapi.coolkit.cn:8080/api/user/device/add``` 

- Request method： POST

- Request parameters： For the process of getting data, please check [Pairing process Click to check](pair_en.html)

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|deviceid     |Yes  |String | Device id |
|apikey     |Yes  |String | Device apikey |
|name |No  |String | Device name |
|subDeviceId |No  |String | When isSub:1， subDeviceId is required |
|isSub |No  |String | Sub device or not 0：No 1：Yes |
|chipid |No |String | Device chip id |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|code |No  |Int | code  |
|error |No  |String | error message returned  |
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
|ip |Yes  |String | ip address of device  |
|location |Yes  |String | Device location  |
|settings |Yes  |Object | Device settings  |
|groups |Yes  | [String] | Group id of groups device belongs to.One device can belong to multiple group.If device not in group,returns empty array[]  |
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



