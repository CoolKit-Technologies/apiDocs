---
title: Check Group
sidebar: mydoc_en_sidebar
last_updated: 2019-03-20
permalink: findGroup_en.html
folder: mydoc
layout: page_en
---

Get all the groups the device is in, the time when groups were created, and the indexes of groups.
- Production environment URL: ``` https://cn(区域)-api.coolkit.cn:8080/api/group``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/group``` 

- Request method： GET

- Request method： GET


 **Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |Int | error message returned, no error returned upon success  |
|groupinfos |No  |[GroupInfos] | Group info  |

- GroupInfos description：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|id |Yes  |Sting | Group id  |
|name |Yes  |String | Group name  |
|index |Yes  |Int | Order index,app displays groups based on it.  |
|createdAt |Yes  |Date| time when group was created  |

