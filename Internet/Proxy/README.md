# Proxy Servers
[Wikipedia](https://en.wikipedia.org/wiki/Proxy_server)

- Cross-protocol proxy is not widely supported

## Proxy protocols
- HTTP
- HTTPS
- [SOCKS](SOCKS.typ)
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

- [PROXY protocol](#proxy-protocol)

[Security 101: X-Forwarded-For vs. Forwarded vs PROXY | System Overlord](https://systemoverlord.com/2020/03/25/security-101-x-forwarded-for-vs-forwarded-vs-proxy.html)

[http - Difference between X-Forwarded-For and X-Real-IP headers - Stack Overflow](https://stackoverflow.com/questions/72557636/difference-between-x-forwarded-for-and-x-real-ip-headers)

[X-Real-IP should probably be preferred over X-Forwarded-For in \_extraClientIP directive? - Issue #1670 - akka/akka-http](https://github.com/akka/akka-http/issues/1670)

#### PROXY protocol
[haproxy.org/download/1.8/doc/proxy-protocol.txt](https://www.haproxy.org/download/1.8/doc/proxy-protocol.txt)
- Human-readable header format (Version 1): `PROXY TCP4 255.255.255.255 255.255.255.255 65535 65535\r\n`
- Binary header format (version 2)
  ```c
  struct proxy_hdr_v2 {
      uint8_t sig[12];  /* hex 0D 0A 0D 0A 00 0D 0A 51 55 49 54 0A */
      uint8_t ver_cmd;  /* protocol version and command */
      uint8_t fam;      /* protocol family and address */
      uint16_t len;     /* number of following bytes part of the header */
  };
  union proxy_addr {
      struct {        /* for TCP/UDP over IPv4, len = 12 */
          uint32_t src_addr;
          uint32_t dst_addr;
          uint16_t src_port;
          uint16_t dst_port;
      } ipv4_addr;
      struct {        /* for TCP/UDP over IPv6, len = 36 */
            uint8_t  src_addr[16];
            uint8_t  dst_addr[16];
            uint16_t src_port;
            uint16_t dst_port;
      } ipv6_addr;
      struct {        /* for AF_UNIX sockets, len = 216 */
            uint8_t src_addr[108];
            uint8_t dst_addr[108];
      } unix_addr;
  };
  ```

[Use the PROXY protocol to preserve a client's IP address](https://www.haproxy.com/blog/use-the-proxy-protocol-to-preserve-a-clients-ip-address)

- [Nginx](../../Application/HTTP/Servers/Nginx/README.md#stream)
  - `listen 80 proxy_protocol;`
  - [`proxy_protocol on;`](https://nginx.org/en/docs/stream/ngx_stream_proxy_module.html#proxy_protocol)
    - v1
    - v2: [#1639 (Add support for writing PROXY protocol v2 to upstream) -- nginx](https://trac.nginx.org/nginx/ticket/1639)

  [Accepting the PROXY Protocol | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/load-balancer/using-proxy-protocol/)
- [cloudflare/mmproxy: the magical PROXY protocol gateway](https://github.com/cloudflare/mmproxy)

  > mmproxy sits near the application, receives the proxy-protocol enabled connections from the load balancer, spoofs the client IP addresses, and sends traffic directly to the application. From application point of view the traffic look identically like it would have originated from the remote client.

  - Linux only

    [mmproxy alternative for Windows](https://www.windowsphoneinfo.com/threads/mmproxy-alternative-for-windows.1017579/)

  Ports:
  - Rust
    - [mmproxy-rs: Rust implementation of TCP + UDP Proxy Protocol (aka. MMProxy)](https://github.com/saiko-tech/mmproxy-rs)
    - [b23r0/udppp: Rust implementation of UDP protocol MMProxy](https://github.com/b23r0/udppp)
  - Go: [path-network/go-mmproxy: Golang implementation of MMProxy](https://github.com/path-network/go-mmproxy)

Rust:
- [ppp: A Proxy Protocol Parser written in Rust.](https://github.com/misalcedo/ppp)
  - TLV fields
- [proxy-protocol: HAProxy PROXY protocol implementation in Rust.](https://github.com/Proximyst/proxy-protocol) (inactive)
  - Used by Realm (v2 by default)
- [proxy-header: Parser and encoder for HAProxy PROXY protocol](https://github.com/tibordp/proxy-header)
  - [TLV](https://docs.rs/proxy-header/latest/proxy_header/enum.Tlv.html) enums
  - [`ParseConfig`](https://docs.rs/proxy-header/latest/proxy_header/struct.ParseConfig.html)
  - [`ProxiedStream`](https://docs.rs/proxy-header/latest/proxy_header/io/index.html)
    - [`ProxiedStream` with optional header - Issue #4](https://github.com/tibordp/proxy-header/issues/4)

      > This method will read from the stream until a proxy header is found, or the stream is closed. If the stream is closed before a proxy header is found, this method will return an [`io::Error`](https://doc.rust-lang.org/nightly/std/io/error/struct.Error.html "struct std::io::error::Error") with [`io::ErrorKind::UnexpectedEof`](https://doc.rust-lang.org/nightly/std/io/error/enum.ErrorKind.html#variant.UnexpectedEof "variant std::io::error::ErrorKind::UnexpectedEof").
  - Used by proxide
- [ikkerens/fake\_haproxy: A connection forwarder that adds a haproxy v1 header to every connection](https://github.com/ikkerens/fake_haproxy)

Go:
- [go-proxyproto: A Go library implementation of the PROXY protocol, versions 1 and 2.](https://github.com/pires/go-proxyproto)

## Libraries
Rust:
- [→Pingora](Pingora/README.typ)
- Oxy

  [Oxy](https://blog.cloudflare.com/tag/oxy/)

  [Oxy is Cloudflare's Rust-based next generation proxy framework](https://blog.cloudflare.com/introducing-oxy/)
- rpxy-l4
  - Protocol demultiplexing
- [proxide: The rust reverse proxy server](https://github.com/ramiroaisen/proxide)
- Realm
- X1r0z/pivot-rs
- [relayport-rs: Rust library for relaying network traffic.](https://github.com/mtelahun/relayport-rs)

## Tools
- Linux: [iptables/nftables](#iptablesnftables)

- Windows: netsh

- SSH

- [→Nginx](/Application/HTTP/Servers/Nginx/README.md#stream)
  - HTTP, TCP, UDP (Linux)
    - Cannot proxy TCP to HTTP or vice versa

      [ruby on rails - Forward TCP connection to HTTP on Nginx - Stack Overflow](https://stackoverflow.com/questions/15193239/forward-tcp-connection-to-http-on-nginx)

      [tcp to http proxy via nginx - Server Fault](https://serverfault.com/questions/1020333/tcp-to-http-proxy-via-nginx)
    - [Bridge between quic stream and tcp - Issue #146](https://github.com/nginx/nginx/issues/146)
  - Listen port range
  - [nginx\_tcp\_proxy\_module: add the feature of tcp proxy with nginx, with health check and status monitor](https://github.com/yaoweibin/nginx_tcp_proxy_module)

- [Envoy: Cloud-native high-performance edge/middle/service proxy](https://github.com/envoyproxy/envoy)
  - HTTP, [UDP](https://www.envoyproxy.io/docs/envoy/latest/configuration/listeners/udp_filters/udp_proxy)

- [HAProxy - The Reliable, High Perf. TCP/HTTP Load Balancer](https://www.haproxy.org/)
  - TCP, HTTP, UDP (Paid)

    [Haproxy support udp - Help! - HAProxy community](https://discourse.haproxy.org/t/haproxy-support-udp/10147)
  - [Upstream http proxy support - Issue #1542 - haproxy/haproxy](https://github.com/haproxy/haproxy/issues/1542)

- [bytedance/G3: Enterprise-oriented Generic Proxy Solutions](https://github.com/bytedance/g3)

- [Realm: A network relay tool](https://github.com/zhboner/realm)
  - TCP, UDP
  - Listen port range
    - [如果我一个服务器的两个端口分别转发到不同服务器的不同端口怎么设置 - Issue #41 - zhboner/realm](https://github.com/zhboner/realm/issues/41)
  - ~~[大量 FIN\_WAIT2 状态的 TCP 连接不会被切断 - Issue #87 - zhboner/realm](https://github.com/zhboner/realm/issues/87)~~
  - Rust
  - `scoop install realm`

  [一个全新的流量转发工具:Realm | 刺客博客 - 刺客博客](https://cikeblog.com/realm.html)

  [改了一点realm , 顺便说说目前常见的转发工具-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-837814-1-1.html)
- [X1r0z/pivot-rs: A lightweight port-forwarding and socks proxy tool written in Rust 🦀](https://github.com/X1r0z/pivot-rs)

- [rsproxy: A simple, command-line TCP/UDP proxy server](https://github.com/neosmart/rsproxy) (discontinued)
- [r2lay: A simple TCP relay made in Rust](https://github.com/fusetim/r2lay)

- [rinetd: 📡 TCP/UDP port redirector](https://github.com/samhocevar/rinetd) (discontinued)
  - [rinetd.conf](https://github.com/samhocevar/rinetd/blob/main/rinetd.conf)

- [GOST: GO Simple Tunnel - a simple tunnel written in golang](https://github.com/ginuerzh/gost)
  - TCP, UDP

- [NPS: 一款轻量级、高性能、功能强大的内网穿透代理服务器。支持tcp、udp、socks5、http等几乎所有流量转发，可用来访问内网网站、本地支付接口调试、ssh访问、远程桌面，内网dns解析、内网socks5代理等等......，并带有功能强大的web管理端。a lightweight, high-performance, powerful intranet penetration proxy server, with a powerful web management terminal.](https://github.com/ehang-io/nps) (discontinued)
  - Go
  - [端口范围映射](https://ehang-io.github.io/nps/#/feature?id=%e7%ab%af%e5%8f%a3%e8%8c%83%e5%9b%b4%e6%98%a0%e5%b0%84)

- [em-proxy: EventMachine Proxy DSL for writing high-performance transparent / intercepting proxies in Ruby](https://github.com/igrigorik/em-proxy) (discontinued)
- [Jire/rs-proxy: a simple, cross-platform, multi-client TCP proxy for Old-school RS2/JS5](https://github.com/Jire/rs-proxy)

- [→Tunnels](../Censorship/Tunnels.md)
  - [→Clash](../Censorship/Clash.md#tunnels)
  - Hysteria

UDP:
- [udpproxy: Cross-platform UDP proxy](https://github.com/neosmart/udpproxy) (discontinued)

[drivers - Proxifier that supports UDP? - Super User](https://superuser.com/questions/264486/proxifier-that-supports-udp)

HTTP:
- [traefik: The Cloud Native Application Proxy](https://github.com/traefik/traefik)
  - Go

  [Is is just me but Traefik is so hard to understand : r/selfhosted](https://www.reddit.com/r/selfhosted/comments/1cmbl22/is_is_just_me_but_traefik_is_so_hard_to_understand/)
- [Sōzu: HTTP reverse proxy, configurable at runtime, fast and safe, built in Rust. It is awesome!](https://github.com/sozu-proxy/sozu)
- [junkurihara/rpxy: A simple and ultrafast http reverse proxy serving multiple domain names and terminating TLS for http/1.1, 2 and 3, written in Rust](https://github.com/junkurihara/rust-rpxy)
- [Weldr: A HTTP 1.1 proxy written in Rust using tokio.](https://github.com/hjr3/weldr) (discontinued)

[各种端口转发工具的使用方法 - Y4er的博客](https://y4er.com/posts/port-forwarding/)

[linux - How can I set a proxy for Wget? - Stack Overflow](https://stackoverflow.com/questions/11211705/how-can-i-set-a-proxy-for-wget)

### [iptables/nftables](../../Security/Firewalls/Linux/README.md)
```sh
sysctl net.ipv4.conf.eth0.forwarding
sysctl net.ipv4.conf.eth0.forwarding=1
# if forwarding to/from localhost, also:
# sysctl net.ipv4.conf.eth0.route_localnet=1
```
```sh
# To rewrite the destination IP of the packet (and back in the reply packet):
# Cannot use DNS names
iptables -t nat -A PREROUTING -i eth0 -p tcp -m tcp --dport 8080 -j DNAT --to-destination 216.34.181.45:80
# To rewrite the source IP of the packet to the IP of the gateway (and back in the reply packet):
# Do not use $(curl -s ip.me)
iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source $(hostname -I)
```
[Basic iptables NAT port forwarding - Server Fault](https://serverfault.com/questions/326493/basic-iptables-nat-port-forwarding)

[linux - How can I port forward with iptables? - Server Fault](https://serverfault.com/questions/140622/how-can-i-port-forward-with-iptables)

[How To Forward Ports through a Linux Gateway with Iptables | DigitalOcean](https://www.digitalocean.com/community/tutorials/fhow-to-forward-ports-through-a-linux-gateway-with-iptables)

[Linux Port Forwarding with iptables | Contabo Blog](https://contabo.com/blog/linux-port-forwarding-with-iptables/)

## TCP over HTTP
- Waste some header bytes.
- Can reduce the handshake cost of short TCP connections.
- Can buffer requests and responses.
- Works with CDN.
- With HTTPS, effectively TCP with TLS.
- With HTTP/3, effectively TCP over QUIC.

Tools:
- Rust
  - [tcp-over-http: A TCP proxy using HTTP - Reach SSH behind a Nginx reverse proxy](https://github.com/julianbuettner/tcp-over-http)
  - [xnuter/http-tunnel: HTTP(S) Tunnel and TCP Proxy](https://github.com/xnuter/http-tunnel)

    [Writing a Modern HTTP(S) Tunnel in Rust](https://dzone.com/articles/writing-a-modern-https-tunnel-in-rust)
  - [morfca/layline: A utility to tunnel network connections over HTTP.](https://github.com/morfca/layline)
    - `X-Forwarded-For`
  - [myzhang1029/penguin-rs: A fast TCP/UDP tunnel, transported over HTTP WebSocket.](https://github.com/myzhang1029/penguin-rs)
- Go
  - [chisel: A fast TCP/UDP tunnel over HTTP](https://github.com/jpillora/chisel)
  - Clash
- C
  - [NateChoe1/tcp-over-http: TCP over HTTP](https://github.com/NateChoe1/tcp-over-http)

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