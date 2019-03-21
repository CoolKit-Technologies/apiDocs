---
title: token刷新
last_updated: 2019-03-20
sidebar: mydoc_sidebar
permalink: token.html
folder: mydoc
---

acesss token缺省30天失效（安全原因），此时不用用户重新登录获取acesss token，而是使用 refresh token刷新获取acesss token

- 正式环境URL: ``` https://cn(区域)-api.coolkit.cn:8080/api/user/refresh``` 

- 测试环境URL: ``` https://testapi.coolkit.cn:8080/api/user/refresh``` 

- 请求方法： GET

- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|rt     |是  |String | refresh token |

**响应参数:**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |否  |Int | 400:   缺少参数。401:获取token失败。402：refresh token失效。500：服务器错误。操作成功：没有error字段 |
|region |否  |String | 区域（成功必返回）  |
|at |否  |String | access token（成功必返回）  |
|rt |否  |String | refresh token（成功必返回）  |
|user |否  |Object | 用户信息（成功必返回）  |


