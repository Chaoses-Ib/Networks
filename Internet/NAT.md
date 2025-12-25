# Network Address Translation (NAT)
[Wikipedia](https://en.wikipedia.org/wiki/Network_address_translation)

[为什么我更想要FullCone网络 - CyanFalse's HomeRegion](https://blog.eurekac.cn/p/daa17206.html)

> As of 2006, roughly 70% of the clients in peer-to-peer (P2P) networks employed some form of NAT.

## Types
- Endpoint-Independent NAT, Full Cone NAT, 1:1/one-to-one NAT, or NAT 1
- Address-Dependent NAT, Restricted Cone NAT, or NAT 2
- Address and Port-Dependent NAT, Port Restricted Cone NAT, or NAT 3
- Address and Port-Dependent NAT, Symmetric NAT, or NAT 4

Tools:
- [HMBSbige/NatTypeTester: 测试当前网络的 NAT 类型（STUN）](https://github.com/HMBSbige/NatTypeTester)
  ```pwsh
  scoop bucket add kkzzhizhou_scoop-apps https://github.com/kkzzhizhou/scoop-apps
  scoop install kkzzhizhou_scoop-apps/nattypetester
  ```
  [NatTypeTester - lsgxeva - 博客园](https://www.cnblogs.com/lsgxeva/p/16464140.html)
- [talkiq/pystun3: A Python STUN client for getting NAT type and external IP](https://github.com/talkiq/pystun3)
- [Check My NAT](https://www.checkmynat.com/)

[2个检测局域网NAT类型的小工具\_软件应用\_什么值得买](https://post.smzdm.com/p/akk5mn0r/)

### Carrier-grade NAT (NAT444)
[Wikipedia](https://en.wikipedia.org/wiki/Carrier-grade_NAT)

China:
- 2023-04 [移动将向全国推广 nat4 移动家宽神话将不复存在 - V2EX](https://www.v2ex.com/t/934435)
- 2023-05 [河南移动全线转入NAT4 - 未知狐的小窝](https://xfox.fun/archives/1445/)
  - 光猫桥接 NAT4
- 2024-03 [移动宽带没有公网，NAT1和NAT4的区别是什么？](https://www.nodeseek.com/post-80842-1)
- 2024-10 [NAT4 是不是告别了 PCDN 了？ - V2EX](https://www.v2ex.com/t/1083097)
- 2025-02 [移动宽带拆机要收违约金，求个成本最低的 PCDN 方案？ - V2EX](https://www.v2ex.com/t/1113412)

#### NAT4444
China:
- 2022-08 [关于运营商分配假公网 IP 的问题 - V2EX](https://www.v2ex.com/t/875867)

## NAT traversal
[Wikipedia](https://en.wikipedia.org/wiki/NAT_traversal)

[The State of NAT Traversal - ZeroTier](https://www.zerotier.com/blog/the-state-of-nat-traversal/)

[How NAT traversal works](https://tailscale.com/blog/how-nat-traversal-works)
> tailscale 的长文，一层一层由浅入深介绍了有状态防火墙的原理、如何穿透防火墙、NAT 的性质及分类、一些 NAT 穿透的技巧（比如基于生日悖论在一方同时开 256 个端口另一方去扫描，利用端口映射协议 UPnP IGD / NAT-PMP / PCP 帮助穿透，运营商级 NAT / CGNAT 借助中间层 NAT 进行直连，IPv6，借助 NAT64 发现公网 ipv4:port 等等），最后利用 交互式连接创建（ICE）协议 综合上述各种情况发现的可能 ip:ports，结合一些启发式算法进行路径发现、建立连接并保持连接。当然还提到了一些安全性的策略，比如上层协议需要有自己的安全性，还必须确保至少有端到端身份验证，还包括对于路径发现的数据包进行验证和加密等。

Tools:
- [frp: A fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet.](https://github.com/fatedier/frp)
- [rathole: A lightweight and high-performance reverse proxy for NAT traversal, written in Rust. An alternative to frp and ngrok.](https://github.com/rapiz1/rathole)
  - Inactive
  - `lib.rs`
  - `scoop install rathole`
  - `wget https://ghfast.top/https://github.com/rathole-org/rathole/releases/download/v0.5.0/rathole-x86_64-unknown-linux-gnu.zip`

  [rathole - 一个轻量级开源内网穿透工具，高吞吐、低占用，类 frp 工具 - 大家的板块 / 青蛙的应用 - 小众软件官方论坛](https://meta.appinn.net/t/topic/75337)
- [EasyTier: A simple, decentralized mesh VPN with WireGuard support.](https://github.com/EasyTier/Easytier)

  > 只適合海外的網絡環境 國内別説公網IP了 P2P一堆都打不起來

  > tailscale用了一年多 用于公司远程串流回家里PC打游戏 最近感觉被qos了 延迟会无规律暴增 切换到easytier后 开启kcp代理 别说 比ddns映射端口延迟都稳  
  > 跟tailscale一样支持子网代理 两边的openwrt路由一开 搞定
- [ngrok | API Gateway, Kubernetes Ingress, Webhook Gateway](https://ngrok.com/)
- tailscale

  [没有公网IP也可以当BT赛博菩萨](https://blog.mistivia.com/posts/2024-01-28-bt/)

Discussions:
- 2022-10 [有没有 傻瓜式的软件可以在没有公网 ip 的情况 实现 微软 远程桌面 - V2EX](https://www.v2ex.com/t/885731)
- 2024-01 [Expose a service behind a restrictive firewall with Fast reverse proxy (FRP) and a VM in a VPS : r/selfhosted](https://www.reddit.com/r/selfhosted/comments/19bbloa/expose_a_service_behind_a_restrictive_firewall/)

### Hole punching
[Wikipedia](https://en.wikipedia.org/wiki/Hole_punching_(networking))

[TCP hole punching - Wikipedia](https://en.wikipedia.org/wiki/TCP_hole_punching)

[UDP hole punching does not work with all types of NAT, e.g. symmetric NAT where ... | Hacker News](https://news.ycombinator.com/item?id=7498143)

#### STUN
[Wikipedia](https://en.wikipedia.org/wiki/STUN)

[pradt2/always-online-stun: A list of publicly available STUN servers, refreshed every hour.](https://github.com/pradt2/always-online-stun)

## BT
[通过 NAT TCP 打洞使 qBittorrent 获得公网 IPv4 的连接性体验](https://myth.cx/p/qbittorrent-nat-tcp-hole-punching/)
> 对于 BT 这种使用模式，只有完全圆锥形 NAT/Full Cone NAT 可以尝试穿越。不同 Peer 客户端的 IP 不同，如果限制 IP 地址，Peer 就无法进行连接。

- 2020-09 [没有公网 IP， Aria2 BT 下载，上传流量是传给谁了？ - V2EX](https://v2ex.com/t/709784)
- 2023-08 [没有公网ip可不可以上传文件呢 - 比特彗星(BitComet) - 彗星論壇](https://www.cometbbs.com/t/%E6%B2%A1%E6%9C%89%E5%85%AC%E7%BD%91ip%E5%8F%AF%E4%B8%8D%E5%8F%AF%E4%BB%A5%E4%B8%8A%E4%BC%A0%E6%96%87%E4%BB%B6%E5%91%A2/87904)
