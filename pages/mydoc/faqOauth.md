---
title: 认证问题
last_updated: 2019-11.01
sidebar: mydoc_sidebar
permalink: faqOauth.html
folder: mydoc
---

---

请求接口返回406：表示认证不通过
 
请检查以下项：

- 通用参数未传递
- 未设置认证头
- 参数传递方式不对
- 签名值不对

可能情况：

- 算法不对导致签名值不对。
- 签名算法正确的，但是算签名的参数和传递给接口的参数，顺序不一致，导致认证失败。
 
详情请点击「[通用说明](instruction.html)」查看。



