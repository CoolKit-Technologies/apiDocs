---
title: Change Group
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: updateGroup_en.html
folder: mydoc
layout: page_en
---

Change group order and group name.
- Production environment URL: ``` https://cn(region)-api.coolkit.cn:8080/api/group``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/group``` 

- Request method： PUT

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|id |Yes  |String | Group id |
|name |No  |String | Group name |
|index |No  |Int | User can change group order |

**响应参数：**

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
