# QUIC
[Wikipedia](https://en.wikipedia.org/wiki/QUIC)

[QUIC's (hidden) Super Powers - Media over QUIC](https://moq.dev/blog/quic-powers/)

[The Illustrated QUIC Connection: Every Byte Explained](https://quic.xargs.org/)

[硬核观察 | 微软前高管解释了为什么 Windows 10 删除了开机声音 - Linux中国](https://mp.weixin.qq.com/s/9xWcuE5AuebtB-pP_JyyAQ)

QUIC 协议正式发布了 RFC 9000，成为 IETF 标准

[关闭 Chrome 浏览器 QUIC 协议，让 YouTube 视频更流畅？ - V2EX](https://www.v2ex.com/t/843238#reply0)

## Libraries
[QUIC Interop Runner](https://interop.seemann.io/) ([GitHub](https://github.com/quic-interop/quic-interop-runner))
- Nginx, lsquic, xquic, mvfst

Rust:
- [quiche: 🥧 Savoury implementation of the QUIC transport protocol and HTTP/3](https://github.com/cloudflare/quiche)
  - Congestion control: `cubic` (default), `reno`, `bbr`, `bbr2`

    [CUBIC and HyStart++ Support in quiche](https://blog.cloudflare.com/cubic-and-hystart-support-in-quiche/)
  - HyStart++
  - Build
    - Cannot build under non-ASCII paths (due to BoringSSL?)
  - ~~`quiche-server` doesn't work on Windows? `errno=10054; Connection was reset`~~

  Used by Cloudflare, Android
- [quinn: Async-friendly QUIC implementation in Rust](https://github.com/quinn-rs/quinn)
  - Congestion control: `new_reno`, `cubic`, `bbr`, custom

    [`clash-rs/clash_lib/src/proxy/hysteria2/congestion.rs` at master - Watfaq/clash-rs](https://github.com/Watfaq/clash-rs/blob/master/clash_lib/src/proxy/hysteria2/congestion.rs)
  - [quinn stream is 10x slower then TCP/UDP, what could be wrong? - Issue #2153 - quinn-rs/quinn](https://github.com/quinn-rs/quinn/issues/2153)

    [I saw no advantage to download speed compared to a simple python http tcp server - Issue #1712 - quinn-rs/quinn](https://github.com/quinn-rs/quinn/issues/1712)
    > Quinn's default settings are tuned for a good balance of performance and reliability on a 100Mbps internet link.
  - Cannot change `ServerConfig` per connection, but only for new connections

    [Certificate rotation for long running clients - Issue #474 - quinn-rs/quinn](https://github.com/quinn-rs/quinn/issues/474)
  - The example server doesn't support HTTP/3

    [connect quic go server wrong - Issue #1134 - quinn-rs/quinn](https://github.com/quinn-rs/quinn/issues/1134)

    [MSQUIC Client talking with QUINN Endpoint - Issue #1486 - quinn-rs/quinn](https://github.com/quinn-rs/quinn/issues/1486)

    [Interop with draft-29 - Issue #1068 - quinn-rs/quinn](https://github.com/quinn-rs/quinn/issues/1068)

  [salvo: A powerful web framework built with a simplified design.](https://github.com/salvo-rs/salvo)

  Used by clash-rs
- [aws/s2n-quic: An implementation of the IETF QUIC protocol](https://github.com/aws/s2n-quic)
  - Congestion control: `cubic`, `bbr` v2, [custom](https://github.com/aws/s2n-quic/tree/main/examples/custom-congestion-controller)
- [Neqo: Neqo, the Mozilla Firefox implementation of QUIC in Rust](https://github.com/mozilla/neqo)
  - Congestion control: `new_reno`, `cubic`
- MsQuic: [masa-koz/msquic-async-rs: MsQuic based quic library that supports async operation](https://github.com/masa-koz/msquic-async-rs)

[Best performing quic implementation? : r/rust](https://www.reddit.com/r/rust/comments/11jn4kw/best_performing_quic_implementation/)

[(suggestion) Use s2n-quic instead of quinn for better performance and stability - Issue #57 - junkurihara/rust-rpxy](https://github.com/junkurihara/rust-rpxy/issues/57)

[any benchmark against cloudflare quiche / lsquic and https://github.com/mozilla/neqo? - Issue #1320 - quinn-rs/quinn](https://github.com/quinn-rs/quinn/issues/1320)

C++:
- [MsQuic: Cross-platform, C implementation of the IETF QUIC protocol, exposed to C, C++, C# and Rust.](https://github.com/microsoft/msquic)
- [facebook/mvfst: An implementation of the QUIC transport protocol.](https://github.com/facebook/mvfst)
- [lsquic: LiteSpeed QUIC and HTTP/3 Library](https://github.com/litespeedtech/lsquic)
- [XQUIC Library released by Alibaba is a cross-platform implementation of QUIC and HTTP/3 protocol.](https://github.com/alibaba/xquic)

Go:
- [quic-go: A QUIC implementation in pure Go](https://github.com/quic-go/quic-go)
  - [Congestion control](https://quic-go.net/docs/quic/congestion-control/): CUBIC

    [implement BBR congestion control - Issue #341 - quic-go/quic-go](https://github.com/quic-go/quic-go/issues/341)
    - [implement BBRv3 - Issue #4565 - quic-go/quic-go](https://github.com/quic-go/quic-go/issues/4565)

    [Pluggable congestion control - Issue #776 - quic-go/quic-go](https://github.com/quic-go/quic-go/issues/776)

  Forks:
  - [apernet/quic-go at v0.48.1-mod-rename](https://github.com/apernet/quic-go/tree/v0.48.1-mod-rename)
    - [Comparing quic-go:master...apernet:v0.49.0-mod - quic-go/quic-go](https://github.com/quic-go/quic-go/compare/master...apernet:quic-go:v0.49.0-mod)
    - [hysteria/core/internal/congestion](https://github.com/apernet/hysteria/tree/master/core/internal/congestion)
    
    > It uses a fork of quic-go which implemented bbr congestion control, but most of the interfaces are the same as the original quic-go.
    
    [shall we use the quic of hysteria? - Issue #193 - go-gost/gost](https://github.com/go-gost/gost/issues/193)
    - [Use github.com/apernet/hysteria/core to speed up QUIC - ginuerzh/gost@c8177ce](https://github.com/ginuerzh/gost/commit/c8177ce14e9cfc8851cdf21cc2801b035d507408)
    - [Use BBR for QUIC when send\_mbps is unset - ginuerzh/gost@8b05568](https://github.com/ginuerzh/gost/commit/8b05568c5c2d85f59be0133dbfde89c05306d752)
    
  - [daeuniverse/quic-go: Modified quic-go for https://github.com/mzz2017/softwind](https://github.com/daeuniverse/quic-go)

  Used by [Caddy](../../Application/HTTP/HTTP3.md#caddy)

## [→HTTP/3](../../Application/HTTP/HTTP3.md)
