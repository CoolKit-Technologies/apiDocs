---
title: Add Group
sidebar: mydoc_en_sidebar
permalink: addDeviceGroup_en.html
last_updated: 2019-03-20
folder: mydoc
layout: page_en
---


Add a group, and order the group.
- Production environment URL: ``` https://cn(region)-api.coolkit.cn:8080/api/group``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/group``` 

- Request method： POST

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|name |Yes  |String | Group name |
|index |No  |Int | Specify the position of group.By default,group will be added to the end |

```
index example，a user has groups as such：
Group xx      index: 1
Group yy      index: 2
Group zz       index: 3
Add a new group now：  Group aaa   index: 2,Then the result is like this
Group xx      index: 1
Group aaa    index: 2
Group yy      index: 3   original index plus 1
Group zz       index: 4  original index plus 1
If index defaults or its value is 0,index will be max value plus 1.
```

**Response parameters:**

Response parameters:
|:----    |:---|:----- |-----   |
|error |Yes  |Int | error code  |
|groupid |Yes  |Sting | return array of id  |

```
error code
0:success
400:wrong parameter
401:authorization failed
500:server error
```



