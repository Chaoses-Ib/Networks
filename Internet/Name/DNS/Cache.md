# Cache
[linux - Force dig to resolve without using cache - Server Fault](https://serverfault.com/questions/372066/force-dig-to-resolve-without-using-cache)
> There is no mechanism in the DNS protocol to force a nameserver to respond without using its cache. DNS *does* include a way to tell a server not to use recursion, but this isn't what you want. That's only useful when you want to directly query an authoritative nameserver.
>
> If you wanted to stop a nameserver from responding from its cache, you'd only be able to do that by altering the configuration *on the nameserver*, but if you don't control the nameserver, this is impossible.
>
> You can, however, get dig to *bypass* the configured nameservers, and perform its own recursive request which goes back to the root servers. To do this, use the `+trace` option. In practice since this will only query the authoritative servers rather than your local caching resolver, the result won't be stale even if those servers employ internal caching. The added benefit of using `+trace` is that you get to see all of the separate requests made along the path.

> DNS 缓存这块在 RFC 上可以查看到推荐做法，应用缓存，系统缓存，网关（ DNS 服务器）缓存都是存在的，TTL 下发也有滞后，而且国内还多一个 DNS 劫持问题。

[域名过期导致的一系列问题 | 新溪blog](https://blog.zhaoweiguo.com/2019/03/10/question-dns-domain-expired/)

[阿里云DNS专家，手把手教你定位域名解析不生效域名解析不生效、ping域名IP地址不正确、网站打不开，你是否还在为这些问 - 掘金](https://juejin.cn/post/6844903491563962382)

[使用运营商默认的 dns 好流畅啊 - V2EX](https://v2ex.com/t/1065412)

[Clash DNS的运行特点 | 异域茶壶的神秘庄园](https://teapotium.com/2024/11/clash-dns-running-features/)

## Optimistic DNS
[RFC 8767: Serving Stale Data to Improve DNS Resiliency](https://www.rfc-editor.org/rfc/rfc8767)

[有没有自动更新缓存的 DNS Server？ - V2EX](https://v2ex.com/t/860548)
> 有缓存的 DNS server 可以立刻给客户端返回结果，减少了请求 DNS 上游的时间，这个请求时间在 DNS over TLS 或者 DNS over HTTPS 上尤其长，我的平均时间是 300~400ms ，最大有 800ms ，在翻墙代理延迟 80ms 的情况下。
> 
> 如果只增加 DNS 缓存时间而不自动更新会造成有些域名的 IP 不能及时更新，尤其是利用 DNS load balance 的，比如 Google 系的各种服务。

> When the local DNS cache expires, Adguard Home can continue answer with the IP in the local cache results with 1 TTL, while a new DNS query is made to update the cache. If client can still connect to the server by using the old results, then that's great and reduces the time waiting for DNS query. And if not, after a short TTL, the new DNS result can be sent to client and reconnect again.

[乐观 DNS 缓存那些事 -- 我们的小屋 | happylife -- Django](https://lovelyping.com/?p=279)
> 约60%的运营商递归 DNS 开启了乐观 DNS
>
> RFC8767 中的对乐观 DNS 行为的是只有权威 DNS 解析失败时， 比如DDoS 攻击、网络等其他原因导致的超时、REFUSE等错误时才向客户端应答过期的缓存记录数据，而目前部分国内支持乐观 DNS 行为的递归 DNS 则不关注权威应答成功或失败，直接给客户端应答缓存中的过期记录，再去异步向权威查询。
>
> 最大过期时间（A maximum stale timer）即 TTL 过期多长时间内可以继续应答过期的记录，RFC 的建议是 1 -- 3 天，而目前部分国内递归 DNS 在实践中该时间是无限的。
>
> **过期的解析记录在递归 DNS 缓存中可能长期（数小时、数天、甚至数月）无法刷新**，还可能解析到旧的记录，尤其是对平时解析量不大的冷域名，此时过期的记录很可能早已无法访问。

Tools:
- Clash
- Adguard Home
- [mosdns: 一个 DNS 转发器](https://github.com/IrineSistiana/mosdns)
- [dnscache: Simple DNS proxy with forced caching](https://github.com/vi/dnscache)
- [ErisMik/ovenrack: DNS/DoT/DoH proxy & prefetch cache: Keep your pi(-hole)s warm!](https://github.com/ErisMik/ovenrack)

Circumvention:
- 提前修改解析记录/保留旧IP一段时间

  > 即使保留 3 天的缓存，也不能保证完全刷新掉旧的IP

- 直接查询 authoritative nameserver

- 使用未开启乐观 DNS 的 公共DNS

- 刷新递归 DNS 缓存
  - 联系运营商主动刷新缓存

    > - 价格很贵：三大运营商的缓存刷新服务一般为数千元/次，可以刷新某域名在本运营商所有省份的递归 DNS 缓存，如重大业务重大故障的切换需要刷新可以考虑使用，但是如果普通的切换也使用的话则明显成本太高。
    > - 使用不便：一般需要单独联系各个渠道去购买或使用该功能，缺少一键全量刷新的手段。
    > - 覆盖不全：除了三大运营商外，其他中小运营商和公共 DNS 很少提供公开的缓存刷新服务。
  
  - 通过拨测客户端被动刷新缓存
    > - 公开免费的拨测工具对各种递归 DNS 的覆盖度不够完整。
    > - 使用商业拨测工具大量拨测的价格也不低。

## ISPs
[中国电信DNS缓存刷新简介及操作指南\_云解析DNS(DNS)-阿里云帮助中心](https://help.aliyun.com/zh/dns/dns-cache-refresh-for-china-unicom)
> 首先当解析记录变更时，因为会受TTL、运营商DNS缓存未到期等影响，所以会导致解析生效慢，而使用中国电信DNS缓存刷新，则可以在电信运营商DNS端即时的清除本地缓存信息，并获取最新的解析结果，从而达到电信运营商侧的解析快速生效。
>
> 中国电信运营商DNS刷新，不代表域名全网生效，仅限电信侧运营商DNS的缓存刷新与快速生效，其他运营商DNS或公共DNS的本地刷新暂不支持。

> 该产品为预付费资源包，7000元/次

[使用阿里云 运营商DNS缓存刷新功能，解决容灾问题-阿里云开发者社区](https://developer.aliyun.com/article/1361794)

## OS
### Windows
- Flush
  - `ipconfig /flushdns`
  - `Invoke-CimMethod -Namespace root/StandardCimv2 -ClassName MSFT_DNSClientCache -MethodName Clear`

  [How to clear/flush the DNS cache? (Windows) - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/how-to-clear-flush-the-dns-cache-windows/91103)

## Web browsers
[对于有缓存的页面，打开时浏览器会去查 DNS 吗 - V2EX](https://www.v2ex.com/t/626936)

> 有没有想过浏览器会强制 1TTL 缓存 60 秒？而且多子域名每个第一次打开都是上次的记录又要等 60 秒？

## DNS spoofing
[Wikipedia](https://en.wikipedia.org/wiki/DNS_spoofing)
