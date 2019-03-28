---
title: API总览
last_updated: 2019-03-20
sidebar: mydoc_sidebar
permalink: apiOverview.html
folder: mydoc
---

API中心提供用户帐号信息管理，提供注册以及修改密码等服务。

设备管理包括设备的添加，设备分组等设备信息服务。

设备控制提供对设备开关，颜色，色温，亮度的调整，设备的分享以及设备定时器的设置。

## 区域功能

|接口资源|接口功能说明|接口详细文档|
|:----   |:----- |-----   |
|Region |获取当前区域 |[api/user/region](region.html)  |

## 帐号管理功能

|接口资源|接口功能说明|接口详细文档|
|:----   |:----- |-----   |
|验证码 |注册，重置密码，找回密码获取验证码 |[api/sms](code.html)  |
|注册 |注册APP帐号 |[api/user/register](register.html)  |
|找回密码 |忘记密码的情况下，通过注册的帐号接收验证码，重新设置密码 |[/api/user/password/reset](findpassword.html)  |
|修改密码 |出于帐号安全，通过原来的密码设置帐号新密码，不需要通过验证码方式校验 |[/api/user/password](updatePassword.html)  |
|登录 |登录APP |[api/user/login](login.html)  |
|token刷新 |aceess token失效时，可通过refresh token重新获取token |[api/user/refresh](token.html)  |

## 设备管理功能

|接口资源|接口功能说明|接口详细文档|
|:----   |:----- |-----   |
|设备列表 |或者帐号下添加的所有设备，包括分享给用户的设备 |[api/user/device](devices.html)  |
|单个设备查询 |通过设备id，查询单个设备信息 |[api/user/device/:deviceid](device.html)  |
|添加设备 |设备添加到用户帐号下 |[api/user/device/add](addDevice.html)  |
|删除设备 |设备从用户帐号下移除 |[api/user/device/:deviceid](deleteDevice.html)  |
|修改设备名称 |给设备重新命名 |[api/user/device/:deviceid](updateDevice.html)  |
|增加GSM设备 |添加GSM设备 |[api/user/device/addGsm](addGsm.html)  |
|增加设备分组 |管理设备的分组 |[api/group](addDeviceGroup.html)  |
|修改设备分组 |修改分组名称，app上展示的顺序 |[api/group](updateGroup.html)  |
|删除设备分组 |1,删除分组 2,删除分组以及分组下的设备|[api/group](deleteGroup.html)  |
|添加设备到分组 |给设备划分分组 |[api/group/addDevice](addToGroup.html)  |
|查询设备分组 |获取设备所有分组信息 |[api/group](findGroup.html)  |

## 设备控制功能
- WebSocket接口
说明除了分配服务外，其他为WebSocket接口。

|接口资源|接口功能说明|接口详细文档|
|:----   |:----- |-----   |
|分配服务 |获取长连接信息 |[dispatch/app](dispatch.html)  |
|握手 |实现连接建立时的认证，客户端上报环境数据，服务器返回配置数据 |[握手](handshake.html)  |
|设备上线/离线 |服务端检测到设备上线或者下线以后，会向app发送通知指令。该指令app端是被动接收，不需要主动发送 |[设备上线/离线](online.html)  |
|更新/上报状态 |更改设备状态。比如：开关，颜色，亮度，色温以及设置各类定时器 |[更新/上报状态](deviceStatus.html)  |
|设备状态查询 |设备端和app向服务器发送该指令，查询设备状态或者参数。比如：设备开关状态，是否设置定时器等 |[设备状态查询](findStatus.html)  |
|分享 |分享设备给其他用户，实现一个设备多人可以控制的场景 |[分享](share.html)  |
|修改分享 |修改设备分享的控制或者数据权限等 |[修改分享](shareUpdate.html)  |
|撤销分享 |收回分享的设备控制权限|[撤销分享](shareCancel.html)  |

- HTTP接口

|接口资源|接口功能说明|接口详细文档|
|:----   |:----- |-----   |
|查询设备状态 |设备端和app向服务器发送该指令，查询设备状态或者参数。比如：设备开关状态，是否设置定时器等 |[api/user/device/status](deviceStatusHttp.html)  |
|更新设备状态 |更改设备状态。比如：开关，颜色，亮度，色温以及设置各类定时器 |[api/user/device/status](updateStatusHttp.html)  |



