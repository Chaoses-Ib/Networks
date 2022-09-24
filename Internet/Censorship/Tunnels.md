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
- [Tor](https://github.com/torproject/torspec/blob/main/tor-spec.txt)

## Servers
- [V2Ray](https://github.com/v2fly/v2ray-core)  
  Supported protocols: HTTP, SOCKS, Shadowsocks, VMess, VLESS, Trojan
  - [Xray](https://github.com/XTLS/Xray-core)  
    Supported protocols: HTTP, SOCKS, Shadowsocks, VMess, VLESS, Trojan

  Administrative tools:
  - [v2ray-agent](https://github.com/mack-a/v2ray-agent)
  - [233boy/v2ray](https://github.com/233boy/v2ray/tree/master)
  - [Xray 基于 Nginx 的 VLESS + XTLS 一键安装脚本](https://github.com/wulabing/Xray_onekey)
  - [V2Ray 基于 Nginx 的 vmess+ws+tls 一键安装脚本](https://github.com/wulabing/V2Ray_ws-tls_bash_onekey)

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

Performance comparison:
- [Xray/v2ray/trojan/shadowsocks 性能测试](https://github.com/badO1a5A90/Performance)

## Clients
- [Clash: A rule-based tunnel in Go](https://github.com/Dreamacro/clash)  
  Supported protocols: HTTP(S), SOCKS5, Shadowsocks(R), VMess, Trojan, Snell
  
  GUIs:
  - [Clash for Windows](https://github.com/Fndroid/clash_for_windows_pkg)
  - [Clash for Android](https://github.com/Kr328/ClashForAndroid)

## Subscription
Subscription converters:
- [subconverter](https://github.com/tindy2013/subconverter)
  - [sub-web](https://sub-web.netlify.app/) ([GitHub](https://github.com/CareyWang/sub-web))
    - [sub-web-modify (sub.v1.mk)](https://sub.v1.mk/) ([GitHub](https://github.com/youshandefeiyang/sub-web-modify))
    - [ACL4SSR 在线订阅转换](https://acl4ssr-sub.github.io/)
  - [stilleshan/subweb](https://sub.ops.ci/) ([GitHub](https://github.com/stilleshan/subweb))