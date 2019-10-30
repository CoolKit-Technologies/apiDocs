---
title: 添加设备分组
sidebar: mydoc_sidebar
permalink: addDeviceGroup.html
last_updated: 2019-10-21
folder: mydoc
---

设备分组，同时支持分组排序。

---

接口地址： https://cn-api.coolkit.cn:8080/api/group 

请求方法： post

**请求参数：**

Headers：

|名称|参数值|是否必须|示例|
:-: | :-: | :-: | :-: | :-:
|Authorization|Bearer+空格+at|是|Bearer 174e8af6f5f10183647a6a4f5b51fdc6788f6172|
|Content-Type|application/json|是|application/json|

Body：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|name |是  |String | 分组名称 |
|index |否  |Int | 添加的时候可以指定分组排在什么位置，如果不指定,那么新增的分组就排在最后 |
|apikey |是  |String | 用户apikey  |
|groupType |否  |Int | 分组：0  |

```
index例子，比如有个用户有如下分组信息：
分组xx      index: 1
分组 yy      index: 2
分组 zz       index: 3
这时候新增一个分组：  分组 aaa   index: 2,那么保存到数据的结果就是
分组xx      index: 1
分组aaa    index: 2
分组 yy      index: 3   原来的index加1
分组 zz       index: 4  原来的index加1
如果新增的分组index为空，或者等于0，那么index就取最大值加1
```

**响应参数:**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int | 状态码  |
|groupid |是  |Sting | 返回数组id  |

```
状态码
0:操作成功
400:参数错误
401:认证失败
500:服务器错误
```



