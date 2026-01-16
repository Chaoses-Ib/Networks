#import "@local/ib:0.1.0": *
#title[SOCKS]
#a-badge[https://en.wikipedia.org/wiki/SOCKS]

- No original client IP address
- #q[SOCKS is a _de facto_ standard for circuit-level gateways (level 5 gateways).]

= SOCKS4
- TCP only.
- IPv4 only.

= SOCKS5
- #q[One of the main issues faced by SOCKS version 5 is that, when taking
  into account the TCP handshake, method negotiation, authentication,
  connection request and grant, it may take up to 5 RTTs for a data
  exchange to take place at the application layer.  This is especially
  costly in networks with a large delay at the access layer, such as
  3G, 4G, or satellite.]

- `AUTH` usually includes `No authentication`.
  - `05 01 00`

- Address
  ```rs
  #[repr(u8)]
  enum Address {
      IPv4(u32) = 1,
      DomainName {
          len: u8,
          name: [u8; len],
      } = 3,
      IPv6(u128) = 4,
  }
  ```
  - `127.0.0.1:80`: `01 7F 00 00 01 00 50`

- #q[Most popular SOCKS5 clients
  #a[1][https://github.com/chromium/chromium/blob/bd2c7a8b65ec42d806277dd30f138a673dec233a/net/socket/socks5_client_socket.cc#L481]
  #a[2][https://github.com/curl/curl/blob/d15692ebbad5e9cfb871b0f7f51a73e43762cee2/lib/socks.c#L978]
  ignore `BND.ADDR` and `BND.PORT` the reply of command `CONNECT`, but this field could be useful in some other command, such as UDP `ASSOCIATE`.]

== Libraries
Rust:
- #a[fast-socks5: Fast SOCKS5 TCP and UDP client/server implementation written in Rust async (with tokio)][https://github.com/dizda/fast-socks5]
  - #q[Can skip the authentication/handshake process (not RFC-compliant, for private use, to save on useless round-trips)]
    - But can only either skip or not skip for all clients.

      To reliably support both, change either `VER` or `NAUTH`/`CMD` to a magic number for one side of the clients.
  - Does not support TCP bind, but UDP bind.
  - #q[Instead of proxying in-process, swap out `run_tcp_proxy` for custom handling to build a router or to use a custom accelerated proxying method.]
    - #a[New explicit and extensible server API by valpackett - Pull Request \#59][https://github.com/dizda/fast-socks5/pull/59]
    - #a[`fast-socks5/examples/router.rs`][https://github.com/dizda/fast-socks5/blob/master/examples/router.rs]
  - #a[rfor: A simple but fast traffic forwarder with routing.][https://github.com/yuguorui/rfor]

- #a[sfackler/rust-socks][https://github.com/sfackler/rust-socks]
  (`socks`)
- #a[`shadowsocks-rust/crates/shadowsocks/src/relay/socks5.rs`][https://github.com/shadowsocks/shadowsocks-rust/blob/master/crates/shadowsocks/src/relay/socks5.rs]
- #a[ombrac/socks-lib: SOCKS Protocol Library in Rust][https://github.com/ombrac/socks-lib]
- #a[ylxdzsw/v2socks: An opinionated lightweight socks5 server and vmess (v2ray) client implemented in Rust.][https://github.com/ylxdzsw/v2socks]
  (discontinued)

= Tor
#a[Tor's extensions to the SOCKS protocol - Tor Specifications][https://spec.torproject.org/socks-extensions.html]

- Optimistic data

  #q[Tor allows SOCKS clients to send connection data before Tor has sent a SOCKS response.
  Tor will package such data and send it to the exit, without waiting to see whether the connection attempt succeeds.
  This behavior can save a single round-trip time when starting connections with a protocol where the client speaks first (like HTTP).
  Clients that do this must be ready to hear that their connection has succeeded or failed _after_ they have sent the data.
  ]

= Shadowsocks
#a[What is Shadowsocks? | Shadowsocks][https://shadowsocks.org/doc/what-is-shadowsocks.html]

- `[target address][payload]`

  #a[UDP overhead when using "none" encryption method? - Issue \#1260 - shadowsocks/shadowsocks-rust][https://github.com/shadowsocks/shadowsocks-rust/issues/1260]
- The "widely used SOCKS variant with 0-RTT and encryption support", but may be blocked by China GFW.

== Libraries
Rust:
- #a[shadowsocks-rust: A Rust port of shadowsocks][https://github.com/shadowsocks/shadowsocks-rust]

= SOCKS6
#a[SOCKS Protocol Version 6 (draft-olteanu-intarea-socks-6-11)][https://datatracker.ietf.org/doc/html/draft-olteanu-intarea-socks-6-11]

Expired, probably in favor of RFC 8803 - 0-RTT TCP Convert Protocol.

#a[SOCKS6 could deprecate Shadowsocks - Protocol - Shadowsocks][https://discourse.shadowsocks.org/t/socks6-could-deprecate-shadowsocks/554]
