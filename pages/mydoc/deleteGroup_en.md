---
title: Delete Group
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: deleteGroup_en.html
folder: mydoc
layout: page_en
---

There are two ways of deleting groups.One is to delete group only and the other is to delete group with devices in group.
- Production environment URL: ``` https://cn(region)-api.coolkit.cn:8080/api/group``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/group``` 

- Request method： DELETE

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|id |Yes  |String | Group id |
|type |Yes  |Int | 0：Delete group only 1：Delete group with devices in group |

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
