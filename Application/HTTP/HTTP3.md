# HTTP/3
[Wikipedia](https://en.wikipedia.org/wiki/HTTP/3)

[HTTP/3 explained](https://http3-explained.haxx.se/)

[Accelerating UDP packet transmission for QUIC](https://blog.cloudflare.com/accelerating-udp-packet-transmission-for-quic/)

> As of February 2024, it is now used on 30.9% of websites and is supported by most web browsers, i.e. (at least partially) supported by 97% of users.

## Libraries
[→QUIC libraries](../../Transport/QUIC/README.md#libraries)

## Servers
Rust:
- [hyperium/h3](https://github.com/hyperium/h3)
  - quinn, [s2n-quic](https://github.com/aws/s2n-quic/tree/main/quic/s2n-quic-h3), [msquic](https://github.com/masa-koz/msquic-async-rs/tree/main/h3-msquic-async), ~~[quiche](https://github.com/hyperium/h3/issues/147)~~
  
  [h3/docs/PROPOSAL.md](https://github.com/hyperium/h3/blob/9b028247dcefa6f6f323908135b98a958f1bf30d/docs/PROPOSAL.md#8-alternatives):
  - The existing options (quiche-h3, neqo-h3, and quinn-h3) have some downsides.
  - neqo and quiche are designed to be ignorant of IO, and are simple state machines. While this provides maximum flexibility, it still requires significant complexity for each user to plug into their application.
  - All 3 of them have hard dependencies on their QUIC implementations, which conflicts with one of our main goals to allow users to bring their own QUIC implementation.

C++:
- Nginx
- IIS
- HAProxy
- LiteSpeed Web Server
- Nimble Streamer

Go:
- Caddy

[Http3 implementation in rust : r/rust](https://www.reddit.com/r/rust/comments/pr71nk/http3_implementation_in_rust/)

### Nginx
- [`ngx_http_v3_module`](https://nginx.org/en/docs/http/ngx_http_v3_module.html)

  [Support for QUIC and HTTP/3](https://nginx.org/en/docs/quic.html) (v1.25)

  Congestion control:
  - [\[quic\] Do have exact new plans for implementing bbr](https://forum.nginx.org/read.php?29,294940,294940)

    > Currently we have implemented minimalistic congestion control, as described in RFC 9002. There are no exact plans for implementing more advanced schemes, but it is quite obvious that this area needs improvements, so we will have to do something about it in future.

  - [Re: Inquiry about QUIC Congestion Control Algorithms Development](https://forum.nginx.org/read.php?29,299685,299692#msg-299692)

    > We have CUBIC in our roadmap. BBR will be our next step after it, but no particular plans about it so far.

  [NGINX HTTP/3 QUIC vulnerability CVE-2024-24989](https://my.f5.com/manage/s/article/K000138444)

- [→Tengine](Servers/Nginx/README.md#distributions): [ngx\_http\_xquic\_module](https://tengine.taobao.org/document/xquic.html)
  - `xquic_congestion_control`: `cubic` (default), `bbr`, `reno`

- quiche

  [Experiment with HTTP/3 using NGINX and quiche](https://blog.cloudflare.com/experiment-with-http-3-using-nginx-and-quiche/)

- [bilibili/nginx\_quic\_module](https://github.com/bilibili/nginx_quic_module)

### [Caddy](Servers/Caddy/README.md)
Based on [quic-go](../../Transport/QUIC/README.md#libraries).

[caddyhttp: Enable HTTP/3 by default by mholt - Pull Request #4707 - caddyserver/caddy](https://github.com/caddyserver/caddy/pull/4707) ([Hacker News](https://news.ycombinator.com/item?id=32768454))

Not enabled with local cert?

[Proposal: export more HTTP/3 related interfaces for caddy plugins to use - Issue #6017 - caddyserver/caddy](https://github.com/caddyserver/caddy/issues/6017)

## Tools
- Chrome DevTools

  [http3 - Does Chrome support HTTP/3 over a port other than 443? - Stack Overflow](https://stackoverflow.com/questions/72411373/does-chrome-support-http-3-over-a-port-other-than-443)
  > Chromium supports HTTP/3 only on UDP ports < 1024
  > 
  > Some shared unix systems may have user home directories (like `http://example.com/~mike`) which allow users to emit headers. This is a bad idea already, but with Alternate-Protocol, it provides the ability for a single user on a multi-user system to hijack the alternate protocol. These systems also enforce ports <1024 as restricted ports. So don't allow protocol upgrades to user-controllable ports.

  [Convincing browsers to connect with HTTP/3 protocol : r/f5networks](https://www.reddit.com/r/f5networks/comments/18qq136/convincing_browsers_to_connect_with_http3_protocol/)

  Doesn't support HTTP/3-only sites.

- Firefox

- [HTTP/3 Check](https://http3check.net/)

  [Caddy not using http3 - Help - Caddy Community](https://caddy.community/t/caddy-not-using-http3/19555/16)
  > That website is not reliable. They only try an older draft revision of the QUIC protocol. We’ve reached out to them in the past to ask them to fix it, but they still haven’t yet.

- cURL: [HTTP/3 with curl](https://curl.se/docs/http3.html)
  - `curl --http3-only --insecure`

- wget: [Implement HTTP/3 support using QUIC (#553) - Issues - Wget / wget2 - GitLab](https://gitlab.com/gnuwget/wget2/-/issues/553)

[V2: How to test HTTP/3 support? - Help - Caddy Community](https://caddy.community/t/v2-how-to-test-http-3-support/6490)
