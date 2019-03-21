---
title: 修改分享
sidebar: mydoc_sidebar
permalink: shareUpdate.html
last_updated: 2019-03-20
folder: mydoc
---

app向服务端发送指令，修改被分享方对定时器的控制权限。将来也可以扩展修改其他属性，比如uid、deviceName等

- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|apikey |是  |String |用户apikey   |
|deviceid |是  |String | 设备id    |
|action     |是  |String | 值为 updateShare    |
|userAgent     |是  |String | 值为 app    |
|params     |是  |ShareParam |     |
|sequence     |是  |String | 时间戳，精确到毫秒    |

- ShareParam定义

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|uid |是  |String |用户手机号，中文版客户端直接加上+86，国际版需要用户选择国家或者email   |
|deviceName |是  |String | 设备名称   |
|permit     |否  |Int | 权限值之和，采用位移操作计算，权限值定义如下：1:新增定时器;2:修改定时器;4:删除定时器;8:启用定时器    |
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
```

- 响应参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |错误码   |
|result |否  |Int | 0:不是分享用户;1:用户不存在;2:修改成功;3 修改失败    |
|apikey     |否  |string | 用户的apikey    |
|deviceid     |否  |string | 设备id    |
|sequence     |否  |string | 时间戳，精确到毫秒。从请求参数中获取    |

```
错误码
0: ok(操作成功)
400: Bad Request（参数错误）
401:认证不通过
403:Forbidden（无权限）
406:用户在其他设备登录
500:Internal Server Error（服务器内部错误）
```


