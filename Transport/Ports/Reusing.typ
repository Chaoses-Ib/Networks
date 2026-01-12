#import "@local/ib:0.1.0": *
#md(```
# Port Reusing
## Load balancing
[The `SO_REUSEPORT` socket option \[LWN.net\]](https://lwn.net/Articles/542629/)
- The `SO_REUSEPORT` implementation distributes connections evenly across all of the threads (or processes) that are blocked in `accept()` on the same port.
- The other noteworthy point is that there is a [defect](https://lwn.net/Articles/542738/) in the current implementation of TCP `SO_REUSEPORT`. If the number of listening sockets bound to a port changes because new servers are started or existing servers terminate, it is possible that incoming connections can be dropped during the three-way handshake.

Go: [reusing tcp ports](https://seankhliao.com/blog/12020-07-04-reusing-tcp-ports/)

## Protocol demultiplexing
```)
Only TCP/UDP demultiplexing is natively and widely supported. Third-party implementations for other protocols are not as good as them.

Pros:
- Simpler for configuring the firewall
- Uses less ports

Cons:
- Performance cost
- Connection information lost (if non-transparent)
  - TCP is full of caveats
- Limited external control (firewall, proxy, CDN, etc.)

Tools:
- #a[sslh: Applicative Protocol Multiplexer (e.g. share SSH and HTTPS on the same port)][https://github.com/yrutschle/sslh]
  - HTTP, TLS/SSL (including SNI and ALPN), SSH, OpenVPN, tinc, XMPP, SOCKS5, custom regex
  - GPL-2

- #a[rpxy-l4: An L4 reverse proxy with protocol multiplexer, written in Rust][https://github.com/junkurihara/rust-rpxy-l4]
  - Rust, library
  - HTTP, TLS, SSH
    - #a[SOCKS5 protocol multiplexing - Issue \#136][https://github.com/junkurihara/rust-rpxy-l4/issues/136]
  - UDP: QUIC, WireGuard

Tools written in Go:
- #a[caddy-l4: Layer 4 (TCP/UDP) app for Caddy][https://github.com/mholt/caddy-l4]
  - RDP, OpenVPN, Postgres, PROXY, QUIC, SOCKS, SSH, TLS, WinBox, WireGuard, XMPP
- #a[cmux: Connection multiplexer for GoLang: serve different services on the same port!][https://github.com/soheilhy/cmux]
  (discontinued)
  - SSH, HTTP, HTTPS, gRPC, Go RPC, custom
- Clash: #a[`mixed`][https://wiki.metacubex.one/config/inbound/listeners/mixed/]
  - HTTP, HTTPS, SOCKS5 (TCP/UDP)
  - Single outbound
#md(```
- [SapphicCode/protoplex: A protocol multiplexer in Go](https://github.com/SapphicCode/protoplex)
  - SSH, HTTP, TLS, OpenVPN, SOCKS4 / SOCKS5
- [jamescun/switcher: Run SSH and HTTP(S) on the same port](https://github.com/jamescun/switcher)
  - SSH, HTTP/HTTPS

TCP/HTTP:
- Nginx

  [Nginx - possible to serve http and tcp over same port? - Server Fault](https://serverfault.com/questions/1019456/nginx-possible-to-serve-http-and-tcp-over-same-port)

  [reverse proxy - Bind nginx on the same port for tcp and http - Server Fault](https://serverfault.com/questions/586209/bind-nginx-on-the-same-port-for-tcp-and-http)

  [reverse proxy tcp and http on the same port - Issue #73 - yaoweibin/nginx\_tcp\_proxy\_module](https://github.com/yaoweibin/nginx_tcp_proxy_module/issues/73)
- axum

  [Share tcp port between axum and tcp server - tokio-rs/axum - Discussion #3146](https://github.com/tokio-rs/axum/discussions/3146)

HTTP/HTTPS:
- Nginx

  [Handling http and https requests using a single port with nginx - Server Fault](https://serverfault.com/questions/47876/handling-http-and-https-requests-using-a-single-port-with-nginx)

  [Redirecting HTTP Requests to HTTPS on Same Port in NGINX - David Westerfield](https://davidwesterfield.net/2021/03/redirecting-http-requests-to-https-on-same-port-in-nginx/)
- [axum-server-dual-protocol: Host a HTTP and HTTPS server on the same port with `axum-server`](https://github.com/daxpedda/axum-server-dual-protocol)

## HTTP routing
Nginx: [Nginx: How do I forward an HTTP request to another port? - Server Fault](https://serverfault.com/questions/536576/nginx-how-do-i-forward-an-http-request-to-another-port)
```)
