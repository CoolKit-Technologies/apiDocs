---
title: 分享
last_updated: 2019-03-20
sidebar: mydoc_sidebar
permalink: share.html
folder: mydoc
---

app向服务端发送指令。分享设备给指定用户。分享的设备不能被再次分享。分享时需要被分享方在线，没有接收分享导致超时后，三分钟之后才能再次分享给该用户。用户接收分享后，没有分享时间限制。分享成功后被分享用户也可以控制设备，被分享用户不能进行分享、定时、修改设备名称等操作。

注意：sequence参数为时间戳，精确到毫秒，响应中的sequence参数从请求参数中获取。
- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|apikey |是  |String |用户apikey   |
|deviceid |是  |String | 设备id    |
|action     |是  |String | 值为 share    |
|userAgent     |是  |String | 值为 app    |
|params     |是  |ShareParam |     |
|sequence     |是  |String | 时间戳，精确到毫秒    |
|s_seq     |否  |String | 时间戳，精确到毫秒    |

- ShareParam定义

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|uid |是  |String |用户手机号，中文版客户端直接加上+86，国际版需要用户选择国家或者email   |
|deviceName |是  |String | 设备名称   |
|userName     |是  |String | 用户名称    |
|permit     |否  |Int | 权限值之和，采用位移操作计算，权限值定义如下：1:新增定时器;2:修改定时器;4:删除定时器;8:启用定时器    |
|shareTime     |否  |Long |   GMT标准时间，毫秒数，主要用来在客户端显示排序  |
|note     |是  |String | 分享备注，长度为10个汉字    |

```
1、permit计算规则：
新增权限，例如要给用户赋予 新增、修改、启用定时器的权限
permit=1 | 2 | 8  结果等于11

在当前权限的基础上再新增权限
permit= permit|xxx(具体的权限数值)

2、删除某一个权限，比如当前权限是11（新增、修改、启用定时器），现在删除“修改权限”
     当前permit=11
     permit= permit ^ ( permit & 2)    2代表的是“修改定时器”， 结果等于 9

3、删除多个权限，还是以当前权限值11为例，要删除新增、修改权限
     先计算出要删除的权限的和是多少
     delPermit= 1|2   结果等于3
     然后计算删除后的权限值
     当前permit=11
     permit= permit ^ ( permit & delPermit)
4、查询是否有某个权限，比如当前权限是11（新增、修改、启用定时器）
     当前permit=11
     查询“修改权限”
     boolean isPermit=((permit & 2) == 2)   结果为true
     查询“删除权限”
     boolean isPermit=((permit& 4) == 4)    结果为false

5、查询多个权限，类似删除多个权限，先计算要查询的权限之和，再查询
     当前permit=11
     查询是否有“修改权限”、“启用权限”
     queryPermit = 2|8   结果等于10
     boolean isPermit=((permit & queryPermit) == queryPermit)   结果为true

     查询是否有“修改权限”、“删除权限”
     queryPermit= 2|4   结果等于6
     boolean isPermit=((permit & queryPermit) == queryPermit)   结果为false

     针对网关类设备的说明：
     说明：分享相关的3个指令（分享、修改分享、删除分享）需要增加一个业务分支：
	这3个指令首先要判断设备ui，如果是zigbee等网关设备，那么就要同时要把子设备一起分享、修改、删除给对方。比如：
	网关deviceid: 1000001
	子设备deviceid: 1000002, 1000003

	A用户把网关设备1000001分享给B用户， 那么除了网关的shareUsers下新增了B用户的信息以外，还要在子设备1000002, 1000003的shareUsers下新增B用户的信息。
	子设备的权限与网关的权限保持一致；

	主人如果需要针对某一个子设备给对方设置不一样的权限，可以在app里选中子设备单独进行修改，就像普通的设备一样操作。
```

- 响应参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |状态码   |
|result |否  |Int | 1:手机号不存在;2:用户接受分享;3:用户不接受分享;4:已分享    |
|apikey     |否  |String | 分享方用户的apikey    |
|deviceid     |否  |String | 设备id    |
|sequence     |否  |String | 时间戳，精确到毫秒从请求参数中获取    |

```
状态码
0:ok(操作成功)
400:Bad Request（参数错误）
401:认证不通过
403:Forbidden（无权限）
406:用户在其他设备登录
500:Internal Server Error（服务器内部错误）
504:分享超时（对方没有拒绝也没有同意）
```



