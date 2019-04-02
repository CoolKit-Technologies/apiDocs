---
title: Authentication
last_updated: 2019-03-20
sidebar: mydoc_en_sidebar
permalink: faqOauth_en.html
folder: mydoc
layout: page_en
---

    
**Brief Descripion：** 

 Response status 406

 406 Failed to pass authorization.
 
 Please check for any problem below:

 a：General parameter is not passed

 b：Authentication header is not set

 c：Incorrect method to pass parameter

 d：Incorrect signature value

```
1：Incorrect signature algorithm causes incorrect signature value. 
2：Signature algorithm is correct, but the order of parameters for signature algorithm disagrees with the order of interface parameter,causing authorization failure.
```
 
 For details, please click [common reference](instruction_en.html).



