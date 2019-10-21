---
title: Cancel Share
sidebar: mydoc_en_sidebar
last_updated: 2019-03-20
permalink: shareCancel_en.html
folder: mydoc
layout: page_en
---

After sharer cancels the share, device will be deleted from sharee’s account.Sharee can no longer control the device.

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|apikey |Yes  |String |user apikey  |
|deviceid |Yes  |String | device id    |
|action     |Yes  |String | value is cancelShare    |
|userAgent     |Yes  |String | value is app    |
|params     |Yes  |ShareParam |     |
|sequence     |Yes  |String | timestamp to millisecond   |

- ShareParam Definitions

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|uid |Yes  |String |user account,add +86 to accounts of users in China, user in other regions or countries need to select country or email   |
|deviceName |Yes  |String | Device Name   |

- Response parameters

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |Yes  |Int |always return success except for Internal error   |
|sequence     |Yes  |String | obtained from request parameters   |




