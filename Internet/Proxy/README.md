# Proxy Servers
[Wikipedia](https://en.wikipedia.org/wiki/Proxy_server)

## Proxy protocols
- HTTP
- HTTPS
- SOCKS
  - SOCKS4
    - SOCKS4a
  - SOCKS5

### Original clients
- HTTP
  - `X-Forwarded-For` ([Wikipedia](https://en.wikipedia.org/wiki/X-Forwarded-For))
    ```http
    X-Forwarded-For: client, proxy1, proxy2
    ```
    ```http
    X-Forwarded-For: 203.0.113.195, 70.41.3.18, 150.172.238.178
    X-Forwarded-For: 203.0.113.195
    X-Forwarded-For: 2001:db8:85a3:8d3:1319:8a2e:370:7348
    ```
  - `X-Real-IP`
  - `Forwarded`
    ```http
    Forwarded: for=192.0.2.60;proto=http;by=203.0.113.43
    Forwarded: for="[2001:db8::1234]"
    ```

- PROXY protocol
  - [mmproxy-rs: Rust implementation of TCP + UDP Proxy Protocol (aka. MMProxy)](https://github.com/saiko-tech/mmproxy-rs)

[Security 101: X-Forwarded-For vs. Forwarded vs PROXY | System Overlord](https://systemoverlord.com/2020/03/25/security-101-x-forwarded-for-vs-forwarded-vs-proxy.html)

[http - Difference between X-Forwarded-For and X-Real-IP headers - Stack Overflow](https://stackoverflow.com/questions/72557636/difference-between-x-forwarded-for-and-x-real-ip-headers)

[X-Real-IP should probably be preferred over X-Forwarded-For in \_extraClientIP directive? - Issue #1670 - akka/akka-http](https://github.com/akka/akka-http/issues/1670)

## Libraries
Rust:
- [→Pingora](Pingora.md)
- Realm
- [relayport-rs: Rust library for relaying network traffic.](https://github.com/mtelahun/relayport-rs)

## Tools
- Linux: iptables/nftables

- Windows: netsh

- [→Nginx](/Application/HTTP/Servers/Nginx/README.md)
  - HTTP, TCP, UDP (Linux)
  - Listen port range

- [Envoy: Cloud-native high-performance edge/middle/service proxy](https://github.com/envoyproxy/envoy)
  - HTTP, [UDP](https://www.envoyproxy.io/docs/envoy/latest/configuration/listeners/udp_filters/udp_proxy)

- [HAProxy - The Reliable, High Perf. TCP/HTTP Load Balancer](https://www.haproxy.org/)
  - TCP, HTTP, UDP (Paid)

    [Haproxy support udp - Help! - HAProxy community](https://discourse.haproxy.org/t/haproxy-support-udp/10147)

- [Realm: A network relay tool](https://github.com/zhboner/realm)
  - TCP, UDP
  - Listen port range
    - [如果我一个服务器的两个端口分别转发到不同服务器的不同端口怎么设置 - Issue #41 - zhboner/realm](https://github.com/zhboner/realm/issues/41)
  - ~~[大量 FIN\_WAIT2 状态的 TCP 连接不会被切断 - Issue #87 - zhboner/realm](https://github.com/zhboner/realm/issues/87)~~
  - Rust
  - `scoop install realm`

  [一个全新的流量转发工具:Realm | 刺客博客 - 刺客博客](https://cikeblog.com/realm.html)

  [改了一点realm , 顺便说说目前常见的转发工具-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-837814-1-1.html)

- [rsproxy: A simple, command-line TCP/UDP proxy server](https://github.com/neosmart/rsproxy) (discontinued)

- [rinetd: 📡 TCP/UDP port redirector](https://github.com/samhocevar/rinetd) (discontinued)
  - [rinetd.conf](https://github.com/samhocevar/rinetd/blob/main/rinetd.conf)

- [GOST: GO Simple Tunnel - a simple tunnel written in golang](https://github.com/ginuerzh/gost)
  - TCP, UDP

- [NPS: 一款轻量级、高性能、功能强大的内网穿透代理服务器。支持tcp、udp、socks5、http等几乎所有流量转发，可用来访问内网网站、本地支付接口调试、ssh访问、远程桌面，内网dns解析、内网socks5代理等等......，并带有功能强大的web管理端。a lightweight, high-performance, powerful intranet penetration proxy server, with a powerful web management terminal.](https://github.com/ehang-io/nps) (discontinued)
  - Go
  - [端口范围映射](https://ehang-io.github.io/nps/#/feature?id=%e7%ab%af%e5%8f%a3%e8%8c%83%e5%9b%b4%e6%98%a0%e5%b0%84)

UDP:
- [udpproxy: Cross-platform UDP proxy](https://github.com/neosmart/udpproxy) (discontinued)

[drivers - Proxifier that supports UDP? - Super User](https://superuser.com/questions/264486/proxifier-that-supports-udp)

HTTP:
- [traefik: The Cloud Native Application Proxy](https://github.com/traefik/traefik)
  - Go

  [Is is just me but Traefik is so hard to understand : r/selfhosted](https://www.reddit.com/r/selfhosted/comments/1cmbl22/is_is_just_me_but_traefik_is_so_hard_to_understand/)
- [Sōzu: HTTP reverse proxy, configurable at runtime, fast and safe, built in Rust. It is awesome!](https://github.com/sozu-proxy/sozu)
- [Weldr: A HTTP 1.1 proxy written in Rust using tokio.](https://github.com/hjr3/weldr) (discontinued)

[各种端口转发工具的使用方法 - Y4er的博客](https://y4er.com/posts/port-forwarding/)

[linux - How can I set a proxy for Wget? - Stack Overflow](https://stackoverflow.com/questions/11211705/how-can-i-set-a-proxy-for-wget)

## Services
Name | HTTP | SOCKS | Comment
--- | --- | --- | ---
[站大爷](https://www.zdaye.com/) | ✔️ | ✔️3~6min 700元/mo, 2~48h 2500元/mo
[Proxy-Tools.com](https://cn.proxy-tools.com/) | ✔️ | ✔️ | 免费
[Proxy-Seller.com](https://proxy-seller.com/zh/) | ✔️ | ✔️~$1/IP
[亿牛云](https://www.16yun.cn/help/ss_detail/) | ✔️400+元/mo | | 延迟低
[66代理](http://www.66daili.cn/) | ✔️80元/mo | 定制 | 带宽大
~~蘑菇代理~~ | | | 带宽大
~~梦代理~~ |
[亮数据](https://www.bright.cn/proxy-types)

[永久免费公共代理池 (proxy.scdn.io)](https://proxy.scdn.io/)

See also [ISP servers](../Internet%20Service%20Providers.md#servers).