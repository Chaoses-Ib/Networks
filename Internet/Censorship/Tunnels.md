# Tunnels
## Protocols
- HTTP
- HTTPS
  - [Trojan](https://trojan-gfw.github.io/trojan/protocol)  
- SOCKS
  - SOCKS4
    - SOCKS4a
  - SOCKS5
- [Shadowsocks (SS)](https://shadowsocks.org/guide/what-is-shadowsocks.html)
  - ShadowsocksR (SSR)
- [VMess](https://www.v2ray.com/developer/protocols/vmess.html)  
- [VLESS](https://xtls.github.io/config/features/vless.html)  
- [Hysteria](https://github.com/HyNetwork/hysteria/wiki/Protocol)
- [REALITY](https://github.com/XTLS/REALITY)
  - [如何找到一个适合 REALITY 配置的目标网站？ - Issue #2005 - XTLS/Xray-core](https://github.com/XTLS/Xray-core/issues/2005)
- [Tor](https://github.com/torproject/torspec/blob/main/tor-spec.txt)
- MTProto (Telegram only)

## Servers
- [V2Ray](https://github.com/v2fly/v2ray-core)
  
  Supported protocols: HTTP, SOCKS, Shadowsocks, VMess, VLESS, Trojan, MTProto
  - [Xray](https://github.com/XTLS/Xray-core)

    Supported protocols: HTTP, SOCKS, Shadowsocks, VMess, VLESS, Trojan

  Administrative tools:
  - [v2ray-agent](https://github.com/mack-a/v2ray-agent)
    - [搭建最新的Vision和Reality防止VPS端口封禁 - mack-a](https://www.v2ray-agent.com/archives/1680104902581)
  - [233boy/v2ray](https://github.com/233boy/v2ray/tree/master)
  - [Xray 基于 Nginx 的 VLESS + XTLS 一键安装脚本](https://github.com/wulabing/Xray_onekey)
  - [V2Ray 基于 Nginx 的 vmess+ws+tls 一键安装脚本](https://github.com/wulabing/V2Ray_ws-tls_bash_onekey)
  - REALITY
    - [BoxXt/installReality: Reality 小白一键安装脚本](https://github.com/BoxXt/installReality)

Shadowsocks-only:
- [Shadowsocks](https://shadowsocks.org/)
  
  Administrative tools:
  - [网络跳越一键脚本](https://github.com/hijkpw/scripts/tree/master)
    - [hijk.sh](https://github.com/Miuzarte/hijk.sh)
      ```sh
      bash <(curl -sL https://raw.githubusercontent.com/Miuzarte/hijk.sh/main/Fixed/ss.sh)
      ```

Trojan-only:
- [Trojan](https://github.com/trojan-gfw/trojan)
- [Trojan-Go](https://github.com/p4gefau1t/trojan-go)

Hysteria-only:
- [Hysteria](https://github.com/HyNetwork/hysteria)

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

Performance comparison:
- [Xray/v2ray/trojan/shadowsocks 性能测试](https://github.com/badO1a5A90/Performance)
- [垃圾小鸡的福音---------hysteria协议 - 1024社区](https://1024.day/d/1063)

## Clients
- [Clash](Clash.md)
  
  Supported protocols: HTTP(S), SOCKS5, Shadowsocks(R), VMess, Trojan, Snell

Hysteria-only:
- [Hysteria](https://github.com/HyNetwork/hysteria)

## Subscription
Subscription converters:
- [subconverter](https://github.com/tindy2013/subconverter)
  - [sub-web](https://sub-web.netlify.app/) ([GitHub](https://github.com/CareyWang/sub-web))
    - [sub-web-modify (sub.v1.mk)](https://sub.v1.mk/) ([GitHub](https://github.com/youshandefeiyang/sub-web-modify))
    - [ACL4SSR 在线订阅转换](https://acl4ssr-sub.github.io/)
  - [stilleshan/subweb](https://sub.ops.ci/) ([GitHub](https://github.com/stilleshan/subweb))