---
title: Token Refresh
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: token_en.html
folder: mydoc
layout: page_en
---

acesss token expires in 30 days by default(security reasons)，while users do not need to login again to get access token, instead uses refresh tocken to refresh and get access token.

- Production environment URL: ``` https://cn(区域)-api.coolkit.cn:8080/api/user/refresh``` 

- Test environment URL: ``` https://testapi.coolkit.cn:8080/api/user/refresh``` 

- Request method： GET

- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|rt     |Yes  |String | refresh token |

**Response parameters:**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |No  |Int | 400: Missing parameter.401:Failed to get token.402：Failed to refresh token.500：Server error.When success, no error returned |
|region |No  |String | Region of server（Returned when success）  |
|at |No  |String | access token（Returned when success）  |
|rt |No  |String | refresh token（Returned when success）  |
|user |No  |Object | User info（Returned when success）  |


