# Tunnels
## Protocols
- HTTP
- HTTPS
  - [Trojan](https://trojan-gfw.github.io/trojan/protocol)
  - NaiveProxy
- SOCKS
  - SOCKS4
    - SOCKS4a
  - SOCKS5
- [Shadowsocks (SS)](#shadowsocks)
  - ShadowsocksR (SSR)
- [VMess](https://www.v2ray.com/developer/protocols/vmess.html)  
- [VLESS](https://xtls.github.io/config/features/vless.html)  
- QUIC
  - [Hysteria](#hysteria)
  - TUIC
- [REALITY](https://github.com/XTLS/REALITY)
  - [如何找到一个适合 REALITY 配置的目标网站？ - Issue #2005 - XTLS/Xray-core](https://github.com/XTLS/Xray-core/issues/2005)
- Snell
- [Tor](https://github.com/torproject/torspec/blob/main/tor-spec.txt)
- MTProto (Telegram only)

[硬核翻墙系列5：协议分析 - 万人往 - Medium](https://medium.com/@kathylynch87532/%E7%A1%AC%E6%A0%B8%E7%BF%BB%E5%A2%99%E7%B3%BB%E5%88%975-%E5%8D%8F%E8%AE%AE%E5%88%86%E6%9E%90-e59e6802c332)

[为什么不应该用 SSL 翻墙](https://gist.github.com/clowwindy/5947691)

需要有效 TLS 证书的协议能间接用作证书有效性监测。

Discussions:
- 2022-11 [又疯了一个 ip，🧱墙太可恶了 - V2EX](https://v2ex.com/t/895000)
- 2023-01 [有使用hysteria被疯的兄弟吗？关于hysteria和naiveproxy-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-1124064-1-1.html)
  - NaiveProxy, Hysteria, Trojan
  - > 正如江湖传言，hysteria是真快，快的一逼，同一台机器，比我之前的xray和naiveproxy快了2到3倍（网上有人测出快了10倍）
  - > naiveproxy刚被封两台,症状跟SS一样,先是封端口,然后封IP.
- 2023-03 [各种梯子协议层出不穷，有兄弟可以总结一下它们的优劣势吗？ - V2EX](https://www.v2ex.com/t/924742)
- 2023-05 [现在用啥不容易被封IP-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-1171806-1-1.html)
  > 自从用了naive和hysteria就没被封过端口和ip
- 2023-11 [这几种新的翻墙协议各有什么优点和差别？ - 新-品葱](https://pincong.rocks/question/63476)

### [Shadowsocks](https://shadowsocks.org/guide/what-is-shadowsocks.html)
- Ciphers: `chacha20-ietf-poly1305`, `aes-256-gcm`, `aes-128-gcm`
- 很容易导致 IP 被墙

Servers:
- [Shadowsocks](https://shadowsocks.org/) (discontinued)
  
  Administrative tools:
  - [网络跳越一键脚本](https://github.com/hijkpw/scripts/tree/master)
    - [hijk.sh](https://github.com/Miuzarte/hijk.sh)
      ```sh
      bash <(curl -sL https://raw.githubusercontent.com/Miuzarte/hijk.sh/main/Fixed/ss.sh)
      ```
- [shadowsocks-rust: A Rust port of shadowsocks](https://github.com/shadowsocks/shadowsocks-rust)
  - `scoop install shadowsocks-rust`
  - Memory: 6~12 MiB on Windows
  
  [ShadowSocks Rust的配置与优化 | 郝锡强的博客](https://blog.substitute.tech/blog/20220506-shadowsocks-rust.html)

  [Shadowsocks常用的几种配置 - Hogwarts](https://www.winamp.top/271.html)

  [shadowsocks rust openwrt配置](https://chuxi.github.io/posts/shadowsocks-rust-openwrt/)

- [shadowsocks-libev](https://github.com/shadowsocks/shadowsocks-libev) (discontinued)
- [go-shadowsocks2: Modern Shadowsocks in Go](https://github.com/shadowsocks/go-shadowsocks2) (inactive)

Clients:
- [shadowsocks-windows: A C# port of shadowsocks](https://github.com/shadowsocks/shadowsocks-windows) (discontinued)
  - `scoop install shadowsocks`
- Clash

Discussions:
- 2020-03 [请问搬瓦工IP被墙，大概多久放出来。-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-658800-1-1.html)
  > 用AEAD 插件simple-obfs 或者v2ray-plugin被封的概率要低太多
- 2022-11 [小鸡全部被墙，原版ss已经末路了吗？-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-1102924-1-1.html)

### [Hysteria](https://github.com/apernet/hysteria/blob/master/PROTOCOL.md)
- [Hysteria 是多倍发包吗？ - Hysteria 2](https://v2.hysteria.network/zh/docs/misc/Hysteria-Brutal/)
- 需要域名、未过期的 TLS 证书

Servers:
- [Hysteria](https://github.com/HyNetwork/hysteria)
  - `scoop install hysteria`
  - [速度测试 - Hysteria 2](https://v2.hysteria.network/zh/docs/advanced/Speed-Test/)
  - [端口跳跃 - Hysteria 2](https://v2.hysteria.network/zh/docs/advanced/Port-Hopping/)
  - Windows 上可能因为操作 conhost 导致阻塞

Clients:
- [Hysteria](https://github.com/HyNetwork/hysteria)
  - [hysteria2-python: Python bindings for hysteria2.](https://github.com/LorenEteval/hysteria2-python)
- [Clash.Meta](https://wiki.metacubex.one/config/proxies/hysteria/)
  - Cert verify problem
  
    Cert verify 至少在 Android 上的实现有问题，可通过 `skip-cert-verify: true` 跳过。

    <details>

    - 兼容性不太好，Clash 本身 / Tun 模式都可能导致连接失败，可以使用官方 Hysteria 进行排错
    - Android: ["测速" 和 "代理集" 以及网络问题 - Discussion #305](https://github.com/MetaCubeX/ClashMetaForAndroid/discussions/305)
  
    [hysteria, 用户在首次链接的时候报WARNING\[TCP\] dial GENERAL (match Match()) to zerossl.crt.sectigo.com:80 error: CRYPTO\_ERROR (0x12a): x509: "USERTrust ECC Certification Authority" certificate is not standards compliant - Issue #265 - MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo/issues/265)
    </details>
- ClashRS
- sing-box
  - sing-box
  - NekoBox for Android: 可跳过证书验证
  - Hiddify-Next

[第三方应用 - Hysteria 2](https://v2.hysteria.network/zh/docs/getting-started/3rd-party-apps/)

Discussions:
- 2022-04 [使用 Hysteria 的感受 - V2EX](https://www.v2ex.com/t/844842)
  
  > 以前一直是在 N1 盒子上面用 Xray 的 XTLS ，然而即使是如此 nb 的协议，也奈何不了偶尔 443 端口被掐的情况。而且 TCP 握手起来也比较慢，再加上买的 VPS 性能也不强，所以也就处于勉强能用的级别。 最近换到 Hysteria ，明显丝滑了很多，油管分数从 8 千涨至 4 万，体验非常好。 虽说老生常谈 UDP 有被运营商 QoS 的问题，但是近期使用下来感觉不是很明显。（自己加了个 100Mbps 的限速，基本都能稳定达标）

- 2022-04 [Hysteria 关于各大运营商的UDP限速问题。 - VPS综合讨论 - 全球主机交流论坛备用站 - HOSTLOC.NET](https://www.hostloc.net/thread-107337-1-1.html)

- 2022-04 [卷的要死！连斯巴达都被 Hysteria 拉下水了-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-1003846-1-1.html)

- 2023-10 [请教作者带宽设置问题 - Issue #779 - apernet/hysteria](https://github.com/apernet/hysteria/issues/779)

  > 最近使用上，非上网高峰用BBR比较稳反而Brutal协议会降速，在晚上高峰丢包时用Brutal协议更好yt的缓冲进度条明显更快，但测试过几次，Brutal协议用久了就被QOS几率比较大。目前干脆直接用BBR了  
  > 2.2.0似乎很稳，最近用了很长一段时间一直流畅没被Qos

- 2024-07 [hysteria被封了？以下是应对方法-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-1327368-1-1.html)
  > hysteria特征特异性太明显了，尤其是垃圾vps突然爆出大量访问很容易被track。reality Tls vision也有不少问题，但是偷跑tls风险能被均摊，如果封杀1000会导致自损800，国内也有不少甚至政府条线用cloudflare，最终还得自己的客户端做好鉴权保持最新版本。

  > 确定跟SNI有关系吗？hy被封没见过是直接被高墙封的，要不是就是被当地运营商针对udp被qos了，要不就是服务器提供商误判为滥用或受攻击（多倍发包）封机器。感觉把客户端的up和down设置低点，比啥都有效。个人习惯设成50MB，两个GCP上都跑了hy，至今啥事没有。

- 2024-07 [建议 Xray 支持 Hysteria 协议 - Issue #3547 - XTLS/Xray-core](https://github.com/XTLS/Xray-core/issues/3547)

  > 我使用 VPS 自建节点（成本在40美元/年），但是 IP 被封是常见的事情，天天换 IP 根本不现实，所以挂 Cloudflare 是必然选择。但后果就是晚上网速非常慢，看YouTube 视频更是不用想。而 Hysteria2 则解决了这个问题，让我很烂的 VPS 也可以在晚上发挥作用。

## Servers
- [V2Ray](https://github.com/v2fly/v2ray-core)
  
  Supported protocols: HTTP, SOCKS, Shadowsocks, VMess, VLESS, Trojan, MTProto
  - [Xray](https://github.com/XTLS/Xray-core)
    - Supported protocols: HTTP, SOCKS, Shadowsocks, VMess, VLESS, Trojan
    - `scoop install xray`

  Administrative tools:
  - `scoop install v2ray`
  - [v2ray-agent](https://github.com/mack-a/v2ray-agent)
    - [搭建最新的Vision和Reality防止VPS端口封禁 - mack-a](https://www.v2ray-agent.com/archives/1680104902581)
  - [233boy/v2ray](https://github.com/233boy/v2ray/tree/master)
  - [multi-v2ray: v2ray/xray多用户管理部署程序](https://github.com/Jrohy/multi-v2ray)
    - 流量统计
  - [Xray 基于 Nginx 的 VLESS + XTLS 一键安装脚本](https://github.com/wulabing/Xray_onekey)
  - [V2Ray 基于 Nginx 的 vmess+ws+tls 一键安装脚本](https://github.com/wulabing/V2Ray_ws-tls_bash_onekey)
  - Web
    - [x-ui: 支持多协议多用户的 xray 面板](https://github.com/vaxilu/x-ui)
      - [xray-ui](https://github.com/qist/xray-ui)
    - [V2bX: 一个基于多种内核的V2board节点服务端，修改自XrayR](https://github.com/wyx2685/V2bX)

- [sing-box: The universal proxy platform](https://github.com/SagerNet/sing-box)
  - `scoop install sing-box`
  - [BoxXt/installReality: Reality 小白一键安装脚本](https://github.com/BoxXt/installReality)
    - [sbox-reality: 基于 Sing-box 内核的 VLESS Reality 协议脚本](https://github.com/Misaka-blog/sbox-reality)
  - [sing-REALITY-Box: One click REALITY installer on sing-box core](https://github.com/deathline94/sing-REALITY-Box)

- [Hiddify-Manager: multi-user anti-filtering panel, with an effortless installation and supporting more than 20 protocols to circumvent filtering plus the telegram proxy.](https://github.com/hiddify/Hiddify-Manager)

- [gost: GO Simple Tunnel - a simple tunnel written in golang](https://github.com/go-gost/gost)

Trojan-only:
- [Trojan](https://github.com/trojan-gfw/trojan) (discontinued)
  - `scoop install trojan`
- [Trojan-Go](https://github.com/p4gefau1t/trojan-go) (discontinued)

NaiveProxy-only:
- [NaiveProxy Server: Caddy with forward proxy](https://github.com/jonssonyan/naive)

MTProto-only:
- [mtg](https://github.com/9seconds/mtg)
- [Async MTProto Proxy](https://github.com/alexbers/mtprotoproxy)
- [Erlang mtproto proxy](https://github.com/seriyps/mtproto_proxy)
- [MTProxy](https://github.com/TelegramMessenger/MTProxy) (offcial)
- Administrative tools
  - [MTProxyTLS 一键安装绿色脚本](https://github.com/ellermister/mtproxy)
  - [MTProto Proxy Auto Installer](https://github.com/HirbodBehnam/MTProtoProxyInstaller)
  - [MTProxy v2 One-Click Installation](https://github.com/missuo/MTProxy)
  - [mtg-dist](https://github.com/cutelua/mtg-dist)

Tools:
- [ProxySU: Xray,V2ray，Trojan，NaiveProxy, Trojan-Go, ShadowsocksR(SSR),Shadowsocks-libev及相关插件,MTProto+TLS 一键安装工具，windows下用（一键科学上网）](https://github.com/proxysu/ProxySU)

Performance comparison:
- [Xray/v2ray/trojan/shadowsocks 性能测试](https://github.com/badO1a5A90/Performance)
- [垃圾小鸡的福音---------hysteria协议 - 1024社区](https://1024.day/d/1063)

Windows:
- 2022-07 [Windows VPS节点搭建教程，图形化界面只需点点鼠标即可创建节点，脱离命令行指令，小白首选 - 科学上网 技术分享](https://bulianglin.com/archives/winvps.html)
- 2024-05 [有没有软件能在windows server上架设梯子的-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-1308068-1-1.html)

## Clients
- [Clash](Clash.md)
  
  Supported protocols: HTTP(S), SOCKS5, Shadowsocks(R), VMess, Trojan, Snell

  - Clash.Meta
    - Supported protocols: HTTP(S), SOCKS5, Shadowsocks(R), VMess, VLESS, Trojan, Snell, TUIC, Hysteria

- sing-box

- [Hiddify-Next: Multi-platform auto-proxy client, supporting Sing-box, X-ray, TUIC, Hysteria, Reality, Trojan, SSH etc. It's an open-source, secure and ad-free.](https://github.com/hiddify/hiddify-next)
  - 配置格式: sing-box, Clash, Clash.Meta, V2Ray
  - Flutter

  [Migrate to singbox - hiddify/hiddify-app@684acc5](https://github.com/hiddify/hiddify-app/commit/684acc555db179594cdc13a67bdb65ce54590771)

- [Leaf: A versatile and efficient proxy framework with nice features suitable for various use cases.](https://github.com/eycorsican/leaf)
  - [Maple: A lightweight Universal Windows proxy app based on https://github.com/eycorsican/leaf](https://github.com/YtFlow/Maple)

- [YtFlowCore: A modern proxy framework, core of YtFlow.](https://github.com/YtFlow/YtFlowCore)
  - [YtFlowApp: A network proxy running on Universal Windows Platform, powered by YtFlowCore.](https://github.com/YtFlow/YtFlowApp)

Android:
- [NekoBox for Android: sing-box / universal proxy toolchain for Android](https://github.com/MatsuriDayo/NekoBoxForAndroid)
  - 配置格式: sing-box, Clash, Clash.Meta, v2rayN, SS (不支持 SSR)
  - 可单独统计各节点的使用流量
  - 可能出现测速跑不通，要实际用了才能测

  [NB4A-配置 - MatsuriDayo](https://matsuridayo.github.io/nb4a-configuration/)

## Subscription
Subscription converters:
- [subconverter](https://github.com/tindy2013/subconverter)
  - [sub-web](https://sub-web.netlify.app/) ([GitHub](https://github.com/CareyWang/sub-web))
    - [sub-web-modify (sub.v1.mk)](https://sub.v1.mk/) ([GitHub](https://github.com/youshandefeiyang/sub-web-modify))
    - [ACL4SSR 在线订阅转换](https://acl4ssr-sub.github.io/)
  - [stilleshan/subweb](https://sub.ops.ci/) ([GitHub](https://github.com/stilleshan/subweb))
- [JRQLS/ToClash](https://github.com/JRQLS/ToClash): SS

sing-box:
- [clash2singbox: 将 clash.meta 格式的配置文件或链接转换为 sing-box 格式](https://github.com/xmdhs/clash2singbox)
  - [clash 订阅链接转 sing-box](https://clash2sfa.xmdhs.com/)
