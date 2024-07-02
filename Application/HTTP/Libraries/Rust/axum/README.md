# [axum](https://github.com/tokio-rs/axum)
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