---
title: 通用说明
last_updated: 2019-10-15
summary: "请求云平台服务认证准备，包括通用参数说明，认证所需的签名规则介绍，签名计算示例以及Access Token以及Refresh Token说明。"
sidebar: mydoc_sidebar
permalink: instruction.html
folder: mydoc
---

   
## 通用说明
 
 通用说明里的参数是所有接口的公用参数，请求接口时需要传递通用参数+接口参数。（开发通用说明仅适用于REST API接口，WebSocket接口，请查看[分配服务](dispatch.html)）

- HTTP请求头需指定：**Content-Type:application/json**
- 字符编码：utf-8
- HTTP请求头「Authorization」字段必须有「签名」或「Access Token」值
- HTTP和WebSocket接口全部使用SSL/TLS，端口为8080，服务端支持SSLV3、TLS1.1、TLS1.2、TLS1.3

**必选参数如下：**

|参数名|类型|是否必须|备注|
:-: | :-: | :-: | :-: | :-:
|appid|string|是|酷宅给第三方应用分配的appid|
|nonce|string|是|8位随机字符串，只由字母数字组成|
|ts|int|是|进行接口调用时的时间戳，即当前时间戳 （时间戳：当前距离Epoch（1970年1月1日） 以秒计算的时间，即unix-timestamp）|
|version|string|是|协议版本，默认填8|

备注：

- 用户或者设备apikey原则上也要上传，涉及到设备操作上传设备apikey，例如查询设备详情，修改设备名称。
- 如果遇到接口报400错误，检查这些必填项。


## 签名规则

- 未登录的所有接口（包括登录接口）调用都需要计算签名，签名值放在HTTP请求头中的「Authorization」里。

如：

```
Authorization: Sign 2CqlYZcS8x6LI27DgfX3QdqnVCFqbEz8sZXtOGEFuGc=
```
 
签名算法见本章下文的签名计算

- GET请求：

将所有参数（sign除外）按照参数名的字母顺序排序，并用&连接：

```
appid=McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr&deviceid=1000012345&nonce=2323dfgh&ts=1558004249
```

计算签名:将「App Secret」作为key，生成被签名串的「HMAC-SHA256」签名。
将得到的签名 Base64 编码后设置到「Authorization」中

- POST请求:

待签名串为整个body的json数据(通用说明里的参数以及接口中的参数)，以登录接口为例。 

如：

```Json
{"appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr","nonce":"232323df","ts":1558004249,"version":8,"phoneNumber":"+8613123456789","password":"12345678"}
```

或

```Json
{"appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr","nonce":"232323df","ts":1558004249,"version":8,"email":"123@gmail.com","password":"12345678"}
```

注意：

phoneNumber的值需要加上国家码如：+86
phoneNumber和email只需要传递其中一个。中国区域只能传递「phoneNumber」，亚洲区域可传「phoneNumber」或「email」，欧洲和美洲地区传递「email」。

## 签名计算

签名算法Demo①：以登录接口为例，Method：POST（GET方式查看签名规则）

method:POST（GET方式查看签名规则）

```
// node.js
let crypto = require('crypto');
let appid="McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr";
let appsecret="OdPuCZ4PkPPi0rVKRVcGmll2NM6vVk0c";
let params={"appid": appid, "nonce": "asbsedwq", "password": "12345678", "phoneNumber": "+8613123456789", "ts": 1560306258, "version": 8}
let buffer = Buffer.from(JSON.stringify(params),"utf-8");
let theSign = crypto.createHmac('sha256', appsecret).update(buffer).digest('base64')
console.log(theSign)
// XuOzGxtG50CiF4H3odUfZsvKVl5+qSPzhfLEuUd4eJw=
```

签名算法Demo②：

```Python
# Python
# 生成签名
import hashlib
import hmac
import base64

def makeSign(key, message):
    j = hmac.new(key.encode(), message.encode(), digestmod=hashlib.sha256)
    return (base64.b64encode(j.digest())).decode()

def main():
    import json
    data = {
        'appid': 'McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr',
        'nonce': 'asbsedwq',
        'ts': 1560306258,
        'version': 8,
        'phoneNumber': '+8613123456789',  # 手机号 （优先检查）
        'password': '12345678'  # 密码
    }
    message = json.dumps(data, sort_keys=True)
    Sign = makeSign(key='OdPuCZ4PkPPi0rVKRVcGmll2NM6vVk0c', message=message)
    print(Sign)
    # XfWcNURxPxpk6Z+6I+WR/j9wHURhvTEK1qa3sAJFNR0=

if __name__ == "__main__":
    main()
```

由于签名内容字符顺序不同，得到的签名也会不同，这个是正常的。

可以拿demo的参数放到自己的签名算法中，算出来的签名值和提供的签名值一致，表示签名算法通过。

其他编程语言Sha256加密计算示例：[Examples of creating base64 hashes using HMAC SHA256 in different languages](https://www.jokecamp.com/blog/examples-of-creating-base64-hashes-using-hmac-sha256-in-different-languages/)

在线计算网址：[https://1024tools.com/hmac](https://1024tools.com/hmac)

![hmac](img/hmac.png)

## AT和RT说明


登录后调用的接口都需要在Authorization头中增加access token，如下：
```
Authorization: Bearer a527297584f1ca030579a90d2e800481e22e850a
```
（a527297584f1ca030579a90d2e800481e22e850a为登录返回的at）
  
登录、注册、重置密码成功后会返回「access token」（返回的at，即access token）
  
access token有效期为一个月。同一个帐号在同一个应用下不能同时登录，每登录一次会重新刷新token，这样后面登录的用户会刷新token，让前面登录的用户token失效，使其被迫下线。
  
refresh token有效期为两个月。access token失效后可通过refresh token请求refresh token刷新接口，重新获取新的access token和refresh token。请查看 [Refresh token刷新](token.html)
