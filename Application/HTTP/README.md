# Hypertext Transfer Protocol
- HTTP 是无状态协议，但可以通过 cookie 保存状态
- 默认使用持续连接，但也可使用非持续连接
	大部分浏览器默认会建立 5~10 个并行连接

## Request methods
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)

### `OPTIONS`
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/OPTIONS)

[→Cross-Origin Resource Sharing (CORS)](#cross-origin-resource-sharing-cors)

## API
[Classification of HTTP APIs](http://algermissen.io/classification_of_http_apis.html)
- WS-\*
- RPC URI-Tunneling
- HTTP-based Type I
- HTTP-based Type II
- [REST](REST.md)

[authentication - What is an Endpoint? - Stack Overflow](https://stackoverflow.com/questions/2122604/what-is-an-endpoint)

[terminology - What is a web service endpoint? - Stack Overflow](https://stackoverflow.com/questions/9807382/what-is-a-web-service-endpoint)

## Access control
### Cross-Origin Resource Sharing (CORS)
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)

axum: [tower\_http::cors](https://docs.rs/tower-http/0.5.2/tower_http/cors/index.html)
- ~~[Support for CORS preflight requests - Issue #106 - tokio-rs/axum](https://github.com/tokio-rs/axum/issues/106)~~
- [Axum router rejecting CORS OPTIONS preflight with 405 even with CorsLayer - Stack Overflow](https://stackoverflow.com/questions/73498537/axum-router-rejecting-cors-options-preflight-with-405-even-with-corslayer)

## Authentication
- HTTP basic authentication ([Wikipedia](https://en.wikipedia.org/wiki/Basic_access_authentication))

  `Authorization: Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ==`

## Redirection
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Redirections)
- Permanent redirections
  - 301 Moved Permanently (others ~→ GET)
  - 308 Permanent Redirect
- Temporary redirections
  - 302 Found (others ~→ GET)
  - 303 See Other (others → GET)
  - 307 Temporary Redirect
- Special redirections
  - 300 Multiple Choices
  - 304 Not Modified

[A good way to redirect with a POST request? - Stack Overflow](https://stackoverflow.com/questions/2604530/a-good-way-to-redirect-with-a-post-request)
- > The specification says that a 307 POST redirect needs to be at least acknowledged by the user. Alas, apparently no browser is sticking to the spec here. IE simply repeats the request (so it works for your purposes), but Firefox, Safari and Opera seem to discard the POST data. Hence, this technique is unfortunately unreliable. (2010)
- > The 307 approach is fully supported in all browser and successfully redirects a submitted POST to a different location including the body. (2024)

[Why doesn't HTTP have POST redirect? - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/99894/why-doesnt-http-have-post-redirect)

[Post/Redirect/Get - Wikipedia](https://en.wikipedia.org/wiki/Post/Redirect/Get)

## Website availability testing
Tools:
- [Freshping](https://www.freshworks.com/website-monitoring/is-it-down/)
  - Time: DNS, TCP, TLS, first byte
- [OnlineOrNot](https://onlineornot.com/website-down-checker)
  - Error code
- China
  - [ITDOG](https://www.itdog.cn/http/)

## Website monitoring
[Wikipedia](https://en.wikipedia.org/wiki/Website_monitoring)

[awesome-checker-services: ✅ List of links to the various checkers out there on the web for sites, domains, security etc.](https://github.com/Brunty/awesome-checker-services)

## Benchmarking
- [k6: Load testing for engineering teams](https://k6.io/)
  - JS scripts
  - `scoop install k6`

- [vegeta: HTTP load testing tool and library. It's over 9000!](https://github.com/tsenart/vegeta)

- [bombardier: Fast cross-platform HTTP benchmarking tool written in Go](https://github.com/codesenberg/bombardier)

- [oha: Ohayou(おはよう), HTTP load generator, inspired by rakyll/hey with tui animation.](https://github.com/hatoo/oha)

- [wrk: Modern HTTP benchmarking tool](https://github.com/wg/wrk)
  - Only `GET`
  - OS: Linux
  
  Forks:
  - [wrk2: A constant throughput, correct latency recording variant of wrk](https://github.com/giltene/wrk2)
  - Rust
    - [rewrk: A more modern http framework benchmarker supporting HTTP/1 and HTTP/2 benchmarks.](https://github.com/lnx-search/rewrk)
    - [winrk](https://github.com/fomalhaut88/winrk)
  - Go: [go-wrk: A HTTP benchmarking tool based in spirit on the excellent wrk tool](https://github.com/tsliwowicz/go-wrk)

- [Locust: Write scalable load tests in plain Python 🚗💨](https://github.com/locustio/locust)
  - Written in Python, possibly a bottleneck in benchmarking.

    [Increase performance with a faster HTTP client --- Locust 2.29.1 documentation](https://docs.locust.io/en/stable/increase-performance.html)
    > In a *best case* scenario (doing small requests inside a `while True`\-loop) a single Locust process (limited to one CPU core) can do around **16000 requests per second using FastHttpUser, and 4000 using HttpUser** (tested on a 2021 M1 MacBook Pro and Python 3.11)

[awesome-http-benchmark: HTTP(S) benchmark tools, testing/debugging, & restAPI (RESTful)](https://github.com/denji/awesome-http-benchmark)

History:
- 2021-02 [Best way to benchmark and load test an api. : r/devops](https://www.reddit.com/r/devops/comments/llv5s7/best_way_to_benchmark_and_load_test_an_api/)