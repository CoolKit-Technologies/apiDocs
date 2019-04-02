---
title: Add device to Group
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: addToGroup_en.html
folder: mydoc
layout: page_en
---

Add device to a group.One device can be in multiple groups.By default, device will be add to a new group, while optional to cover current group. If target group id is empty,device will be removed from current group.

- Production environment URL: ``` https://cn(区域)-api.coolkit.cn:8080/api/group/addDevice``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/group/addDevice``` 

- Request method： POST

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|deviceinfos |Yes  |[device] | Device array |

- device description：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|source_id |Yes  |String | source group id, can be empty "" |
|target_id |Yes  |String | target group id, can be empty “”.When empty,device will be removed from source group. |
|deviceid |Yes  |String | Device id |
|type |No  |Int | 0: add to new group（default） 1：cover current group |

```	
Devices in different groups can be moved simultanesouly,through array ojbects, json example：
[
   {
      "source_id":"Group1",
      "target_id":"Group2",
      "deviceid":"1000000b01",
      "type":0
   },
   {
      "source_id":"Group1",
      "target_id":"Group2",
      "deviceid":"1000000b02",
      "type":0
   },
   {
      "source_id":"Group3",
      "target_id":"Group2",
      "deviceid":"1000000b03",
      "type":1
   }
]
type description：
For example,Device 1000000b01 are in two groups, see in devices list as below：
"groups":["111","222"]     Real group id should be 32-digit uuid,simplified for reference
API received in request data, souce id is 111,and targe id is 333.
If type=0，result in database will be：
"groups":["333","222"]     Original group 111 was replaced with 333,222 is kept
If type=1 , then result will be：
"groups":["333"]   regardless how many groups device has, only the new one is kept.
```

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |Yes  |Int | error code  |

```
error code
0:success
400:wrong parameter
401:authorization failed
500:server error
```

