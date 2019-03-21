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
|Region |获取当前区域 |[api/user/region](https://www.showdoc.cc/coolkit?page_id=1201741327551474 "api/user/region")  |

## 帐号管理功能

|接口资源|接口功能说明|接口详细文档|
|:----   |:----- |-----   |
|验证码 |注册，重置密码，找回密码获取验证码 |[api/sms](https://www.showdoc.cc/coolkit?page_id=1201889758554755 "api/sms")  |
|注册 |注册APP帐号 |[api/user/register](https://www.showdoc.cc/coolkit?page_id=1201981282383906 "api/user/register")  |
|找回密码 |忘记密码的情况下，通过注册的帐号接收验证码，重新设置密码 |[/api/user/password/reset](https://www.showdoc.cc/coolkit?page_id=1201995399162773 "/api/user/password/reset")  |
|重置密码 |出于帐号安全，通过原来的密码设置帐号新密码，不需要通过验证码方式校验 |[/api/user/password](https://www.showdoc.cc/coolkit?page_id=1335451415606976 "/api/user/password")  |
|登录 |登录APP |[api/user/login](https://www.showdoc.cc/coolkit?page_id=1202011736886956 "api/user/login")  |
|token刷新 |aceess token失效时，可通过refresh token重新获取token |[api/user/refresh](https://www.showdoc.cc/coolkit?page_id=1251109658173327 "api/user/refresh")  |

## 设备管理功能

|接口资源|接口功能说明|接口详细文档|
|:----   |:----- |-----   |
|设备列表 |或者帐号下添加的所有设备，包括分享给用户的设备 |[api/user/device](https://www.showdoc.cc/coolkit?page_id=1202019570403450 "api/user/device")  |
|单个设备查询 |通过设备id，查询单个设备信息 |[api/user/device/:deviceid](https://www.showdoc.cc/coolkit?page_id=1202152606940996 "api/user/device/:deviceid")  |
|添加设备 |设备添加到用户帐号下 |[api/user/device/add](https://www.showdoc.cc/coolkit?page_id=1246248393232848 "api/user/device/add")  |
|删除设备 |设备从用户帐号下移除 |[api/user/device/:deviceid](https://www.showdoc.cc/coolkit?page_id=1246573582219825 "api/user/device/:deviceid")  |
|增加GSM设备 |扫描二维码添加GSM设备 |[api/user/device/addGsm](https://www.showdoc.cc/coolkit?page_id=1246621644554862 "api/user/device/addGsm")  |
|增加设备分组 |管理设备的分组 |[api/group](https://www.showdoc.cc/coolkit?page_id=1246683492161675 "api/group")  |
|修改设备分组 |修改分组名称，app上展示的顺序 |[api/group](https://www.showdoc.cc/coolkit?page_id=1247472314877360 "api/group")  |
|删除设备分组 |1,删除分组 2,删除分组以及分组下的设备|[api/group](https://www.showdoc.cc/coolkit?page_id=1247498963128566 "api/group")  |
|添加设备到分组 |给设备划分分组 |[api/group/addDevice](https://www.showdoc.cc/coolkit?page_id=1247549246387719 "api/group/addDevice")  |
|查询设备分组 |获取设备所有分组信息 |[api/group](https://www.showdoc.cc/coolkit?page_id=1247642428646484 "api/group")  |

## 设备控制功能
- WebSocket接口
说明除了分配服务外，其他为WebSocket接口。

|接口资源|接口功能说明|接口详细文档|
|:----   |:----- |-----   |
|分配服务 |获取长连接信息 |[dispatch/app](https://www.showdoc.cc/coolkit?page_id=1202173029627789 "dispatch/app")  |
|握手 |实现连接建立时的认证，客户端上报环境数据，服务器返回配置数据 |[握手](https://www.showdoc.cc/coolkit?page_id=1202174857250681 "握手")  |
|设备上线/离线 |服务端检测到设备上线或者下线以后，会向app发送通知指令。该指令app端是被动接收，不需要主动发送 |[设备上线/离线](https://www.showdoc.cc/coolkit?page_id=1202174964396364 "设备上线/离线")  |
|更新/上报状态 |更改设备状态。比如：开关，颜色，亮度，色温以及设置各类定时器 |[更新/上报状态](https://www.showdoc.cc/coolkit?page_id=1202175854299191 "更新/上报状态")  |
|设备状态查询 |设备端和app向服务器发送该指令，查询设备状态或者参数。比如：设备开关状态，是否设置定时器等 |[设备状态查询](https://www.showdoc.cc/coolkit?page_id=1202188439794615 "设备状态查询")  |
|分享 |分享设备给其他用户，实现一个设备多人可以控制的场景 |[分享](https://www.showdoc.cc/coolkit?page_id=1202189190913987 "分享")  |
|修改分享 |修改设备分享的控制或者数据权限等 |[修改分享](https://www.showdoc.cc/coolkit?page_id=1251137151306076 "修改分享")  |
|撤销分享 |收回分享的设备控制权限|[撤销分享](https://www.showdoc.cc/coolkit?page_id=1251227410217597 "撤销分享")  |

- HTTP接口

|接口资源|接口功能说明|接口详细文档|
|:----   |:----- |-----   |
|查询设备状态 |设备端和app向服务器发送该指令，查询设备状态或者参数。比如：设备开关状态，是否设置定时器等 |[api/user/device/status](https://www.showdoc.cc/coolkit?page_id=1202190144776500 "api/user/device/status")  |
|更新设备状态 |更改设备状态。比如：开关，颜色，亮度，色温以及设置各类定时器 |[api/user/device/status](https://www.showdoc.cc/coolkit?page_id=1202190743141696 "api/user/device/status")  |



