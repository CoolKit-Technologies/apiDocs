---
title: General Developer Instruction
last_updated: 2019-03-20
summary: Preparation for accessing Cloud platform services,including descriptions for general parameters,introduction to signature rule for authorization,Example for signature calculation, and expanation for Access Token and Refresh Token.
sidebar: mydoc_en_sidebar
permalink: instruction_en.html
folder: mydoc
layout: page_en
---

   
## General Developer Instruction

 Description：Parameters in general instruction are public for all APIs.Accessing API takes both general parameters and API parameters.（General developer instruction only applies to REST API.For WebSocket API, [please check](dispatch_en.html)）
- HTTP Request Header should specify Content-Type:application/json
- Character Encoding：utf-8
- The Authorization field of HTTP Request Header must include signature or access token value
- Both HTTP and websocket uses SSL/TLS，port is 8080，Server end supports SSLV3,TLS1.1, TLS 1.2

**Required Parameters as follows：**

|Parameter|Required|Type|Description|
|:----    |:---|:----- |-----   |
|ts |Yes  |Long |Timestamp of API calling,say current timestamp （Timestamp：current time in seconds from Epoch（Jan 1, 1970），say unix-timestamp）  |
|appid |Yes  |String | appid provided by Coolkit    |
|nonce     |Yes  |String | 8-digit random alphanumeric string    |
|version     |Yes  |Int | version:8 Agreed Version    |

## Signature Rule
- All API accessing(including login) before login requires signature calculation.Signature value is put in Authorization Header of HTTP.For example:
 Authorization:Sign QtKh6EnKoNmPnv17Ump3b/6r2hjojWb4nqSt4lnyj2U=
 
```
Please refer to 'Signature Calculation' below for Signature Algorithmc
```

- GET Request：
Order all parameters alphabetically based on the names of parameters and concatenate them with &.

```
appid="I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF"&deviceid="1000052354"&nonce="2323dfgh"&ts=1545219251
```

Signature Calculation: Set ‘app secret’ as key，generate sigature string based on HMAC-SHA256.

Encode the signature string by Base64 and add to Authorization header.

- POST Request:
Create json data with signature string and all other parameters(parameters in general instruction and API parameters)，Take example of Login API.For example:
```{"appid":"I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF","nonce":"232323df","ts":1545219251,"version":8,"phoneNumber":"+86********","password":"****"}```
Or
```{"appid":"I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF","nonce":"232323df","ts":1545219251,"version":8,"email":"dev@coolit.cc","password":"****"}```
Note：Country code must be added to phoneNumber,such as：+86

Only one of phoneNumber and email need to be passed.phoneNumber is passed only for accounts in cn region.email is passed for other regions.

## Signature Calculation

Signature Algorithm demo: 【nodejs】 taking example of login API 

method:POST（GET method to check signature rule）


```
var crypto = require('crypto');
var appid="I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF";
var appsecret="S1fHFiMqzykNdxlSrk9Pjdczp7rsvt3M";
var params={"appid":"I25m0KljbFfGsTjRc3eTwTEPVwKzsvCF","phoneNumber":"+8613570211955","password":"lybywl163","ts":1545219251123,"version":8,"nonce":"asbsedwq"}
var buffer = new Buffer(JSON.stringify(params),"utf-8");
var theSign = crypto.createHmac('sha256', appsecret).update(buffer).digest('base64')
```

Signature value calculated from parameters above
```"QtKh6EnKoNmPnv17Ump3b/6r2hjojWb4nqSt4lnyj2U="```

You can use demo parameters in your own authorization calculation.If the signature value is same as the one above, your signature algorithm is working correctly.


## Descirptions for Access Token and Refresh Token（Say at and rt returned after login）
After login,all API callings require adding access tocken in Authorization header.For example:

Authorization: Bearer 1832d4a0f5f5f5845cb1922c1091c8aa5dfe0041 

（1832d4a0f5f5f5845cb1922c1091c8aa5dfe0041 is at returned after login）

After login succeeds,access token will be returned（at returned after login，say access token）.
 
access token remains valid for one month.One account can not be logined by multiple users at the same time.Every time one logins,token will be refreshed.Thus,the second user who logins later will refresh the token and make the token of previous user expire.First user will be forced to log out.

refresh token remains valid for two months.When access token expires,access token and refresh token can be regained by accessing refresh token API.[Please check Token Refresh](token.html)


