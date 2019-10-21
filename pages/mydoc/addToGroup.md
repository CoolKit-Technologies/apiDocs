---
title: 添加设备到分组
last_updated: 2019-10-21
sidebar: mydoc_sidebar
permalink: addToGroup.html
folder: mydoc
---

给设备进行分组，支持设备在多个分组内。默认是新增分组，也可以选择覆盖分组。如果目标分组id为空，则表示把设备从分组中移出。


---

接口地址： https://cn-api.coolkit.cn:8080/api/group/addDevice

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Parmas：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|deviceinfos |是  |[device] | 设备数组 |
|apikey |是  |String | 用户apikey  |
|groupType |是  |Int | 分组：0  |

- device说明：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|source_id |是  |String | 原分组id，可以为空”” |
|target_id |是  |String | 目标分组的id，可以为空””。为空“”则把设备从分组中移除 |
|deviceid |是  |String | 设备id |
|type |否  |Int | 0:    新增分组（默认）  1：覆盖分组 |

```	
本接口支持多个不同分组的设备，移动到不同的分组，采用数组对象的方式实现，json例子：
[
   {
      "source_id":"分组1",
      "target_id":"分组2",
      "deviceid":"1000000b01",
      "type":0
   },
   {
      "source_id":"分组1",
      "target_id":"分组2",
      "deviceid":"1000000b02",
      "type":0
   },
   {
      "source_id":"分组3",
      "target_id":"分组2",
      "deviceid":"1000000b03",
      "type":1
   }
]
type字段说明：
比如设备1000000b01 原本有2个分组，在devices表字段如下：
"groups":["111","222"]          实际上分组id应该是36位uuid，这里为了清晰简化了
接口收到请求数据中，源分组id是111 ，目标分组id是333，

如果type=0，那么数据库结果就是：
"groups":["333","222"]     也就是说将原来的组111改成333，222保留

如果type=1 , 那么数据库结果就是：
"groups":["333"]   也就是说不管原来设备有几个分组，现在只保留最新这一个
```

**响应参数:**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int | 状态码  |

状态码：

    0：操作成功
    400：参数错误
    401：认证失败
    500：服务器错误