# [axum](https://github.com/tokio-rs/axum)
Handler:
- `State` will be cloned for each request.

  [Always store state in an `Arc` by davidpdrsn - Pull Request #1270 - tokio-rs/axum](https://github.com/tokio-rs/axum/pull/1270)

  [Is State cloned for each request? - tokio-rs/axum - Discussion #1911](https://github.com/tokio-rs/axum/discussions/1911)

  `router.with_state(Arc::new(state))`

- [The order of extractors](https://docs.rs/axum/latest/axum/extract/index.html#the-order-of-extractors)

  > Extractors always run in the order of the function parameters that is from left to right. The request body is an asynchronous stream that can only be consumed once. Therefore you can only have one extractor that consumes the request body. axum enforces this by requiring such extractors to be the *last* argument your handler takes.

- [`axum_macros::debug_handler`](https://docs.rs/axum-macros/latest/axum_macros/attr.debug_handler.html)

Router:
- [`nest()`](https://docs.rs/axum/latest/axum/routing/struct.Router.html#method.nest)

- `merge()`
  
  [Different middleware for different groups - tokio-rs/axum - Discussion #292](https://github.com/tokio-rs/axum/discussions/292)

- [`route_layer()`](https://docs.rs/axum/latest/axum/routing/struct.Router.html#method.route_layer)

  > This works similarly to [`Router::layer`](https://docs.rs/axum/latest/axum/struct.Router.html#method.layer "method axum::Router::layer") except the middleware will only run if the request matches a route. This is useful for middleware that return early (such as authorization) which might otherwise convert a `404 Not Found` into a `401 Unauthorized`.

- [Best way to implement an hostname based router? - tokio-rs/axum - Discussion #934](https://github.com/tokio-rs/axum/discussions/934)

  [Enable/Disable routes based on host - tokio-rs/axum - Discussion #928](https://github.com/tokio-rs/axum/discussions/928)

IP:
- [`Router::into_make_service_with_connect_info()`](https://docs.rs/axum/latest/axum/struct.Router.html#method.into_make_service_with_connect_info)
- [axum-client-ip: A client IP address extractor for Axum](https://github.com/imbolc/axum-client-ip)

[Community Projects](https://github.com/tokio-rs/axum/blob/main/ECOSYSTEM.md)
- [axum-limit: This crate provides an efficient rate limiting mechanism using token buckets, specifically designed for asynchronous web applications with a strong focus on extractor-based rate limits.](https://github.com/gengteng/axum-limit)

[axum-server: High level server designed to be used with axum framework.](https://github.com/programatik29/axum-server)

Static file servers:
- [axum/examples/static-file-server at main - tokio-rs/axum](https://github.com/tokio-rs/axum/tree/main/examples/static-file-server)
- [static-server: simple static file server written in Rust based on axum framework](https://github.com/ttys3/static-server)
- [How to host SPA files and embed too with axum and rust-embed - Stack Overflow](https://stackoverflow.com/questions/73464479/how-to-host-spa-files-and-embed-too-with-axum-and-rust-embed)

[Demo of Rust and axum web framework with Tokio, Tower, Hyper, Serde](https://github.com/joelparkerhenderson/demo-rust-axum/tree/main)

## Error handling
[axum::error_handling](https://docs.rs/axum/latest/axum/error_handling/index.html)
- `Result<impl IntoResponse, impl IntoResponse>`

- Do error handling first

  axum 没有提供开箱即用、可扩展的错误处理机制，如果不先搭好错误处理框架，在 Rust 错误和 HTTP 错误间转换会很麻烦。好在 thiserror/anyhow 搭起来很方便。

## API generators
- 2023-04 [What is the best API generator for Axum? : r/rust](https://www.reddit.com/r/rust/comments/12fuwzs/what_is_the_best_api_generator_for_axum/)