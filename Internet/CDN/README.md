# Content Delivery Networks
[Wikipedia](https://en.wikipedia.org/wiki/Content_delivery_network)

A **content delivery network (content distribution network, CDN)** is a geographically distributed network of proxy servers and their data centers. The goal is to provide high availability and performance by distributing the service spatially relative to end users.

[网站10倍速度优化比较 ------ CDN gulp压缩 cloudflare js/css分离 Hexo 加速 | MindSpark](https://wivwiv.com/post/speed-up-website-loading/)
> 国内的大多数如腾讯云 CDN 有一定的免费额度，本站目前每月享受免费 10GB 流量，对于个人站点绰绰有余，奈何腾讯云 CDN 需要域名”备案”，无法直接加速。

[网站动态内容太多了， CDN 加速简直就是杯水车薪 - V2EX](https://www.v2ex.com/t/1086066)

如果网站的访问频率很低，有可能导致缓存经常失效，需要回源，反而降低了访问速度。

## Services
- [Cloudflare](#cloudflare)

[→China CDNs](China.md)

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
