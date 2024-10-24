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

[Security 101: X-Forwarded-For vs. Forwarded vs PROXY | System Overlord](https://systemoverlord.com/2020/03/25/security-101-x-forwarded-for-vs-forwarded-vs-proxy.html)

[http - Difference between X-Forwarded-For and X-Real-IP headers - Stack Overflow](https://stackoverflow.com/questions/72557636/difference-between-x-forwarded-for-and-x-real-ip-headers)

[X-Real-IP should probably be preferred over X-Forwarded-For in \_extraClientIP directive? - Issue #1670 - akka/akka-http](https://github.com/akka/akka-http/issues/1670)

## Libraries
- [→Pingora](Pingora.md)

## Tools
HTTP:
- [→Nginx](/Application/HTTP/Servers/Nginx/README.md)
- [traefik: The Cloud Native Application Proxy](https://github.com/traefik/traefik)
- [Sōzu: HTTP reverse proxy, configurable at runtime, fast and safe, built in Rust. It is awesome!](https://github.com/sozu-proxy/sozu)
- [Weldr: A HTTP 1.1 proxy written in Rust using tokio.](https://github.com/hjr3/weldr) (discontinued)

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

See also [ISP servers](../Internet%20Service%20Providers.md#servers).