# HTTP Libraries
## C++
- [Boost.Beast: HTTP and WebSocket built on Boost.Asio in C++11](https://github.com/boostorg/beast)
- [cpp-netlib: The C++ Network Library Project -- cross-platform, standards compliant networking library.](https://github.com/cpp-netlib/cpp-netlib)

## Rust
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

[Rust web framework comparison](https://github.com/flosse/rust-web-framework-comparison#server-frameworks)

[HTTP server --- list of Rust libraries/crates // Lib.rs](https://lib.rs/web-programming/http-server)

#### [axum](https://github.com/tokio-rs/axum)
- `State` will be cloned for each request.

  [Always store state in an `Arc` by davidpdrsn - Pull Request #1270 - tokio-rs/axum](https://github.com/tokio-rs/axum/pull/1270)

  [Is State cloned for each request? - tokio-rs/axum - Discussion #1911](https://github.com/tokio-rs/axum/discussions/1911)

  `router.with_state(Arc::new(state))`

Middleware:
- [tower-http: Tower middleware and utilities for HTTP clients and servers.](https://github.com/tower-rs/tower-http)

[Community Projects](https://github.com/tokio-rs/axum/blob/main/ECOSYSTEM.md)

[axum-server: High level server designed to be used with axum framework.](https://github.com/programatik29/axum-server)

Static file servers:
- [axum/examples/static-file-server at main - tokio-rs/axum](https://github.com/tokio-rs/axum/tree/main/examples/static-file-server)
- [static-server: simple static file server written in Rust based on axum framework](https://github.com/ttys3/static-server)
- [How to host SPA files and embed too with axum and rust-embed - Stack Overflow](https://stackoverflow.com/questions/73464479/how-to-host-spa-files-and-embed-too-with-axum-and-rust-embed)

## Python
### Clients
- [urllib.request: Extensible library for opening URLs](https://docs.python.org/3/library/urllib.request.html)

  > The `Requests` package is recommended for a higher-level HTTP client interface.

- [Requests: A simple, yet elegant, HTTP library.](https://github.com/psf/requests)

- [aiohttp: Asynchronous HTTP client/server framework for asyncio and Python](https://github.com/aio-libs/aiohttp)

  [The aiohttp Request Lifecycle](https://docs.aiohttp.org/en/latest/http_request_lifecycle.html)
  - `ClientSession` supports `base_url`, but only absolute URLs without path part are supported.
  - [Shouldn't `session.close()` be a sync function? - Issue #7118](https://github.com/aio-libs/aiohttp/issues/7118)

- [HTTPX: A next generation HTTP client for Python. 🦋](https://github.com/encode/httpx/)

[python - What are the differences between the urllib, urllib2, urllib3 and requests module? - Stack Overflow](https://stackoverflow.com/questions/2018026/what-are-the-differences-between-the-urllib-urllib2-urllib3-and-requests-modul)

[The best Python HTTP clients for 2022 | ScrapingBee](https://www.scrapingbee.com/blog/best-python-http-clients/#5-httpxhttpswwwpython-httpxorg)

[Comparing Python HTTP libraries - Request for Recommendations : Python](https://www.reddit.com/r/Python/comments/uehu09/comparing_python_http_libraries_request_for/)