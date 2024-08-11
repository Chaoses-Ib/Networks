# Hypertext Transfer Protocol
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP)

- HTTP 是无状态协议，但可以通过 cookie 保存状态
- 默认使用持续连接，但也可使用非持续连接
  
	大部分浏览器默认会建立 5~10 个并行连接

## Request methods
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)

### `OPTIONS`
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/OPTIONS)

[→Cross-Origin Resource Sharing (CORS)](#cross-origin-resource-sharing-cors)

## Content
[Content-Type - HTTP | MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Type)
```http
Content-Type: text/html; charset=utf-8
Content-Type: multipart/form-data; boundary=ExampleBoundaryString
```

### Multipart forms
```http
POST /foo HTTP/1.1
Content-Length: 68137
Content-Type: multipart/form-data; boundary=ExampleBoundaryString

--ExampleBoundaryString
Content-Disposition: form-data; name="description"

Description input value
--ExampleBoundaryString
Content-Disposition: form-data; name="myFile"; filename="foo.txt"
Content-Type: text/plain

[content of the file foo.txt chosen by the user]
--ExampleBoundaryString--
```

[Uploading a file via HTTP - West Wind Web Connection](https://webconnection.west-wind.com/docs/_0rs0twgr6.htm)

[POST a File via HTTP Request | The Ultimate Guide | by API4AI | Medium](https://medium.com/@API4AI/post-a-file-via-http-request-the-ultimate-guide-b23fb70a3f73)

### Resumable uploads
[Resumable File Uploads - Issue #1626 - whatwg/fetch](https://github.com/whatwg/fetch/issues/1626)

[tus - resumable file uploads](https://tus.io/) ([GitHub](https://github.com/tus/tus-resumable-upload-protocol))
- [Protocol Extensions](https://tus.io/protocols/resumable-upload#protocol-extensions)
  - Creation
    - Response's `Location` depends request's `Host`
  - Expiration (unfinished uploads only)
- Servers
  - Go: [tusd: Reference server implementation in Go of tus: the open protocol for resumable file uploads](https://github.com/tus/tusd)
    - 37 MiB
    - [Storage backends](https://tus.github.io/tusd/storage-backends/overview/)
    - Download
      - `-disable-download`
      - Only files with `.info` can be downloaded.
  
  - .NET: [tusdotnet: .NET server implementation of the Tus protocol for resumable file uploads. Read more at https://tus.io](https://github.com/tusdotnet/tusdotnet)
  
  - Rust
    - Rocket: [Meteoritus: A tus server integration for Rocket framework](https://github.com/kallebysantos/meteoritus)
    - [rustus: TUS protocol implementation in Rust.](https://github.com/s3rius/rustus)
      - [Application examples? - Issue #139 - s3rius/rustus](https://github.com/s3rius/rustus/issues/139)
      - [Embedding in other programs - Issue #157 - s3rius/rustus](https://github.com/s3rius/rustus/issues/157)
      - [Implement expiration extension - Issue #13 - s3rius/rustus](https://github.com/s3rius/rustus/issues/13)

- Clients
  - [tus-js-client: A pure JavaScript client for the tus resumable upload protocol](https://github.com/tus/tus-js-client)
  - [tus-py-client: A Python client for the tus resumable upload protocol](https://github.com/tus/tus-py-client) (`tuspy`, `tusclient`, [Notebook](tus.ipynb))

[Resumable.js: A JavaScript library for providing multiple simultaneous, stable, fault-tolerant and resumable/restartable uploads via the HTML5 File API.](https://github.com/23/resumable.js) (discontinued)

[post - resume uploads using HTTP? - Stack Overflow](https://stackoverflow.com/questions/1830130/resume-uploads-using-http)

[面试官：大文件上传如何做断点续传？-腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/article/1813858)

[大文件上传服务器、支持超大文件HTTP断点续传实践总结 - 掘金](https://juejin.cn/post/7045142249969025054)

### Upload and download
- [Transloadit: File uploading & processing API](https://transloadit.com/) (paid)

  [Why Transloadit outperforms S3 for file uploads | Transloadit](https://transloadit.com/blog/2023/04/transloadit-vs-s3-for-uploads/)

  [Using postman to interface with the Transloadit API | Transloadit](https://transloadit.com/blog/2022/06/postman/)

- [Filestack: The Best File Uploader & Upload API](https://www.filestack.com/) (paid)

### Content negotiation
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Content_negotiation)

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

## Tools
CLI:
- [cURL](https://curl.se/) ([Wikipedia](https://en.wikipedia.org/wiki/CURL), [GitHub](https://github.com/curl/curl))
  - [Hurl: run and test HTTP requests with plain text.](https://github.com/Orange-OpenSource/hurl)
- [HTTPie CLI: 🥧 modern, user-friendly command-line HTTP client for the API era. JSON support, colors, sessions, downloads, plugins & more.](https://github.com/httpie/cli)
- [httpYac: Command Line Interface for \*.http and \*.rest files. Connect with http, gRPC, WebSocket and MQTT](https://github.com/AnWeber/httpyac)

GUI:
- Edge DevTools: Network Console
  - Formats: Network Console, Postman JSON

  [Network Console - a Microsoft Edge feature with lots of potential - DEV Community](https://dev.to/estruyf/network-console-a-microsoft-edge-feature-with-lots-of-potential-2hf)

- Python + Requests + Jupyter Notebook
  - [Ipyrest: An emerging widget for exploring RESTful APIs in Jupyter notebooks.](https://github.com/deeplook/ipyrest) (discontinued)

- VS Code
  - [REST Client](https://github.com/Huachao/vscode-restclient)
  - [httpYac - Yet another Client: Quickly and easily send REST, Soap, GraphQL, GRPC, MQTT and WebSocket requests directly within Visual Studio Code](https://github.com/AnWeber/vscode-httpyac)
  - Thunder Client

- [Postman](https://www.postman.com/) ([Wikipedia](https://en.wikipedia.org/wiki/Postman_(software)))
  - Protocols
    - HTTP
      - REST
      - GraphQL
    - gRPC
    - WebSocket
      - Socket.IO
    - MQTT
- [Hoppscotch: Open source API development ecosystem](https://github.com/hoppscotch/hoppscotch)
  - HTTP
    - REST
    - GraphQL
  - WebSocket
    - Socket.IO
  - MQTT
- [Insomnia: The open-source, cross-platform API client for GraphQL, REST, WebSockets, SSE and gRPC. With Cloud, Local and Git storage.](https://github.com/Kong/insomnia)
- [Bruno: Opensource IDE For Exploring and Testing Api's (lightweight alternative to postman/insomnia)](https://github.com/usebruno/bruno)
- [Apifox: API 文档、调试、Mock、测试一体化协作平台。拥有接口文档管理、接口调试、Mock、自动化测试等功能，接口开发、测试、联调效率，提升 10 倍。最好用的接口文档管理工具，接口自动化测试工具。](https://apifox.com/)
  - Postman + Swagger + Mock + JMeter

[20 Postman alternatives you should know about - July 2024 Review](https://testfully.io/blog/top-5-postman-alternatives/)

[API Testing Showdown: Postman vs Pytest. Part 1 | by Nikita Belkovskiy | Exness Tech Blog | Medium](https://medium.com/exness-blog/api-testing-showdown-postman-vs-pytest-part-1-919a3a21a085)

Discussions:
- 2023-07 [Good alternative to postman ? : r/selfhosted](https://www.reddit.com/r/selfhosted/comments/152ew7v/good_alternative_to_postman/)
- 2023-07 [Looking for a Postman alternative : r/softwaretesting](https://www.reddit.com/r/softwaretesting/comments/14ze0g9/looking_for_a_postman_alternative/)
- 2023-09 [求 postman 的替代品， Windows 系统 - V2EX](https://www.v2ex.com/t/975795)
- 2024-01 [Postman alternative that does not suck with feature bloat : r/webdev](https://www.reddit.com/r/webdev/comments/199m3g3/postman_alternative_that_does_not_suck_with/)

## HTTP capturing
- [mitmproxy: An interactive TLS-capable intercepting HTTP proxy for penetration testers and software developers.](https://github.com/mitmproxy/mitmproxy)

Tools:
- Chromium DevTools
- Wireshark: [Hyper\_Text\_Transfer\_Protocol - Wireshark Wiki](https://wiki.wireshark.org/Hyper_Text_Transfer_Protocol)
- [Fiddler: Web Debugging Proxy and Troubleshooting Tools](https://www.telerik.com/fiddler)
- [Reqable](https://reqable.com/) (Chinese)
  - Fiddler + Charles + Postman
  - Flutter

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