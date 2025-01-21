# Content Delivery Networks
[Wikipedia](https://en.wikipedia.org/wiki/Content_delivery_network)

A **content delivery network (content distribution network, CDN)** is a geographically distributed network of proxy servers and their data centers. The goal is to provide high availability and performance by distributing the service spatially relative to end users.

[网站10倍速度优化比较 ------ CDN gulp压缩 cloudflare js/css分离 Hexo 加速 | MindSpark](https://wivwiv.com/post/speed-up-website-loading/)
> 国内的大多数如腾讯云 CDN 有一定的免费额度，本站目前每月享受免费 10GB 流量，对于个人站点绰绰有余，奈何腾讯云 CDN 需要域名”备案”，无法直接加速。

[网站动态内容太多了， CDN 加速简直就是杯水车薪 - V2EX](https://www.v2ex.com/t/1086066)

如果网站的访问频率很低，有可能导致缓存经常失效，需要回源，反而降低了访问速度。

## Services
- [Cloudflare](#cloudflare)

China:
- [阿里云](#阿里云)
- 腾讯云
- 华为云
- 百度云
  - ~~[百度云加速](https://su.baidu.com/)~~
  - [百度云防护](https://console.bce.baidu.com/cdn/#/cdn/security/scdn/intro)

    非按量计费

  [百度云防护百度云加速WEB应用防火墙WAFDDOS防御-云加速](https://www.yunjiasu.cc/shangdian/81.html)
- 网宿

融合：
- 七牛云

  > 免费额度：注册账号实名认证，每个月有 10G 的免费 HTTP 流量，因为不支持 HTTPS，因此忽略。另外还有 5 万次动态加速请求数。
- 又拍云
- [→多吉云](#多吉云)
- [缤纷云 Bitiful - 强大低成本的对象存储和CDN服务](https://www.bitiful.com/)
  - 免费：50GB 存储 + 30GB 流量/月 + 20 万次请求/月
  - 公益：提供 50G~5000G/月 的存储与流量支持
- 蓝易云
- 火山云

[V2EX › CDN](https://v2ex.com/go/cdn)

Discussions:
- 2019-02 [源站服务器在国外，使用国内 CDN 差别大吗？ - V2EX](https://www.v2ex.com/t/538159)
- 2019-08 [50%国外， 50%国内的业务，应该选择国内 CDN 还是国外 CDN？ - V2EX](https://v2ex.com/t/595021)
- 2019-08 [CDN 被访问了 1962.34 万次，是什么情况 - V2EX](https://www.v2ex.com/t/590677)
- 2020-01 [静态站点欲试用全球加速的 CDN，哪家强？ - V2EX](https://www.v2ex.com/t/639894)
- 2021-12 [国内对象存储/CDN服务价格横评 - Oskyla 烹茶室](https://frytea.com/archives/614/)

  多吉云 << 百度云 < 腾讯云 < 阿里云 < 七牛云 < 又拍云

- 2022-01 [现在大家选择对象存储和 CDN 加速 一般选择哪家？七牛云这个注册免费送每月 10GB 存储空间+20GB CDN 流量（含 10GB https 流量）还有吸引力吗？ - V2EX](https://www.v2ex.com/t/830301)
- 2022-11 [国外服务器加国内 cdn，面向国内用户使用，这样会有什么问题吗？ - V2EX](https://www.v2ex.com/t/892729)
- 2023-01 [博客接入CDN的折腾-对阿里云七牛云蓝易云多吉云几家CDN使用评测 | 二丫讲梵](https://wiki.eryajf.net/pages/1a0733/)

  > 阿里云的产品成熟度自然不用质疑，产品使用上基本上符合常规的直观认知，速度也非常优秀。
  > 
  > 个人诉求中的第一项完全没问题，但是后两项则让我一直苦恼，首先是资费问题，阿里云的 CDN 对于个人博客用户来讲，确实是太贵了，因为博客流量不算小，最开始试水的充值很快不够。在我觉得，阿里 CDN 除去流量包之外，还会再收取 `后付费` (我都不懂这是什么费用)的费用，而这个费用则非常不清晰，且我这边看到每个月也有不少的花费在这上边。除去买流量包的费用，多的时候，一个月还要再支出大几十块钱的后付费，这是我一个个人博客无法承担的。
  > 
  > 另外第三项控制规则中，阿里云 CDN 仅支持超出部分禁用 CDN，询问过客户经理，目前就是这样子的。

- 2023-05 [支持 IPv6 回源的国内 CDN 有哪些？ - V2EX](https://www.v2ex.com/t/942069)
- 2023-11 [现在哪个融合 cdn 好？ - V2EX](https://www.v2ex.com/t/988658)
- 2023-12 [国内一欠费就会停机的 CDN - V2EX](https://v2ex.com/t/1000377)
- 2024-01 [如何选择CDN和云计算服务？推荐建站工具介绍 - 网络大玩家-永久免费 v2ray 节点](https://www.easyvpn24.com/34764.html)
- 2024-05 [公司的阿里云 CDN 每晚都在被偷偷刷量 - V2EX](https://www.v2ex.com/t/1045318)

  > 一种可能是一些地方运营商在刷，他们好像会有跨省结算的问题，会通过刷流量来打平内部账单

  [公告 - 多吉云](https://www.dogecloud.com/announcement/26)
- 2024-06 [静态文件每个月 6 TB 流量，有没有什么国内比较便宜的 CDN 推荐 - V2EX](https://v2ex.com/t/1051186)
- 2024-09 [国内云 cdn 为什么不能通过内网回源？ - V2EX](https://www.v2ex.com/t/1075579)
- 2024-10 [国内 CDN 如何做选择？七牛云/阿里云/腾讯云/百度云，想听听有经验的大佬的建议，最近网站的静态文件部署服务上加载都很慢，打算上一下 CDN，免费 CDN cloudflare 效果试了下不太好，可能因为在国内的原因 - V2EX](https://www.v2ex.com/t/1081756)

### [Cloudflare](https://www.cloudflare.com/)
[Wikipedia](https://en.wikipedia.org/wiki/Cloudflare)

[【网络】Cloudflare for SaaS回源配置及优选IP提高网站访问速度-凡心小站](https://blog.2020111.xyz/archives/20240330.html)
- [【网络】双域名同时托管Cloudflare SaaS加速解决方案-凡心小站](https://blog.2020111.xyz/archives/20240518.html) ([什么值得买](https://post.smzdm.com/p/aov495g7/))

Tools:
- [CloudflareSpeedTest: 🌩「自选优选 IP」测试 Cloudflare CDN 延迟和速度，获取最快 IP ！当然也支持其他 CDN / 网站 IP ~](https://github.com/XIU2/CloudflareSpeedTest)
- [xingpingcn/enhanced-FaaS-in-China: 提升部署在cloudflare、vercel或netlify的网页在中国的访问速度和稳定性 Improve the access speed and stability in China of web pages hosted on cloudflare, vercel or netlify by merely changing your CNAME record. cf优选域名 | cf优选ip | cloudflare | vercel | netlify | 加速 | 国内 | 中国 | 境内 | 大陆](https://github.com/xingpingcn/enhanced-FaaS-in-China)

- 2022-04 [境内境外部署多线CDN及官方方式免费CNAME接入Cloudflare - 珂泽小站](https://www.kezez.com/archives/134.html)
- 2022-08 [「CloudFlare」新版官方免费CNAME接入教程 - 九月的风](https://sep.cc/cloudflare-cname.html)

  > 由于 CloudFlare 的 NS 服务器在国外，所以就有了CNAME 接入这种方式，利用国内第三方DNS，可以达到分线路解析的目的，境内解析到腾讯云、阿里云等源服务器，境外解析到CloudFlare节点来提升网站体验。
  > 
  > 从2021年11月开始，CloudFlare禁用了Partner使用的zone_setAPI以避免滥用（因为该API接入不需要验证域名所有权），通过Partner实现CNAME接入的方式近乎落幕，似乎有网友表示收到邮件提醒在2022年11月开始将全面停止第三方Partner接入，包括存量接入也一并清退，目前尚不知此消息是否可靠，以官方通告为准。
  > 
  > 2022 年 3 月份，CloudFlare 宣布更改了 CloudFlare for SaaS 的收费策略，每个账户可以有 100 个域名免费额度，我们所依赖这个功能所提供的免费额度，来实现免费 CNAME接入。

- [CloudFlare for SaaS 官方免费CNAME接入/自定义节点（CF自选IP）教程 -- 萌精灵](https://www.moeelf.com/archives/305.html)

- 2023-12 [Cloudflare 三网优选教程 - 0Blog](https://zil.ing/posts/cf%E4%BC%98%E9%80%89%E6%95%99%E7%A8%8B)
- 2024-02 [不懂就问：套cf之后网站变慢了，优选IP应该如何操作？ - 开发调优 - LINUX DO](https://linux.do/t/topic/12050)

  > 迷糊就对了:joy: 很多人都懵逼。其实理解了就好了，怎么添加回退域名、验证就不说了一搜一大把，简单的说假设你回退域名是black.a.com，它指向的是你想解析到的IP；自定义主机名就是你想让用户访问的域名。（经验来谈，自定义主机名这个域名最好别放在CF，因为它会cname拉平导致无法访问）你要做的就是把这个自定义主机名的域名进行分线路，假设你自定义主机名绑定的是1.b.com，你要先做一个cname解析指向black.a.com，然后去cf去看是否俩绿灯，是就是成功了，然后cf这边就不用管了，再去你1.b.com的托管平台暂停第一次的cname解析，然后添加优选域名的解析操作就好了，比如1.b.com A 104.18.2.161 搞定。

- 2024-03 [网站使用 CloudFlare 优选域名的方法 - 宝塔迷](https://www.baota.me/post-433.html)

- 2024-05 [【已解决】疑问，cf 优选ip设置相关问题](https://www.nodeseek.com/post-110003-1)

  > 主域名不能在cf 会冲突 这不是你要不要分线路解析的问题  
  > 你不要分线路解析就把主域名托管到国外别的dns商去 反正不能在cf  
  > 
  > 而且不分解析线路的话 cf查起来发现你不是cname的它 等着吃警告吧  
  > 也不存在一个ip就能通杀国内各地区各运营商的优选ip

- 2024-09 [CloudFlare pages 能否搭配国内 cdn 比如腾讯云的 cdn 使用？ - V2EX](https://www.v2ex.com/t/1071779)

### 阿里云
[CDN\_内容分发网络\_CDN网站加速-阿里云](https://www.aliyun.com/product/cdn)

[全站加速DCDN\_动态加速\_智能路由-阿里云](https://www.aliyun.com/product/dcdn)

![](https://img.alicdn.com/tfs/TB1HUimTNv1gK0jSZFFXXb0sXXa-1296-472.png)

- [CDN、DCDN、ESA的区别](https://help.aliyun.com/zh/cdn/product-overview/what-is-alibaba-cloud-cdn#section-dl1-ajo-7uc)
  - DCDN = CDN + 智能路由 + 私有协议加速

- DCDN 动态请求仍然不如直连阿里云 VPS 快（0.8 << 1.4s），静态请求可能也不如（0.07 << 0.35s）

- 缓存
  - 自适应缓存

    > 开启后，全站加速会根据源站缓存规则进行缓存，但无法保证百分百遵循源站的缓存规则，若需完全遵循源站的缓存规则或完全遵循全站加速的缓存规则，请指定静态文件类型。

    默认**不开启**，很可能是为了多计费（动态请求的价格是静态的3倍）。

  - 刷新：需要指定 URL、目录或正则
  - 预热：只能指定 URL
  - 复制配置

  命中率可在业务监控中查看。

- 实时监控

  `近x小时` 是指载入页面时间的近x个小时，不是点击查询时的。

- Gzip/Brotli 压缩

  > 源站开启了压缩功能，且服务端响应中携带了响应头`Content-Encoding`，则DCDN的压缩功能将不再生效。

- 页面优化

  > 如果您同时开启了页面优化和压缩功能（Gzip压缩或者Brotli压缩），页面优化功能将会失效，DCDN只会对文件进行压缩。

- WebSocket

  > 注意：开启Websocket时，请务必确认已经关闭HTTP2.0，同时确认已经开启动态加速。

- IPv6
  
  > 开启后，IPv6的客户端请求将支持以IPv6协议访问DCDN，DCDN也将携带IPv6的客户端IP信息访问您的源站。

  默认开启

- 日志管理
  - 离线日志：30天
  - 实时日志（付费）

- 运营报表
  - PV/UV
  - 地区和运营商
  - 域名排行
  - 热门 Referer
  - 热门 URL
  - Top 客户端 IP

[阿里云系列（七） CDN - 有小熊陪着你看月亮 - 博客园](https://www.cnblogs.com/mayongjie/p/15336757.html)

[CDN加速ECS资源的原理和实现方法\_CDN(CDN)-阿里云帮助中心](https://help.aliyun.com/zh/cdn/use-cases/use-alibaba-cloud-cdn-to-accelerate-the-retrieval-of-resources-from-an-ecs-instance)

Pricing:
- [CDN](https://www.aliyun.com/price/product#/cdn/detail/cdn)：网络流量（或带宽）+ HTTPS 静态请求数 + 增值服务
  - 动态请求不计费，但静态 HTTPS 请求仍然计费

- [DCDN](https://www.aliyun.com/price/product#/dcdn/detail/dcdnpaybag)：网络流量（或带宽）+ 请求数 + 增值服务
  - 网络流量（或带宽）包含：按流量计费或按日带宽峰值计费，这两种计费方式任选。
  - 请求数费用包含：动态请求数计费，如果开启了HTTPS加速，还会包含HTTPS请求数费用。
    - 动态请求的价格是静态的3倍
  - 增值服务费：若开启QUIC、实时日志等服务，则会产生增值服务费。

  按流量计费并不意味着请求次数不计费。不过一般请求数费用会比流量费用低很多（0.48 >> 0.02元）。

- HTTP/3 额外计费，HTTP/2 免费

- [CDN加速OSS计费说明\_CDN(CDN)-阿里云帮助中心](https://help.aliyun.com/zh/cdn/product-overview/billing-of-oss-content-acceleration)
  - CDN下行流量费：用户从CDN节点请求资源，节点将资源下发给客户端时产生的流量费用；流量从CDN流向客户端，消耗的流量由CDN计费。
  - CDN节点回源到OSS产生的流量，不计费。
  - OSS流出到CDN节点产生的流量费：流量从OSS流向CDN，由OSS计费。

  [阿里 云如果同时用了它家的全站加速 CDN 和 ECS 用了按流量计费，那流量是 CDN+ECS 双重计费呢还是 ECS 的出流量不计费？ - V2EX](https://v2ex.com/t/764690)

- Security
  - Referer 防盗链

    默认不开启

    > 配置Referer防盗链后，黑名单中的请求仍可访问到DCDN节点，但会被DCDN节点拒绝并返回403状态码，DCDN日志中仍会记录客户端的请求记录。
    > 
    > 由于Referer防盗链功能TTP请求头中Referer字段（例如，Referer黑白名单）来设置访问控制规则，因此在黑名单中的请求被DCDN节点拦截的同时，会产生少量的流量费用，如果客户端使用HTTPS协议访问，还会产生HTTPS请求数费用（因为拦截黑名单中请求的时候，也同时消耗了DCDN节点的处理资源）。

  - User-Agent 黑白名单

    `this-is-empty-ua`

    > 如果您需要对用户请求中不携带 User-Agent 请求头的情况做访问控制，目前UA黑白名单功能暂不支持。您可以通过边缘脚本功能来实现。

  - IP 黑白名单
  - [带宽封顶](https://www.alibabacloud.com/help/zh/cdn/user-guide/configure-bandwidth-caps)

    > 由于域名带宽的监控数据存在一定延迟（大约10分钟），实际带宽达到阈值大约10分钟后，域名才会被下线，域名下线前产生的流量、带宽、请求数等资源消耗将会正常计费。

    > 不支持，CDN无法设置流量上限。
  - WAF
    - [如何配置自定义防护策略实现CC防护\_边缘安全加速(ESA)-阿里云帮助中心](https://help.aliyun.com/zh/edge-security-acceleration/dcdn/user-guide/prevent-http-flood-attacks)
    - [如何配置自定义防护策略防DCDN被盗刷量\_边缘安全加速(ESA)-阿里云帮助中心](https://help.aliyun.com/zh/edge-security-acceleration/dcdn/user-guide/prevent-click-farming)
  - DDoS 防护：10000元/月起步

  [防范流量盗刷最佳实践\_CDN(CDN)-阿里云帮助中心](https://help.aliyun.com/zh/cdn/use-cases/best-practices-for-preventing-traffic-theft)

- 突发带宽

  > 符合以下情况之一的都属于“突发带宽”：
  > - 带宽计费/流量计费客户：本自然月带宽增量超过500Gbps，或上个自然月带宽峰值为0，本自然月带宽增量超过200Gbps；不符合上述标准，但本自然月的带宽增量超出上月计费带宽的30%（另有约定的，从其约定）；
  > - 流量计费客户：本自然月的带宽峰值超过10Gbps。

  > 如果您对DCDN服务有突发带宽使用需求，您需提前至少3个工作日（重大节日的突发，包括但不限于春晚，双十一等，需要提前至少1个月）联系阿里云申请突发带宽用量。若申请成功，在双方约定的突发量级内，可确保您的服务不受影响；若申请不成功或未申请的，则对于突发带宽，阿里云有权采取限流等措施来保障全网用户的稳定性，由此导致的可用性问题，阿里云不承担责任。

- [欠费说明\_边缘安全加速(ESA)-阿里云帮助中心](https://help.aliyun.com/zh/edge-security-acceleration/dcdn/product-overview/overdue-payments)

- [CDN 被人恶意刷流量，让本不富裕的我雪上加霜](https://www.idcbuy.net/industry/3217.html)

  > 阿里云针对后付费服务给每个用户设定了不同的额度，所幸我的额度不高，因此达到额度之后就直接停止服务了，没有造成一夜之间债台高筑的后果。

- 2022-04 [阿里云 CDN 被攻击，一早起来欠费 600 多停机了 - V2EX](https://v2ex.com/t/848720)

  > 可以换腾讯云，腾讯云 CDN 去年上线流量封顶功能，可以针对域名按小时、自然天进行流量封顶，超过阈值自动关闭服务或者回源，而且 HTTPS 请求不单独收费（这个阿里云单独收费，流量还可以通过带宽封顶限制，这个连限制都没有，无效 HTTPS 请求也计费）

- 2024-06 [阿里云 DCDN 全站加速，会不断的做高频健康检查，以无法察觉的方式，吃掉源站流量（特别是按流量计算的） - V2EX](https://www.v2ex.com/t/1049896)

- 账单详情的表格有点离谱，列那么多列宽还那么大，横向滚动5屏才能看完
