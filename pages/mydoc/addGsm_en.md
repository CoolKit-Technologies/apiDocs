---
title: Add GSM Device
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: addGsm_en.html
folder: mydoc
layout: page_en
---

Scan QR code to add GSM device.If device has been added before, app will prompt “Device belongs to other user”, delete the device before adding.

Currently,region can not be changed after GSM device is added to registration region(e.g.cn,eu,us,as).This would be updated in future.

- Production environment URL: ``` https://cn(region)-api.coolkit.cn:8080/api/user/device/addGsm``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/user/device/addGsm``` 

- Request method： POST

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|id     |Yes  |String | id，Formula：MD5(deviceid+apikey) Order is unchangeable |
|name |No  |String | Device name |

**Response parameters:**
- Returned upon success

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|device |No  |Object | device info，return upon success  |

- Returned upon failure

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|code |No  |Int | erro code  |
|error |No  |Sting | error description  |

```
1.Device name, id and apikey must not be empty! (parameters incomplete) code：400
2.Invalid device id format! (invalid format for Device id)     code：401
3.Add device failed! (failed to add device)   code：500
4.Device does not exist! (Device does not exist)  code：404
5.Device not belong to this brand! (incorrect brand for device)  code：403
6.Device has already been added!' : 'Device belongs to other user! (Device already added by others)  code：409
7.find brand failed! (Failed to find brand)  code：502
8.find modelInfo failed! (Failed to find product model)  code：503
```

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



