# Rust
- [http: Rust HTTP types](https://github.com/hyperium/http/tree/master)

  Clients:
  - [ureq: A simple, safe HTTP client](https://github.com/algesten/ureq)
    - Sync
  - [attohttpc: Rust lightweight HTTP 1.1 client](https://github.com/sbstp/attohttpc)
    - Sync
  - [isahc: The practical HTTP client that is fun to use.](https://github.com/sagebind/isahc)
    - Sync/Async
  - [http-rs/surf: Fast and friendly HTTP client framework for async Rust](https://github.com/http-rs/surf)
    - isahc, async-h1, hyper, `window.fetch`

  Libraries:
  - [hyper: An HTTP library for Rust](https://github.com/hyperium/hyper)
    - http1: httpparse, http2: h2
    - [No\_std Support for HTTP - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/no-std-support-for-http/16040)
  
    Servers:
    - [axum: Ergonomic and modular web framework built with Tokio, Tower, and Hyper](axum/README.md)
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
      - Async/Sync
      - [reqwest-middleware: Wrapper around reqwest to allow for client middleware chains.](https://github.com/TrueLayer/reqwest-middleware)
        - [reqwest-retry](https://crates.io/crates/reqwest-retry)
        - [reqwest-tracing](https://crates.io/crates/reqwest-tracing)

- [curl-rust: Rust bindings to libcurl](https://github.com/alexcrichton/curl-rust)

- [httparse: A push parser for the HTTP 1.x protocol in Rust.](https://github.com/seanmonstar/httparse/tree/master)
  - [reqwless: Rust async HTTP client for embedded/no\_std](https://github.com/drogue-iot/reqwless/tree/main)

- [tiny-http: Low level HTTP server library in Rust](https://github.com/tiny-http/tiny-http)

[HTTP client - Categories - crates.io: Rust Package Registry](https://crates.io/categories/web-programming::http-client)

Discussions:
- 2020-09 [Async web server libraries? : r/rust](https://www.reddit.com/r/rust/comments/ix6o6u/async_web_server_libraries/)
- 2023-04 [Which Web Framework do people recommend for Rust in 2023? : r/rust](https://www.reddit.com/r/rust/comments/12jhxi2/which_web_framework_do_people_recommend_for_rust/)
- 2023-12 [Which web framework do you use in Rust? : r/rust](https://www.reddit.com/r/rust/comments/18ogwtl/which_web_framework_do_you_use_in_rust/)
- 2024-01 [Which web framework should I choose? : r/rust](https://www.reddit.com/r/rust/comments/1ae0rei/which_web_framework_should_i_choose/)

Clients:
- 2020-01 [Smoke-testing Rust HTTP clients. Back in 2014 I was fetching frontpages... | by Sergey "Shnatsel" Davidoff | Medium](https://shnatsel.medium.com/smoke-testing-rust-http-clients-b8f2ee5db4e6) ([r/rust](https://www.reddit.com/r/rust/comments/epoloy/ive_smoketested_rust_http_clients_heres_what_i/))

[Rust web framework comparison](https://github.com/flosse/rust-web-framework-comparison#server-frameworks)

[HTTP server --- list of Rust libraries/crates // Lib.rs](https://lib.rs/web-programming/http-server)

## Middleware
Tower-based:
- [tower: A library of modular and reusable components for building robust networking clients and servers.](https://github.com/tower-rs/tower)
  - [tower::limit::rate::RateLimitLayer](https://docs.rs/tower/latest/tower/limit/rate/struct.RateLimitLayer.html)

- [tower-http: Tower middleware and utilities for HTTP clients and servers.](https://github.com/tower-rs/tower-http)
  - [tower\_http::limit](https://docs.rs/tower-http/latest/tower_http/limit/index.html)

- [tower-governor: Rate Limiting middleware for Tower/Axum/Tonic/Hyper utilizing the governor crate](https://github.com/benwis/tower-governor)
  - Limited customization
  - 主要价值在于防止通过特定请求放大 DoS 攻击，对于靠流量攻击的场景作用很小。

- [tower-fault: A library for injecting various faults into a `tower::Service`.](https://github.com/nmoutschen/tower-fault)

## Static file servers
- [`tower_http::services::ServeDir`](https://docs.rs/tower-http/latest/tower_http/services/struct.ServeDir.html)
  - `precompressed` only
- [static-web-server: A cross-platform, high-performance and asynchronous web server for static files-serving. ⚡](#static-web-server)

Compile-time:
- [rust-embed-for-web: Rust Macro which embeds files into your executable. A fork of `rust-embed` with a focus on usage on web servers.](https://github.com/SeriousBug/rust-embed-for-web)

Tools:
- [miniserve: 🌟 For when you really just want to serve some files over HTTP right now!](https://github.com/svenstaro/miniserve)
  - [Is it possible to include as library with existing actix project? - Issue #43](https://github.com/svenstaro/miniserve/issues/43)
- [binserve: A fast production-ready static web server with TLS (HTTPS), routing, hot reloading, caching, templating, and security in a single-binary you can set up with zero code.](https://github.com/mufeedvh/binserve)
  - Actix Web
- [weihanglo/sfz: A simple static file serving command-line tool written in Rust.](https://github.com/weihanglo/sfz) (discontinued)

### [static-web-server](https://github.com/static-web-server/static-web-server)
> A cross-platform, high-performance and asynchronous web server for static files-serving. ⚡

- [Docs.rs](https://docs.rs/static-web-server/)
  
  [Publish to crates.io to allow use as a library - Issue #188](https://github.com/static-web-server/static-web-server/issues/188)
- Benchmarks
  - [Add in memory cache to SWS - Issue #242](https://github.com/static-web-server/static-web-server/issues/242)

  [Speed comparison - Issue #90](https://github.com/static-web-server/static-web-server/issues/90)

  [Much slower than sfz - Issue #146](https://github.com/static-web-server/static-web-server/issues/146)

  [SWS benchmarks with several web servers by joseluisq - Pull Request #155](https://github.com/static-web-server/static-web-server/pull/155)
  - [Question regarding the benchmarks - Issue #156](https://github.com/static-web-server/static-web-server/issues/156)
- `async-compression`
  - [Custom compressed MIME types - Issue #594](https://github.com/static-web-server/static-web-server/issues/594)
  - [Prioritize compression algorithms - Issue #593](https://github.com/static-web-server/static-web-server/issues/593)
- [Ability to download zip, tar etc? - Issue #67](https://github.com/static-web-server/static-web-server/issues/67)
  - [Support tarzst directory download format - Issue #547](https://github.com/static-web-server/static-web-server/issues/547)
- [Content-type negotiation for images - Issue #94](https://github.com/static-web-server/static-web-server/issues/94)
