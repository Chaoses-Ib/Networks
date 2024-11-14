# Hypertext Transfer Protocol (HTTP)
[Wikipedia](https://en.wikipedia.org/wiki/HTTP), [MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP)

- HTTP 是无状态协议，但可以通过 cookie 保存状态
- 默认使用持续连接，但也可使用非持续连接
  
	大部分浏览器默认会建立 5~10 个并行连接

## Versions
### HTTP/1
> The first usable version of HTTP was created in 1997. Because it went through several stages of development, this first version of HTTP was called HTTP/1.1. This version is still in use on the web.

### [→HTTP/2](HTTP2.md)

### [→HTTP/3](HTTP3.md)

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
- [Resumable File Upload Demo | tus.io](https://tus.io/demo)
  - HTTP Traffic
  - `https://tusd.tusdemo.net/files/`

- File name

  [About the file name - Issue #44 - tus/tusd](https://github.com/tus/tusd/issues/44)
  > The reason why the tusd server generates random IDs for uploads instead of using the file's name is that the protocol does not force the client to tell the server the file name. This is a decision that has been made on purpose. However, we do understand that such information is sometimes crucial and therefore you are able to use the mechanics of meta data to pass it along. In this case the file name will be presented as meta data inside the `.info` object.

  [I want original file extension, which i have uploaded - Issue #174 - tus/tusd](https://github.com/tus/tusd/issues/174)

- [Protocol Extensions](https://tus.io/protocols/resumable-upload#protocol-extensions)
  - Creation
    - Response's `Location` depends request's `Host`
  - Expiration (unfinished uploads only)

- Servers
  - Go: [tusd: Reference server implementation in Go of tus: the open protocol for resumable file uploads](https://github.com/tus/tusd)
    - 37 MiB
    - [Proxies](https://tus.github.io/tusd/getting-started/configuration/#proxies)
      - [nginx.conf](https://github.com/tus/tusd/blob/main/examples/nginx.conf)
      - `-behind-proxy` 不支持 `X-Forwarded-Port`
      - [Wrong URL when new upload is created - Issue #136](https://github.com/tus/tusd/issues/136)
        - [Add note about port of X-Forwarded-Host to nginx.conf example by Chaoses-Ib - Pull Request #1190](https://github.com/tus/tusd/pull/1190)
      - Caddy: [Tusd behind Caddy Webserver? - Issue #444](https://github.com/tus/tusd/issues/444)
    - [HTTP/2](https://tus.github.io/tusd/getting-started/configuration/#http2)
    - HTTP/3
      - [tus over QUIC - Issue #857](https://github.com/tus/tusd/issues/857)
        - > So I tested upload-speed with Safari and Chrome but it was almost the same speed.
    - [Storage backends](https://tus.github.io/tusd/storage-backends/overview/)
    - [FileInfo](https://pkg.go.dev/github.com/tus/tusd/pkg/handler#FileInfo)
      - [hook.proto](https://github.com/tus/tusd/blob/eff0a435fcbba04edede33a80f69811588aaa0f5/pkg/hooks/grpc/proto/hook.proto#L35)
    - Download
      - `-disable-download`
      - Only files with `.info` can be downloaded.
  
    [tusd v2: better hooks, network resilience and IETF protocol | tus.io](https://tus.io/blog/2023/09/20/tusd-200)

  - .NET: [tusdotnet: .NET server implementation of the Tus protocol for resumable file uploads. Read more at https://tus.io](https://github.com/tusdotnet/tusdotnet)
  
  - Rust
    - tusd-types
    - Rocket: [Meteoritus: A tus server integration for Rocket framework](https://github.com/kallebysantos/meteoritus)
    - [rustus: TUS protocol implementation in Rust.](https://github.com/s3rius/rustus)
      - [Application examples? - Issue #139 - s3rius/rustus](https://github.com/s3rius/rustus/issues/139)
      - [Embedding in other programs - Issue #157 - s3rius/rustus](https://github.com/s3rius/rustus/issues/157)
      - [Implement expiration extension - Issue #13 - s3rius/rustus](https://github.com/s3rius/rustus/issues/13)

  - JS: [tus-node-server: Node.js tus server, standalone or integrable in any framework, with disk, S3, and GGC stores.](https://github.com/tus/tus-node-server)

- Clients
  - [tus-js-client: A pure JavaScript client for the tus resumable upload protocol](https://github.com/tus/tus-js-client)
  - [tus-py-client: A Python client for the tus resumable upload protocol](https://github.com/tus/tus-py-client) (`tuspy`, `tusclient`, [Notebook](tus.ipynb))
    - requests / aiohttp

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

## Conditional requests
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Conditional_requests)

[ETag - HTTP | MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/ETag)

- [If-Match](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/If-Match)

## Status codes
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status), [Wikipedia](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)

[RFC 9110: HTTP Semantics](https://httpwg.org/specs/rfc9110.html#status.codes)

[Hypertext Transfer Protocol (HTTP) Status Code Registry](https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml)

Responses are grouped in five classes:
- `1xx`: [Informational responses](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#information_responses)
- `2xx`: [Successful responses](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#successful_responses)
- `3xx`: [→Redirection](#redirection)
- `4xx`: [Client error responses](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#client_error_responses)
  - [412 Precondition Failed](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/412)

    [rest - When is it appropriate to respond with a HTTP 412 error? - Stack Overflow](https://stackoverflow.com/questions/5369480/when-is-it-appropriate-to-respond-with-a-http-412-error)

  - [418 I'm a teapot](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/418)

    [error handling - Is 418 "I'm a teapot" really an HTTP response code? - Stack Overflow](https://stackoverflow.com/questions/52340027/is-418-im-a-teapot-really-an-http-response-code)

  - [422 Unprocessable Content](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/422)
    - Clients that receive a `422` response should expect that repeating the request without modification will fail with the same error.
  - [423 Locked](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/423)
  - [424 Failed Dependency](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/424)
  - [428 Precondition Required](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/428)

  [rest - 400 vs 422 response to POST of data - Stack Overflow](https://stackoverflow.com/questions/16133923/400-vs-422-response-to-post-of-data)

- `5xx`: [Server error responses](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#server_error_responses)
  - [510 Not Extended](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/510)

Application errors:
- N/A Internal client error
- 400 Bad Request
  - Syntax error (wrong data format)
- 422 Unprocessable Entity
  - Semantic error (type mismatch)
- 200 OK with an error code in JSON
  - Logic error
- 500 Internal Server Error
- 503 Service Unavailable
- [rest - What is the appropriate HTTP status code response for a general unsuccessful request (not an error)? - Stack Overflow](https://stackoverflow.com/questions/9381520/what-is-the-appropriate-http-status-code-response-for-a-general-unsuccessful-req)
- [api design - What HTTP response code to use for failed POST request? - Stack Overflow](https://stackoverflow.com/questions/47269601/what-http-response-code-to-use-for-failed-post-request)

[HTTP status code for server configuration problem - Stack Overflow](https://stackoverflow.com/questions/68559540/http-status-code-for-server-configuration-problem)

[rest - Which HTTP status code means "Not Ready Yet, Try Again Later"? - Stack Overflow](https://stackoverflow.com/questions/9794696/which-http-status-code-means-not-ready-yet-try-again-later)

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

[Redirection messages](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status#redirection_messages)

[HTTP Redirections explained](https://http.dev/redirects)

[A good way to redirect with a POST request? - Stack Overflow](https://stackoverflow.com/questions/2604530/a-good-way-to-redirect-with-a-post-request)
- > The specification says that a 307 POST redirect needs to be at least acknowledged by the user. Alas, apparently no browser is sticking to the spec here. IE simply repeats the request (so it works for your purposes), but Firefox, Safari and Opera seem to discard the POST data. Hence, this technique is unfortunately unreliable. (2010)
- > The 307 approach is fully supported in all browser and successfully redirects a submitted POST to a different location including the body. (2024)

[Why doesn't HTTP have POST redirect? - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/99894/why-doesnt-http-have-post-redirect)

[Post/Redirect/Get - Wikipedia](https://en.wikipedia.org/wiki/Post/Redirect/Get)

[javascript - redirect after a fetch post call - Stack Overflow](https://stackoverflow.com/questions/39735496/redirect-after-a-fetch-post-call)
- ~~`redirect: 'manual'`~~
- [`Response.redirected`](https://developer.mozilla.org/en-US/docs/Web/API/Response/redirected)
  - Two requests
- > In SPA apps, redirect responses are unlikely, maybe this is the reason why ajax vendors apply little attention to this functionality. See also these discussions: [here](https://github.com/whatwg/fetch/issues/763) [here](https://github.com/whatwg/fetch/issues/601)

[http - How to redirect to a login page, but only when the browser is navigating to a page - Stack Overflow](https://stackoverflow.com/questions/61331315/how-to-redirect-to-a-login-page-but-only-when-the-browser-is-navigating-to-a-pa)

## Extensions
[httpwg/http-extensions: Draft HTTP Extension Specifications](https://github.com/httpwg/http-extensions)

### RFC 2774
[HTTP Extension Framework](https://www.w3.org/Protocols/HTTP/ietf-http-ext/)

[RFC 2774 - An HTTP Extension Framework](https://datatracker.ietf.org/doc/html/rfc2774)

Actual applications?

[102893 - Support HTTP Extensions (RFC 2774)](https://bugzilla.mozilla.org/show_bug.cgi?id=102893)
> over taken by events - this experimental standard never saw industry pickup and is not intermediary safe. h2 has its own mechanism, which we will support as needed. (2015-11)

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