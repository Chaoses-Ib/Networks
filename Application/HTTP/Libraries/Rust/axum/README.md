# [axum](https://github.com/tokio-rs/axum)
- `State` will be cloned for each request.

  [Always store state in an `Arc` by davidpdrsn - Pull Request #1270 - tokio-rs/axum](https://github.com/tokio-rs/axum/pull/1270)

  [Is State cloned for each request? - tokio-rs/axum - Discussion #1911](https://github.com/tokio-rs/axum/discussions/1911)

  `router.with_state(Arc::new(state))`

- [The order of extractors](https://docs.rs/axum/latest/axum/extract/index.html#the-order-of-extractors)

  > Extractors always run in the order of the function parameters that is from left to right. The request body is an asynchronous stream that can only be consumed once. Therefore you can only have one extractor that consumes the request body. axum enforces this by requiring such extractors to be the *last* argument your handler takes.

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