# Transport Layer
[Wikipedia](https://en.wikipedia.org/wiki/Transport_layer)

## Transport services
[^topdown]
- Reliable data transfer
  - Loss-tolerant applications
- Throughput
  - Bandwidth-sensitive applications
  - Elastic applications
- Timing
  - Real-time applications
  - Non-real-time applications
- Security

[^topdown]: Computer Networking：A Top-Down Approach

## System integration
TCP 的硬件和系统集成使得它能够被更好地优化，但反过来也更容易被审查，降低了可靠性。

## Libraries
### C++
- [Boost.Asio](https://github.com/boostorg/asio)
  - `acceptor::async_accept()` will *silently fail* if the port is already in use. Only `acceptor::bind()` will throw an exception.

    [AcceptEx (winsock) and sub-processes hangs byte sending to client - Issue #665 - chriskohlhoff/asio](https://github.com/chriskohlhoff/asio/issues/665)

  Lifetime (`shared_ptr`) issues:
  - [Why is `boost::asio::async_write` causing a crash? - Stack Overflow](https://stackoverflow.com/questions/18537788/why-is-boostasioasync-write-causing-a-crash)
  - [crash when sending data using `async_write` - Stack Overflow](https://stackoverflow.com/questions/64029121/c-asio-crash-when-sending-data-using-async-write)

  [C++20 Coroutines Support](https://think-async.com/Asio/asio-1.22.0/doc/asio/overview/core/cpp20_coroutines.html)
  - [Has anybody used Boost ASIO with C++20 coroutine support in any real client/server apps? What wisdom can you share? : r/cpp](https://www.reddit.com/r/cpp/comments/u3igrf/has_anybody_used_boost_asio_with_c20_coroutine/)
  - [Talking Async](https://github.com/chriskohlhoff/talking-async)

- [libhv: 🔥 比libevent/libuv/asio更易用的网络库。A c/c++ network library for developing TCP/UDP/SSL/HTTP/WebSocket/MQTT client/server.](https://github.com/ithewei/libhv)

- [HP-Socket: High Performance TCP/UDP/HTTP Communication Component](https://github.com/ldcsaa/HP-Socket)

  Modes: `PUSH`, `PULL`, `PACK`

  Bindings: .NET, 易语言

- [evpp: A modern C++ network library for developing high performance network services in TCP/UDP/HTTP protocols.](https://github.com/Qihoo360/evpp) (inactive)

[Is Asio the best library for networking in C++? : r/cpp](https://www.reddit.com/r/cpp/comments/lpy8m9/is_asio_the_best_library_for_networking_in_c/)

[I hate ASIO and I can't be alone. : r/cpp](https://www.reddit.com/r/cpp/comments/p45ozj/i_hate_asio_and_i_cant_be_alone/)

[Best C/C++ Network Library - Stack Overflow](https://stackoverflow.com/questions/118945/best-c-c-network-library)

### Rust
- [mio: Metal I/O library for Rust.](https://github.com/tokio-rs/mio)
  - [tokio::net](https://docs.rs/tokio/latest/tokio/net/index.html)
    - Shutdown on `Drop`

      [Does tokio TcpStream require special cancellation handling? - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/does-tokio-tcpstream-require-special-cancellation-handling/131918)
      > In short, dropping the `TcpStream` does everything that `shutdown` does (closing write direction), and in fact it does *more* than what `shutdown` does (it closes the read direction too).

      [rust - Is it possible to close a TcpListener in Tokio? - Stack Overflow](https://stackoverflow.com/questions/48334079/is-it-possible-to-close-a-tcplistener-in-tokio)

      [How to close tcp connection when using tokio - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/how-to-close-tcp-connection-when-using-tokio/66533)

      [Tokio AsyncReadExt `read_exact` method hangs indefinately - The Rust Programming Language Forum](https://users.rust-lang.org/t/tokio-asyncreadext-read-exact-method-hangs-indefinately/123618)
    - [tcp-handler: A Rust crate for conveniently transfering `bytes` bufs through `tokio` TCP stream.](https://github.com/xuxiaocheng0201/tcp-handler/)

Discussions:
- [How to fake a connection refused in rust? - Stack Overflow](https://stackoverflow.com/questions/65828567/how-to-fake-a-connection-refused-in-rust)

  > This is too bizarre a thing to want to do for a standard library to provide functions for it. I expect you'd have to use a low level system-specific API to achieve this.

## Tools
- [Sokit: A TCP & UDP package send / receive / transfer tool](https://github.com/sinpolib/sokit)

  [windows 环境 tcp/udp 端口转发 - 那个白熊 - 博客园](https://www.cnblogs.com/amnotgcs/p/18291025)
