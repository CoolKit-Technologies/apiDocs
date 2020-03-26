---
title: 创建第一个应用
last_updated: 2020-03-25
summary: "本节从账号登录、获取设备数据、建立长连接实现设备控制等方面讲解如何在酷宅云平台上面实现客户端与设备的数据交互。
下面通过示例应用快速入门「如何开发自己的应用？」"
sidebar: mydoc_sidebar
permalink: application.html
folder: mydoc
---

### 示例

示例数值仅供参考，具体开发过程，请替换成自己的参数。

### 基本流程

- 第一步：登录，认证帐号获取认证token，通过认证后才能获取访问服务的权限。
- 第二步：设备列表，获取帐号下添加的所有设备。设备控制时需要提供相关设备数据以及用户数据。
- 第三步：访问分配服务，获取连接信息。
- 第四步：建立长连接，通过第三步获取的长连接信息，建立连接。
- 第五步：握手，通过第一步获取的认证信息(at即access token)，进行握手，握手成功后，表示认证通过，允许进行设备控制。
- 第六步：控制设备，通过第二步获取的设备信息，发送update指令进行设备控制。

#### 第一步：登录

接口测试工具：[https://www.getpostman.com/](https://www.getpostman.com/)
在线快速测试：[https://getman.cn/](https://getman.cn/)

- 接口地址： https://{区域}-api.coolkit.cc:8080/api/user/login
- 请求方法： post

**请求参数：**

Headers：

| 名称 | 参数值 | 允许为空 | 示例 |
| :--- | :--- | :--- | :--- |
| Authorization | Sign+空格+签名值 | N | Sign Qbd+knKCUb8LAP6yMv1SSqYwmm1vDIxG3rHeq1Ul+ |
| Content-Type | application/json | N | application/json |

Body：

| 名称 | 类型 | 允许为空 | 说明 |
| :--- | :--- | :--- | :--- |
| phoneNumber | string | - | 登录手机（优先） |
| email | string | - | 登录邮箱 |
| password | string | N | 登录密码 |
| appid | string | N | APPID |
| nonce | string | N | 8位字母数字随机数 |
| ts | number | N | 时间戳精确到秒 |
| version | number | N | 接口版本：8 |

示例：

```Json
{
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "phoneNumber":"+8613185260282",
    "password":"12345678",
    "ts": 1558004249,
    "version":8,
    "nonce":"asbsedwq"
}
```

备注：

- 接口地址中的区域可根据实际用户所属地区更改，目前已有区域：cn、as、eu、us
- 中国内陆区域建议使用：https://cn-api.coolkit.cn:8080 -> .cn域名后缀
- 其他地区建议使用：https://{区域}-api.coolkit.cc:8080 -> .cc域名后缀
- 签名值计算规则请查看 「[开发通用说明](https://www.yuque.com/nocmt/oadlgi/zcuit1#5Iu8I)」。

**响应参数：**

| 名称 | 类型 | 允许为空 | 说明 |
| :--- | :--- | :--- | :--- |
| error | number | Y | 失败时返回，且只会返回error |
| at | string | Y | Access Token |
| rt | string | Y | Refresh Token |
| user | object | Y | 用户信息 |
| region | string | Y | 注册区域 |

User说明：见注册接口

错误码：

400：缺少参数  
301：用户在其他大区，需要客户端查询区域接口重定向  
401：用户名密码错误  
402：邮箱未激活  
404：用户不存在  
406：认证失败（APPID错误或参数不完整）  

**返回示例：**

```Json
{
    "at":"a527297584f1ca030579a90d2e800481e22e850a",
    "rt":"24670a9e493ba18cf5d9750f14505705824fcfd9",
    "user":{
        "_id":"5c984cd3dc8295fa0ef3e592",
        "phoneNumber":"+8613185260282",
        "appId":"1xMdjbmOBYctEJfye4EjFLR2M6YpYyyJ",
        "lang":"cn",
        "online":false,
        "onlineTime":"2019-05-16T10:48:42.091Z",
        "ip":"113.87.160.95",
        "location":"广东",
        "offlineTime":"2019-05-16T10:51:22.090Z",
        "appInfos":[
            {
                "appVersion":"3.6.1",
                "os":"android"
            }
        ],
        "nickname":"coco",
        "createdAt":"2019-03-25T03:36:51.335Z",
        "apikey":"95da0fea-6834-469a-b247-4dd5ee9a51f1"
    },
    "region":"cn"
}
```

备注：

- at为其他请求必须携带的参数，代替Authorization的值（Authorization：Bearer+空格+at）。
- rt存在的目的是刷新at。
- region为账号注册所在区域。

#### 第二步：请求设备列表

- 接口路径： https://{区域}-api.coolkit.cc:8080/api/user/device
- 请求方法： get

**请求参数：**

Headers：

| 名称 | 参数值 | 允许为空 | 示例 |
| :--- | :--- | :--- | :--- |
| Authorization | Bearer+空格+at | N | Bearer 074e8af6f5f10183647a6a4f5b51fdc6788f617a |
| Content-Type | application/json | N | application/json |

Params：

| 名称 | 类型 | 允许为空 | 说明 |
| :--- | :--- | :--- | :--- |
| lang | string | Y | cn 响应返回中文信息；en 响应返回英文信息 |
| appid | string | N | APPID |
| nonce | string | N | 8位字母数字随机数 |
| ts | number | N | 时间戳精确到秒 |
| version | number | N | 接口版本：8 |

示例：

```Json
https://cn-api.coolkit.cn:8080/api/user/device?lang=cn&appid=McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr&ts=1558004249&version=8&nonce=asbsedwq
```

**响应参数：**

| 名称 | 类型 | 允许为空 | 说明 |
| :--- | :--- | :--- | :--- |
| error | number | Y | 状态码，error：0 操作成功 |
| devicelist | array | N | 设备列表信息，成功才返回 |

**备注：如果返回为空列表：[]，说明账号下没有设备或者该设备品牌没有关联到您的APPID，需要联系对接销售，获得临时测试授权，后期正式授权接入事项可咨询对接销售。**

device说明：

| 名称 | 类型 | 允许为空 | 说明 |
| :--- | :--- | :--- | :--- |
| name | N | string | 设备名称 |
| type | N | string | 类型 |
| deviceid | N | string | 设备id |
| apikey | N | string | 绑定的用户apikey |
| extra | N | object | 关联表引用信息 |
| onlineTime | N | string | 设备最后上线时间 |
| ip | N | string | 设备上线的ip地址 |
| location | N | string | 设备上线的地方 |
| settings | N | object | 设备配置信息 |
| groups | N | list | 设备所属的分组ID，设备可以属于多个分组。如果不属于任何分组，则返回空数组[] |
| params | N | object | 设备参数 |
| online | N | boolean | 设备是否在线 |
| createdAt | N | date | 设备添加时间 |
| sharedTo | Y | object | 分享列表 |
| devicekey | N | string | 设备apikey（重要） |
| deviceUrl | Y | string | 设备详情界面url |
| brandName | N | string | 品牌 |
| productModel | N | string | 产品型号 |
| showBrand | N | boolean | 是否展示品牌和产品型号 |
| uiid | N | number | 设备ui的id（重要） |

**返回示例：**

```Json
[
    {
        "_id": "***************",
        "name": "我的设备213ac8",
        "type": "10",
        "deviceid": "1000213ac8",
        "apikey": "3541f7af-*ec5-4502-9bf3-eb4b09e9e12*",
        "extra": {
            "_id": "***************",
            "extra": {
                "model": "PSA-B11-GL",
                "ui": "单通道开关",
                "description": "WWJG001111",
                "manufacturer": "深圳创易智能系统有限公司",
                "mac": "**:**:**:**:**:**",
                "apmac": "**:**:**:**:**:**",
                "modelInfo": "***************",
                "brandId": "***************",
                "uiid": 6,
                "staMac": "**:**:**:**:**:**",
                "chipid": "********"
            }
        },
        "__v": 0,
        "onlineTime": "2019-10-15T07:22:14.361Z",
        "ip": "110.110.110.110",
        "location": "广东",
        "settings": {
            "opsNotify": 0,
            "opsHistory": 1,
            "alarmNotify": 1,
            "wxAlarmNotify": 0,
            "wxOpsNotify": 0,
            "wxDoorbellNotify": 0,
            "appDoorbellNotify": 1
        },
        "devGroups": [],
        "groups": [],
        "params": {
            "pulseWidth": 500,
            "pulse": "off",
            "init": 1,
            "startup": "off",
            "staMac": "**:**:**:**:**:**",
            "rssi": -50,
            "fwVersion": "3.0.1",
            "switch": "off",
            "sledOnline": "on",
            "version": 8
        },
        "online": true,
        "createdAt": "2019-10-15T07:22:11.700Z",
        "group": "",
        "sharedTo": [],
        "devicekey": "***************",
        "deviceUrl": "",
        "brandName": "Maker",
        "showBrand": true,
        "brandLogoUrl": "",
        "productModel": "Sonoff basic R2",
        "devConfig": {},
        "uiid": 6
    },
]
```

![image.png](img2/getDevices.png)

备注：

- sharedBy：分享方的信息（接收方查看设备列表才显示）
- sharedTo：被分享方的信息（分享方查看设备列表才显示）
- 不同设备的UIID会不同，UI决定显示的效果
- 如果返回为[]，则可能意外着账号下没有设备或者该设备品牌没有关联到你的APPID（解决办法是找对接销售人员授权

#### 第三步：请求分配服务

获得长连接地址和端口以后，才能建立长连接。

- 接口路径： https://{区域}-api.coolkit.cc:8080/dispatch/app
- 请求方法： post

**请求参数：**

Headers：

| 名称 | 参数值 | 允许为空 | 示例 |
| :--- | :--- | :--- | :--- |
| Authorization | Bearer+空格+at | N | Bearer 074e8af6f5f10183647a6a4f5b51fdc6788f617a |
| Content-Type | application/json | N | application/json |

Body：

| 名称 | 类型 | 允许为空 | 说明 |
| :--- | :--- | :--- | :--- |
| accept | string | N | 固定参数：ws |
| appid | string | N | APPID |
| nonce | string | N | 8位字母数字随机数 |
| ts | number | N | 时间戳精确到秒 |
| version | number | N | 接口版本：8 |

示例：

```Json
{
    "accept":"ws",
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "ts":15452192511,
    "version":8,
    "nonce":"asbsedwq"
}
```

**响应参数：**

| 名称 | 类型 | 允许为空 | 说明 |
| :--- | :--- | :--- | :--- |
| IP | string | N | 长连接服务器外网IP |
| port | number | N | 长连接服务器外网端口 |
| domain | string | N | 长连接服务器域名。目前只有app端才会返回域名。android客户端尽量选择用ip建立长连接，这样可以减少dns解析带来的问题，js版客户端无法跳过证书检查，那么就只能用IP了。 |
| error | number | N | 成功返回error:0 |
| reason | string | N | 成功返回ok |

错误码：

0：成功
400：客户端参数错误
401：认证不通过（ 提示登录 ）
402：at过期（ APP会自动刷新access token）
403：无权限（ APP提示无权限，比如APP无权访问OTA接口）（401-403认证错误由内部认证系统给出）

**返回示例：**

```Json
{
    "port": 8080,
    "IP": "52.80.19.131",
    "reason": "ok",
    "domain": "cn-pconnect2.coolkit.cc",
    "error": 0
}
```

#### 第四步：建立长连接

**创建websocket连接和发送控制命令流程：**

![controlDeviceProcess](./img2/controlDeviceProcess.jpeg)

通过第三步请求分配服务返回的IP或者domain+Port建立长连接。

请求：wss://cn-pconnect2.coolkit.cc:8080/api/ws

WebSocket测试工具： [http://www.blue-zero.com/WebSocket/](http://www.blue-zero.com/WebSocket/)

通过分配服务返回的IP或者domain建立握手。

#### 第五步：握手

![userOnline](./img2/userOnline.png)

如上图提示「Websocket连接已建立，正在等待数据...」，就表示连接成功了，可以开始握手。

握手示例数据：

```Json
{
    "action":"userOnline",
    "version":8,
    "ts":1571141259,
    "at":"登录接口获取的AT",
    "userAgent":"app",
    "apikey":"登录接口获取的用户APIKEY",
    "nonce":"2plz69ax",
    "sequence":"毫秒级时间戳，示例：1571141530100",
  	"appid": "xxxx"
}
// 需去掉空格压缩：https://www.Json.cn/
```

**握手成功响应：**

![userOnlineSuccess.png](./img2/userOnlineSuccess.png)

**心跳时间：**

「hbInterval」为心跳时间，需要在145s内发送「**ping**」，保持心跳，服务器收到ping后会响应「pong」，自己测试时刻手动发送ping。

![hbInterval](./img2/hbInterval.png)

#### 第六步：控制设备

说明：设备在状态改变时会上报信息，这时候如果是APP收到信息，就会同步显示状态，如果自己做服务器或者客户端，也可以将这个变化记录下来，方便自己做统计或者做历史记录功能。

![controlDevice](./img2/controlDevice.png)

**发送控制指令：**

params的协议根据不同设备有所不同，商务合作后会根据对接的设备提供 「**协议文档**」。
「apikey、deviceid、sequence、params」都要替换成自己已经添加设备的参数

参数说明请查看 「**更新/上报状态**」

示例：

```Json
{
    "action":"update",
    "apikey":"登录接口获取的用户APIKEY",
    "deviceid":"设备列表接口获取的设备ID",
    "userAgent":"app",
    "sequence":"毫秒级时间戳，示例：1571141530100",
    "params":{
        "switch":"off"
    }
}
// 需去掉空格压缩
```

![controlDeviceSuccess.png](./img2/controlDeviceSuccess.png)

**控制指令返回：**

返回「error:0」 表示成功。

示例：

```Json
{
    "error":0,
    "deviceid":"设备列表接口获取的设备ID",
    "apikey":"登录接口获取的用户APIKEY",
    "sequence":"1571141530100"
}
```

注意：

1. 如果设备是别人分享给你的，apikey一定要从设备列表接口返回的apikey参数中获取值，如果设备主人就是自己，则登录返回的用户apikey和设备列表返回的apikey都可以。
2. 设备一定要在线。发送指令成功后，观察设备是否执行了开或者关，不在线一定报错。

整个流程顺利完成，接下来在「[接口中心」查看如何使用区域功能，帐号功能，设备管理功能，设备控制功能，认证功能。