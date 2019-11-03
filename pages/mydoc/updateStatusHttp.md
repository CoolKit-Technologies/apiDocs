---
title: 更新设备状态
last_updated: 2019-10-26
sidebar: mydoc_sidebar
permalink: updateStatusHttp.html
folder: mydoc
---

更改设备的状态，比如：定时器、分享、开关状态等。

---

接口地址： https://{区域}-api.coolkit.cc:8080/api/user/device/status

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
|deviceid |是  |string |设备id   |
|apikey |是  |string |设备apikey|
|params |是  |object | 服务端对于params参数采用透传方式，可能是对象也可能是对象数组。只需要发送期望改变的状态参数    |
|appid|是|string|APPID|
|nonce|是|string|8位字母数字随机数|
|ts|是|int|时间戳精确到秒|
|version|是|int|接口版本：8|


因为该参数值根据不同设备而不同（每种新设备都可能有自己的内容），所以不管是设备端还是app端发送的指令，服务端都直接转发或者存储params参数，不会做任何逻辑检查或者操作。例如：

```
单通道开关格式例子：
"params":{
   "switch":"on"
}
	 
多通道开关格式例子：
"params":{
   "switches":[
      {
         "switch":"off",
         "outlet":0
      },
      {
         "switch":"off",
         "outlet":1
      },
      {
         "switch":"off",
         "outlet":2
      },
      {
         "switch":"off",
         "outlet":3
      }
   ]
}
```

定时器例子：
总体说明，设备可以添加多个定时器，每一次新增、修改、删除定时器的时候，都要全量提交定时器数组。比如目前定时器有2两个，那么如果再新增一个，那么提交的timers数组里，除了新增的这个定时器信息以外还要包含之前那两个定时器的信息。

```
单次定时，也就是只会执行一次
"params":{
   "timers":[
      {
         "enabled":1, //1表示启用
         "mId":"c102f00f-db6f-fef0-f296-9dd10fdc2193",  //随机，给app用来定位
         "type":"once", //设备端专用once表示单次定时，repeat重复定时
         "at":"2017-07-24T08:28:00.000Z", //执行的时间 ，注意是GTM时间 0时区，时间格式跟示例中保持一致
         "do":{  //具体要执行的操作
            "switch":"on"  //这里是执行打开单通道开关的操作。如果是多通道，这里放的是多通道的开关格式。
         },
         "coolkit_timer_type":"once"  //app专用
      }
   ]
}


重复定时：（请根据各自的开发语言转换成jsonstring）
"params":{
   "timers":[
      {
         "enabled":1,
         "mId":"c102f00f-db6f-fef0-f296-9dd10fdc2193",
         "type":"repeat",  //重复执行
         "at":"36 8 * * 1,3",   //时间表达式参考cron(网上搜索cron)
         "do":{
            "switch":"on"
         },
         "coolkit_timer_type":"repeat"  //重复执行
      }
   ]
}

循环定时（请根据各自的开发语言转换成jsonstring）
"params":{
   "timers":[
      {
         "enabled":1,
         "mId":"c102f00f-db6f-fef0-f296-9dd10fdc2193",
         "type":"duration",
         "at":"2018-11-21T10:24:00.980Z 10 5", //循环定时执行时间 循环周期 10分钟 再执行 5分钟
         "startDo":{
            "switch":"on"  //周期开始执行
         },
         "endDo":{
            "switch":"off"  //随后再执行
         },
         "coolkit_timer_type":"duration"  //重复执行
      }
   ]
}

延时定时（指定在多少分钟后执行，就是单次执行，只是为了可以快速添加定时器）：
"params":{
   "timers":[
      {
         "enabled":1,
         "mId":"c102f00f-db6f-fef0-f296-9dd10fdc2193",
         "type":"once",
         "at":"2017-07-24T09:10:43.223Z",
         "do":{
            "switch":"on"
         },
         "period":"30",  //单位分钟
         "coolkit_timer_type":"delay"   //延时定时
      }
   ]
}
```

举例：

```Json
{
    "deviceid":"100000001",
    "apikey":"xxxx-xxxx-xxx",
    "params":{
        "switch":"on"
    },
    "appid":"McFJj4Noke1mGDZCR1QarGW7P9Ycp0Vr",
    "ts":15452192511,
    "version":8,
    "nonce":"asbsedwq"
}
```

**响应参数：**

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |状态码   |
|deviceid |是  |string | 设备id    |

状态码：

    0：操作成功
    400：参数错误
    401：认证失败
    403：无权限
    500：服务器内部错误
    503：设备不在线

返回示例：

```Json
{
    "error":0,
    "deviceid":"1000000001"
}
```

此参数内容来自于协议文档，不同设备不同协议内容，比如 单通道开关只有一个switch，但多通道设备肯定不止一个switch，灯类设备还能调色调光，参数也有所不同。

协议文档需要向对接销售索要，公版易微联APP未对接设备（无UI）的，如果定制需要额外付费，具体内容咨询对接销售。