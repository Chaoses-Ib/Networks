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
- REST

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

## Libraries
### C++
- [Boost.Beast: HTTP and WebSocket built on Boost.Asio in C++11](https://github.com/boostorg/beast)
- [cpp-netlib: The C++ Network Library Project -- cross-platform, standards compliant networking library.](https://github.com/cpp-netlib/cpp-netlib)

### Rust
- [hyper: An HTTP library for Rust](https://github.com/hyperium/hyper)
  
  Servers:
  - [axum: Ergonomic and modular web framework built with Tokio, Tower, and Hyper](#axum)
    - Rusty
    - Relatively new (2021)
    - [Loco: 🚂 🦀 The one-person framework for Rust for side-projects and startups](https://github.com/loco-rs/loco)
  - [actix-web: Actix Web is a powerful, pragmatic, and extremely fast web framework for Rust.](https://github.com/actix/actix-web)
  - [Rocket: A web framework for Rust.](https://github.com/rwf2/Rocket)
    - Maintenance issue
  - [warp: A super-easy, composable, web server framework for warp speeds.](https://github.com/seanmonstar/warp)
  - [tide: Fast and friendly HTTP server framework for async Rust](https://github.com/http-rs/tide)
  - [poem: A full-featured and easy-to-use web framework with the Rust programming language.](https://github.com/poem-web/poem)
    - Relatively new (2021)
  - [salvo: A powerful web framework built with a simplified design.](https://github.com/salvo-rs/salvo)
    - Chinese
  - [Thruster: A fast, middleware based, web framework written in Rust](https://github.com/thruster-rs/Thruster)
  - [pavex: An easy-to-use Rust framework for building robust and performant APIs](https://github.com/LukeMathWalker/pavex)

  Clients:
  - [reqwest: An easy and powerful Rust HTTP Client](https://github.com/seanmonstar/reqwest)

- [tiny-http: Low level HTTP server library in Rust](https://github.com/tiny-http/tiny-http)

Discussions:
- 2020-09 [Async web server libraries? : r/rust](https://www.reddit.com/r/rust/comments/ix6o6u/async_web_server_libraries/)
- 2023-04 [Which Web Framework do people recommend for Rust in 2023? : r/rust](https://www.reddit.com/r/rust/comments/12jhxi2/which_web_framework_do_people_recommend_for_rust/)
- 2023-12 [Which web framework do you use in Rust? : r/rust](https://www.reddit.com/r/rust/comments/18ogwtl/which_web_framework_do_you_use_in_rust/)
- 2024-01 [Which web framework should I choose? : r/rust](https://www.reddit.com/r/rust/comments/1ae0rei/which_web_framework_should_i_choose/)

[HTTP server --- list of Rust libraries/crates // Lib.rs](https://lib.rs/web-programming/http-server)

#### [axum](https://github.com/tokio-rs/axum)
- `State` will be cloned for each request.

  [Always store state in an `Arc` by davidpdrsn - Pull Request #1270 - tokio-rs/axum](https://github.com/tokio-rs/axum/pull/1270)

  [Is State cloned for each request? - tokio-rs/axum - Discussion #1911](https://github.com/tokio-rs/axum/discussions/1911)

  `router.with_state(Arc::new(state))`

Middleware:
- [tower-http: Tower middleware and utilities for HTTP clients and servers.](https://github.com/tower-rs/tower-http)

[Community Projects](https://github.com/tokio-rs/axum/blob/main/ECOSYSTEM.md)