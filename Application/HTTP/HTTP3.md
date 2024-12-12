# HTTP/3
[Wikipedia](https://en.wikipedia.org/wiki/HTTP/3)

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

### Caddy
[Proposal: export more HTTP/3 related interfaces for caddy plugins to use - Issue #6017 - caddyserver/caddy](https://github.com/caddyserver/caddy/issues/6017)

## Tools
- Chrome DevTools
- [HTTP/3 Check](https://http3check.net/)
