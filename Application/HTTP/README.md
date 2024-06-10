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