# HTTP/3
[Wikipedia](https://en.wikipedia.org/wiki/HTTP/3)

[HTTP/3 explained](https://http3-explained.haxx.se/)

[Accelerating UDP packet transmission for QUIC](https://blog.cloudflare.com/accelerating-udp-packet-transmission-for-quic/)

> As of February 2024, it is now used on 30.9% of websites and is supported by most web browsers, i.e. (at least partially) supported by 97% of users.

## Libraries
[→QUIC libraries](../../Transport/QUIC/README.md#libraries)

## Servers
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

- [bilibili/nginx\_quic\_module](https://github.com/bilibili/nginx_quic_module)

### [Caddy](Servers/Caddy/README.md)
Based on [quic-go](../../Transport/QUIC/README.md#libraries).

[caddyhttp: Enable HTTP/3 by default by mholt - Pull Request #4707 - caddyserver/caddy](https://github.com/caddyserver/caddy/pull/4707) ([Hacker News](https://news.ycombinator.com/item?id=32768454))

Not enabled with local cert?

[Proposal: export more HTTP/3 related interfaces for caddy plugins to use - Issue #6017 - caddyserver/caddy](https://github.com/caddyserver/caddy/issues/6017)

## Tools
- Chrome DevTools
- [HTTP/3 Check](https://http3check.net/)

  [Caddy not using http3 - Help - Caddy Community](https://caddy.community/t/caddy-not-using-http3/19555/16)
  > That website is not reliable. They only try an older draft revision of the QUIC protocol. We’ve reached out to them in the past to ask them to fix it, but they still haven’t yet.

- cURL: [HTTP/3 with curl](https://curl.se/docs/http3.html)
  - `curl --http3-only`

- wget: [Implement HTTP/3 support using QUIC (#553) - Issues - Wget / wget2 - GitLab](https://gitlab.com/gnuwget/wget2/-/issues/553)

[V2: How to test HTTP/3 support? - Help - Caddy Community](https://caddy.community/t/v2-how-to-test-http-3-support/6490)
