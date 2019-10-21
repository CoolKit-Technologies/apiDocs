---
title: Update/Report Status
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: deviceStatus_en.html
folder: mydoc
layout: page_en
---

Device control and setup of all types of timers.

- Description：This command should be sent to server whenever device status changes, device reports history data, and app changes device status.
- Request parameters：

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|action |Yes  |String |action:update   |
|apikey |Yes  |String | user apikey    |
|deviceid     |Yes  |String | 	device id    |
|userAgent     |Yes  |String | device: deivce ;app: app  |
|selfApiKey     |No  |String | parameter in app only: when app shares device, apikey of owner should be sent to server    |
|sequence     |Yes  |String | timestamp to millisecond sent to server    |
|params     |Yes  |Params | server passes params as object or object array by pass-through method    |

**Params Descripion**

Since this parameter varies according to device(every new device has its own parameters),regardless of command from device or app,server forwards or save its params directly without any logic check or change.
Example of single channel switch：
``` 
"params":{
    "switch":"on"
 }
 ``` 
Example of multi-channel switch:
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

Timer examples：
Generally speaking, multiple timers can be added to a device. Everytime timer is added, modified, or deleted, complete timer array needs to be resubmitted. For example,we have two timers now,when we add another, the timer array submitted will include the info of both the new timer and the previous two.

Single timer, which activates once only.
``` 
"params":{
        "timers":[
            {
                "enabled":1, //1 means it is enabled
                "mId":"c102f00f-db6f-fef0-f296-9dd10fdc2193", //random,for app to locate it
                "type":"once",  //for app only, once means single timer, repeat means repeating timer
                "at":"2017-07-24T08:28:00.000Z", //activation time,based on GMT+0
                "do":{   //the operation to trigger
                    "switch":"on"   //this example shows the operation of single-channel switch.Refer to multi-channel example above for multi-channel device.
                },
                "coolkit_timer_type":"once" //for app only
            }
        ]
    }
``` 
Repeating timer：
``` 
"params":{
        "timers":[
            {
                "enabled":1,
                "mId":"847b296e-9043-ac94-ca37-aa5f91d22338",
                "type":"repeat", // a repeating timer
                "at":"36 8 * * 1,3",//refer to cron for time format
                "do":{
                    "switch":"on"
                },
                "coolkit_timer_type":"repeat" //activates repeatedly
            }
        ]
    }
``` 
Loop timer：
``` 
"params":{
        "timers":[
            {
                "enabled":1,
                "mId":"847b296e-9043-ac94-ca37-aa5f91d22338",
                "type":"duration", 
                "at":"2018-11-21T10:24:00.980Z 10 5",//start time, loop cycle, 10 mins,reactivates after, 5 mins
                "startDo":{
                    "switch":"on"  //start action
                },
           "endDo":{
                    "switch":"off"  //end action
                },
                "coolkit_timer_type":"duration" //activates repeatedly
            }
        ]
    }
``` 
Countdown timer（Activates after specified time, which fires once only.A qucik way to add timer）：
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
                "coolkit_timer_type":"delay"  //countdown timer
            }
        ]
    }
``` 

- Return parameters

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|error |Yes  |Int |error code   |
|apikey |Yes  |String | user apikey    |
|deviceid     |Yes  |String | device id    |
|sequence     |Yes  |String | sent to device by app, device returns it Intactly    |
|d_seq     |No  |String | uploaded by device, server passes it Intactly to app    |

```
error code
0:ok(operation succeeded)
400:Bad Request（wrong parameter）
403:Forbidden（no permission）
500:Internal Server Error（Internal server error）
error codes returned from app only a:
503:Device Offline(Device is offline)
504:Request Timeout（Request timed out）
```





