---
title: API Overview
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: apiOverview_en.html
folder: mydoc
layout: page_en
---

API center gives access to user account management, registration,changing password,etc.

Device management includes adding device, grouping device, etc.

Device control allows to turn on/off devices, adjust color, color temperature,and brightness, share devices, set up timers on devices, etc.


## User Region

|API|Description|Documentation|
|:----   |:----- |-----   |
|Region |Get current region |[api/user/region](region_en.html)  |

## Account Management

|API|Description|Documentation|
|:----   |:----- |-----   |
|Verification code |Get verification code to register or reset password |[api/sms](code_en.html)  |
|Register |Reiger APP account |[api/user/register](register_en.html)  |
|Reset password |Reset password with verification code sent to account email or phone number. |[/api/user/password/reset](findpassword_en.html)  |
|Change password |Change password by old password |[/api/user/password](updatePassword_en.html)  |
|Login |Login APP |[api/user/login](login_en.html)  |
|token Refresh |When access token expires，refresh tocken to get new token |[api/user/refresh](token_en.html)  |

## Device Management

|API|Description|Documentation|
|:----   |:----- |-----   |
|Device List |Get all devices in account, including devices shared by others |[api/user/device](devices_en.html)  |
|Check Device |Check device info by Device ID |[api/user/device/:deviceid](device_en.html)  |
|Add Device |Add device to user account |[api/user/device/add](addDevice_en.html)  |
|Delete Device |Delete device from user account |[api/user/device/:deviceid](deleteDevice_en.html)  |
|Change Device Name |Change name of device |[api/user/device/:deviceid](updateDevice_en.html)  |
|ADD GSM Device |Scan QR code to add GSM device |[api/user/device/addGsm](addGsm_en.html)  |
|Add Group |Manage the groups of devices |[api/group](addDeviceGroup_en.html)  |
|Change Group |Change name of group and its order in app |[api/group](updateGroup_en.html)  |
|Delete Group |1,Delete group 2,Delete group and devices in this group|[api/group](deleteGroup_en.html)  |
|Add Device to Group |Add device to a group |[api/group/addDevice](addToGroup_en.html)  |
|Check Group |Get complete group info of device |[api/group](findGroup_en.html)  |

## Device Control
- WebSocket Protocol
All API in table below uses WebSocket except for Server Dispatch.

|API|Description|Documentation|
|:----   |:----- |-----   |
|Server Dispatch |Get info for persistent connection |[dispatch/app](dispatch_en.html)  |
|Handshake |Complete authorization when creating connection,client report environment data,server returns configuration data |[Handshake](handshake_en.html)  |
|Device Online/Offline |When server end detects device going online or offline, app will be notified of the update.Such notification is sent by server automatically. No need to request from app. |[Device Online/Offline](online_en.html)  |
|Update/Report Status |Change device status,such as turn on/off device,change color, brightness,color temperature and setting all kinds of timers |[Update/Report Status](deviceStatus_en.html)  |
|Check Device Status |Device and app send this command to server, to check device status or parameters, such as device on/off, whether any timer is set and so on. |[Check Device Status](findStatus_en.html)  |
|Share Device |Share device with other user,allowing one device under control of multiple users |[Share](share_en.html)  |
|Update Share |Update share or permissions |[Change Share](shareUpdate_en.html)  |
|Cancel Share |Cancel share|[Cancel Share](shareCancel_en.html)  |

- HTTP Protocol

|API|Description|Documentation|
|:----   |:----- |-----   |
|Check Device Status |Device and app send this command to server, to check device status or parameters, such as device on/off, whether any timer is set and so on. |[api/user/device/status](deviceStatusHttp_en.html)  |
|Update Device Status |Change device status, such as on/off, color,brightness,color temperature,and setting all kinds of timers. |[api/user/device/status](updateStatusHttp_en.html)  |



