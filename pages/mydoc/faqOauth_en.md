---
title: Authentication
last_updated: 2020-02-10
sidebar: mydoc_en_sidebar
permalink: faqOauth_en.html
folder: mydoc
layout: page_en
---

Response status 406： Failed to pass authorization.

Please check for any problem below:

- General parameter is not passed
- Authentication header is not set
- Incorrect method to pass parameter
- Incorrect signature value

Potential Cause：

- Incorrect signature algorithm causes incorrect signature value. 
- Signature algorithm is correct, but the order of parameters for signature algorithm disagrees with the order of Interface parameter,causing authorization failure.

For details, please click 'general reference' to check.



