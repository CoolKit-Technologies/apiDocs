---
title: 更新/上报状态
last_updated: 2019-03-20
sidebar: mydoc_sidebar
permalink: deviceStatus.html
folder: mydoc
---

设备控制以及各类定时设置

- 说明：设备端状态发生变化、设备端上报历史数据、APP修改设备状态，都应该发送该指令到服务器。
- 请求参数：

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|action |是  |String |action:update   |
|apikey |是  |String | 绑定用户的apikey    |
|deviceid     |是  |String | 设备id    |
|userAgent     |是  |String | device:设备端;app:app端  |
|selfApiKey     |否  |String | App专用参数:当app操作分享设备时，要发送自己的apikey给服务器    |
|sequence     |是  |String | 发送给服务器的时间戳，精确到毫秒    |
|params     |是  |Params | 服务端对于params参数采用透传方式，可能是对象也可能是对象数组。    |

**Params说明**

因为该参数值会因为设备的不同而不同（每种新设备都可能有自己的内容），所以不管是设备端还是app端发送的指令，服务端都直接转发或者存储params参数，不会做任何逻辑检查或者操作。例如：
单通道开关格式例子：
``` 
"params":{
    "switch":"on"
 }
 ``` 
多通道开关格式例子：
``` 
"params": {
        "switches": [
            {
                "switch": "off",
                "outlet": 0
            },
            {
                "switch": "off",
                "outlet": 1
            },
            {
                "switch": "off",
                "outlet": 2
            },
            {
                "switch": "off",
                "outlet": 3
            }
        ]
}
``` 

定时器例子：
总体说明，设备可以添加多个定时器，每一次新增、修改、删除定时器的时候，都要全量提交定时器数组。比如目前定时器有2两个，那么如果再新增一个，那么提交的timers数组里，除了新增的这个定时器信息以外还要包含之前那两个定时器的信息。

单次定时，也就是只会执行一次:
``` 
"params":{
        "timers":[
            {
                "enabled":1, //1表示启用
                "mId":"c102f00f-db6f-fef0-f296-9dd10fdc2193", //随机，给app用来定位
                "type":"once",  //设备端专用once表示单次定时，repeat重复定时
                "at":"2017-07-24T08:28:00.000Z", //执行的时间 ，注意是GTM时间   0时区
                "do":{   //具体要执行的操作
                    "switch":"on"   //这里是执行打开单通道开关的操作。如果是多通道，这里放的是多通道的开关格式。
                },
                "coolkit_timer_type":"once" //app专用
            }
        ]
    }
``` 
重复定时：
``` 
"params":{
        "timers":[
            {
                "enabled":1,
                "mId":"847b296e-9043-ac94-ca37-aa5f91d22338",
                "type":"repeat", //重复执行
                "at":"36 8 * * 1,3",//时间表达式参考cron
                "do":{
                    "switch":"on"
                },
                "coolkit_timer_type":"repeat" //重复执行
            }
        ]
    }
``` 
循环定时：
``` 
"params":{
        "timers":[
            {
                "enabled":1,
                "mId":"847b296e-9043-ac94-ca37-aa5f91d22338",
                "type":"duration", 
                "at":"2018-11-21T10:24:00.980Z 10 5",//循环定时执行时间 循环周期 10分钟 再执行 5分钟
                "startDo":{
                    "switch":"on"  //周期开始执行
                },
	       "endDo":{
                    "switch":"off"  //随后再执行
                },
                "coolkit_timer_type":"duration" //重复执行
            }
        ]
    }
``` 
延时定时（指定在多少分钟后执行，也就是单次执行，只是为了可以快速添加定时器）：
```
"params":{
        "timers":[
            {
                "enabled":1,
                "mId":"95303c64-fbb4-f497-1341-c592432d1d0d",
                "type":"once",
                "at":"2017-07-24T09:10:43.223Z",
                "do":{
                    "switch":"on"
                },
                "period":"30",
                "coolkit_timer_type":"delay"  //延时定时
            }
        ]
    }
``` 

- 返回参数

|参数名|必选|类型|说明|
|:----    |:---|:----- |-----   |
|error |是  |Int |错误码   |
|apikey |是  |String | 绑定用户的apikey    |
|deviceid     |是  |String | 设备id    |
|sequence     |是  |String | 由app下发给设备，设备端原样返回    |
|d_seq     |否  |String | 设备端上传，服务端原样转发给app    |

```
错误码
0:ok(操作成功)
400:Bad Request（参数错误）
403:Forbidden（无权限）
500:Internal Server Error（服务器内部错误）
以下是app端专用的返回：
503:Device Offline(设备不在线)
504:Request Timeout（响应超时）
```





