# DNS Hosting Services
[Wikipedia](https://en.wikipedia.org/wiki/DNS_hosting_service)

- 2020-10 [国外大厂，能够免费托管 DNS 解析服务的，推荐几个。 - V2EX](https://www.v2ex.com/t/714360)
- 2022-04 [盘点十大免费DNS域名解析服务：稳定、可靠 - A5站长网](https://www.admin5.com/article/20220402/1013640.shtml)
- 2023-07 [请问DNS相关](https://www.nodeseek.com/post-16487-1)
- 2023-12 [国内有没有类似于cf这种域名托管网站](https://www.nodeseek.com/post-44083-1)

## 分线路解析
- NS1
- 阿里云
- 腾讯云

Discussions:
- 2018-08 [cloudflare如何智能解析？-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-467595-1-1.html)
- 2021-09 [CF是否可以分线路解析-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-888823-1-1.html)

  > 没有，除了国内的DNS，外国的DNS基本上都没有这个选项

## Cloudflare
- CDN & DDoS protection
- API
- 免费版只能托管根域名
  - 2022-10 [cname 接入不能用了，直接 ns 接入是否有坑？ - V2EX](https://cn.v2ex.com/t/891207)
    > 部分地区访问国外权威 DNS 会不稳定（地方运营商 DNS 服务器也要过地方墙），可以说有点但影响不是很大

    > 如果不用 ddns 应该没问题，但 ddns 更新慢

    > cf 的自定义主机名就是一种变通的 cname 接入方式。用一个 ns 接入 cf 的域名作为跳板，使没有 ns 接入 cf 的域名也能以 cname 跳转的方式蹭上 cf 的流量代理。配合 dnspod 同样可以做境内+境外分区解析。
  - 2024-04 [境内外流量分线路解析，同时使用 Cloudflare 和国内 CDN - 白鱼小栈](https://www.baiyuyu.com/5280.html)
  - 2024-07 [请教 Cloudflare 域名托管解析问题 - V2EX](https://www.v2ex.com/t/1061413)
- 不支持分线路解析

[建站小记：迁移域名DNS到CloudFlareCloudFlare一直有赛博菩萨之称，据说用它做DNS解析服务又快又好又 - 掘金](https://juejin.cn/post/7385778376276148265)

- 2019-03 [Cloudflare的DNS解析速度-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://www.hostloc.me/thread-528058-1-1.html)
  > 生效快，但是解析要1s左右，有些地区会炸到10s左右
  
  > 看你什么站了，要求响应超快的站，当cf有点炸的时候就不如国内那些了。我说的炸不是CDN炸，是DNS炸。当然DNS的特性决定炸了也没什么，但是上述那种情况，习惯了高速流畅的人是可以感觉到的，但影响不是很大，你可以权衡下。我个人认为没事。

- 2019-08 [不能迷信cloudflare | The Mirages](https://blog.timoq.com/2019/08/29/%E4%B8%8D%E8%83%BD%E8%BF%B7%E4%BF%A1cloudflare/)

- 2023-03 [域名放在Cloudflare作为DNS解析，当用户访问时，解析速度会慢?-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-1152403-1-1.html)

  > 速度跟你托管在哪没啥关系，相反我认为修改解析后cf的生效速度是最快的。dnspod经常改了以后还要等半天。

- 2023-10 [把博客站点交给了 Cloudflare 托管 - Leo's blog](https://leonis.cc/sui-sui-nian/2023-10-31-cloudflare-dns-of-blog.html)

  > 此前我也担心 Cloudflare 的 DNS 解析会不会也像其 CDN 一样龟速，幸好解析速度并不慢，我的担心是多虑了。

  > Cloudflare 总体来说还是很好用的，提供了很多有意思的功能，很便利地就能体验，免去了自己动手配置的烦恼。Cloudflare 的不足仅在于在国内有时访问不畅，添加 DNS 记录后也要等比较长的时间才会更新到国内网络上，若能接受这两点，Cloudflare 的可玩性还是比其他平台更高的。

- 2024-02 [cf上解析的域名刚刚突然失效，本站也打不开，就只有我这样吗？ - 开发调优 - LINUX DO](https://linux.do/t/topic/12335)

- 2024-04 [在Cloudflare托管域名？无法摆脱的CF解析两大坑！ - 雾里](https://woolio.cn/archives/2051/)
  - 无法自定义域名的 DNS 服务器
  - 无法关闭的根域名 CNAME 拉平

- 2024-06 [生产域名 DNS 托管到 cloudflare 可靠吗？ - V2EX](https://v2ex.com/t/1053422)

  > 不可靠，CF 在大陆是“不听话的孩子”，动不动就搞点问题出来。比如本月初，就出现了广东移动和福建移动的 DNS 服务器和 CF 的部分权威服务器通讯出问题，导致广东和福建的移动用户无法解析托管在 CF 上的域名。
  > 
  > 还有一点就是，CF 在国内是不直接运营的，京东云负责他们的运营，但京东云不提供直接面向终端用户的服务，所以中国的 CF 出了问题，技术支持响应特别慢，你要给 cf 提单，cf 找京东云，京东云响应了之后反馈给 cf ，然后 cf 再反馈给你

- 2024-06 [小白关于域名托管提问 - 开发调优 - LINUX DO](https://linux.do/t/topic/105367)

  > dns解析一般会向运营商请求ip ，而运营商会继续向上级请求，经过层层请求获取到域名的ip 。
  > 
  > 腾讯 DNSPod 公共 DNS 配置了 Anycast，节点囊括了腾讯云所有可用区的节点（包括海外），所以速度还是不错的，并且除了支持 ECS 以外还有一些关于 DNS 出口选择优化的加成，所以 CDN 解析结果相对准确很多。
  > 
  > 当 Cloudflare 从 APNIC 手上接过 1.0.0.0/24 和 1.1.1.0/24 并架设了公共 DNS 以后，得益于 Cloudflare 全球 160+ 数据中心（Cloudflare 拥有 185+ 数据中心，但其公共 DNS 并没有部署在百度云加速的节点上）、BGP Anycast 和 Cloudflare Argo 等技术，成功超越 OpenDNS 成为了世界上最快的公共 DNS（数据来自 DNSPerf），还支持 DoT、DoH 等常见加密解析方案。由于其隐私政策，Cloudflare 公共 DNS 不记录用户 IP，意味着无法使用 ECS 等技术，不过仗着节点数量众多、DNS 出口覆盖全球各大区域，也适合作为主力 DNS。
  > 
  > 上面都是复制大佬文章的，关于在于解析的响应，cf家在国内有部署机器，并不会有差距。正常域名解析后都有tts缓存，所以比较不同服务商域名解析花的时间可以忽略不计。

- 2024-09 [域名 DNS 托管 | LearnData 开源笔记](https://newzone.top/deploy/DNS.html)

## 阿里云
> 阿里云的 DNS 解析在各方面的体验都很不错，例如修改配置后就能很快更新、配置平台访问速度快、站点不会被国内的运营商污染等等，这些优点反过来可是说尽是 Cloudflare 的缺点。

[《DNS稳定保障系列4--阿里云DNS稳定性武功秘籍揭秘》 - 知乎](https://zhuanlan.zhihu.com/p/99516129)

[公网权威解析免费版和付费版DNS的差别\_云解析DNS(DNS)-阿里云帮助中心](https://help.aliyun.com/zh/dns/details)

免费版：
- Record types: A, AAAA, CNAME, NS, MX, SRV, TXT (512), CAA, 显性URL, 隐性URL, SVCB, HTTPS
- DNS集群：国内4个，境外0个（海外域名解析慢）
- dns(1-32).hichina.com, ns(1-8).alidns.com
- 无 cache，修改后可即时查询到新的 record
- DNS解析峰值: 不超过2万次/秒

个人版：
- 【基础能力】支持设置A、AAAA、CNAME、MX、NS、TXT、SRV、CAA类型记录，支持IPv4、IPv6、域名等类型地址按轮询/权重规则解析应答；
- 【智能解析】（1）运营商线路：支持按联通、电信、移动、教育网、鹏博士、广电网智能解析，但不细分到省份；（2）海外地区线路：支持，但不细分到大洲、国家；（3）阿里云线路：不支持；（4）自定义线路：不支持；
- 【URL转发】每个一级域提供5条301/302 HTTP跳转；
- 【TTL缓存】解析记录缓存更新时间最快10分钟（TTL 600秒）；
- 【DNSSEC】支持开启DNSSEC防止DNS欺骗和缓存污染（但不支持子域名托管使用DNSSEC）；
- 【解析记录备份】不支持；

企业标准版：
- 【智能解析】（1）运营商线路：支持按联通、电信、移动、教育网、鹏博士、广电网智能解析，细分到省份；（2）海外地区线路：支持，细分到大洲、国家；（3）阿里云线路：支持，细分到各个地区；（4）自定义线路：不支持；
- 【URL转发】每个一级域提供10条301/302 HTTP跳转；
- 【TTL缓存】解析记录缓存更新时间最快1分钟（TTL 60秒）；
- 【DNSSEC】支持开启DNSSEC防止DNS欺骗和缓存污染（但不支持子域名托管使用DNSSEC）；
- 【解析记录备份】支持DNS记录每天备份和一键恢复；

企业旗舰版：
- 【智能解析】（1）运营商线路：支持按联通、电信、移动、教育网、鹏博士、广电网智能解析，细分到省份；（2）海外地区线路：支持，细分到大洲、国家；（3）阿里云线路：支持，细分到各个地区；（4）自定义线路：支持自定义IP地址范围智能解析；
- 【TTL缓存】解析记录缓存更新时间最快1秒（TTL 1秒）；
- 【解析记录备份】支持DNS记录每小时备份和一键恢复；
- 【辅助DNS】支持Slave DNS与自建DNS进行主从同步；

DNS攻击防御

[阿里云DNS服务器地址大全（免费+付费） -- 阿里云百科](https://www.aliyunbaike.com/dns/4856/)

API: [通过阿里云CLI,OpenAPI Explorer和SDK调用DNS API-阿里云帮助中心](https://help.aliyun.com/zh/dns/quick-start-1)

Tools:
- [yyqian/aliyun-ddns: 利用阿里云解析的 API 实现动态域名解析的功能](https://github.com/yyqian/aliyun-ddns)
- Python: [使用阿里云 DNS API 实现 DDNS | 汪广鑫の小pò站](https://wgxls.site/posts/aliyundnsapi-ddns/)
- [ljwlaji/AliyunDDNS: 利用阿里云的DNS API 实现自动解析DNS的功能](https://github.com/ljwlaji/AliyunDDNS)

## 腾讯云
[移动解析HttpDNS\_移动互联网域名解析\_域名防劫持-腾讯云](https://cloud.tencent.com/product/httpdns)
> 移动解析 HTTPDNS 基于 HTTP 协议向腾讯云的 DNS 服务器发送域名解析请求，是面向多端应用，包括移动端APP/PC客户端应用的域名解析服务，可以避免**域名劫持和跨网访问问题**，实现精准调度，解决移动互联网服务中域名解析异常带来的困扰。

> HTTPDNS 目的在于解决移动互联网中 DNS 解析异常、域名劫持的问题：
> - 移动 DNS 的现状：运营商 LocalDNS 出口根据权威 DNS 目标 IP 地址进行 NAT，或将解析请求转发到其他 DNS 服务器，导致权威 DNS 无法正确识别运营商的 LocalDNS IP，引发域名解析错误、流量跨网。
> - 域名被劫持的后果：网站无法访问（无法连接服务器）、访问到钓鱼网站等。
> - 解析结果跨域、跨省、跨运营商、国家的后果：网站访问缓慢甚至无法访问。
