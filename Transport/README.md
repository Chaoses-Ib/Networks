# Transport Layer
[Transport layer - Wikipedia](https://en.wikipedia.org/wiki/Transport_layer)

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

## Libraries
### C++
- [Boost.Asio](https://github.com/boostorg/asio)

  Lifetime (`shared_ptr`) issues:
  - [Why is `boost::asio::async_write` causing a crash? - Stack Overflow](https://stackoverflow.com/questions/18537788/why-is-boostasioasync-write-causing-a-crash)
  - [crash when sending data using `async_write` - Stack Overflow](https://stackoverflow.com/questions/64029121/c-asio-crash-when-sending-data-using-async-write)

  [C++20 Coroutines Support](https://think-async.com/Asio/asio-1.22.0/doc/asio/overview/core/cpp20_coroutines.html)
  - [Has anybody used Boost ASIO with C++20 coroutine support in any real client/server apps? What wisdom can you share? : r/cpp](https://www.reddit.com/r/cpp/comments/u3igrf/has_anybody_used_boost_asio_with_c20_coroutine/)
  - [Talking Async](https://github.com/chriskohlhoff/talking-async)

- [HP-Socket: High Performance TCP/UDP/HTTP Communication Component](https://github.com/ldcsaa/HP-Socket)

  Modes: `PUSH`, `PULL`, `PACK`

  Bindings: .NET, 易语言

- [evpp: A modern C++ network library for developing high performance network services in TCP/UDP/HTTP protocols.](https://github.com/Qihoo360/evpp) (inactive)

[Is Asio the best library for networking in C++? : r/cpp](https://www.reddit.com/r/cpp/comments/lpy8m9/is_asio_the_best_library_for_networking_in_c/)

[I hate ASIO and I can't be alone. : r/cpp](https://www.reddit.com/r/cpp/comments/p45ozj/i_hate_asio_and_i_cant_be_alone/)

[Best C/C++ Network Library - Stack Overflow](https://stackoverflow.com/questions/118945/best-c-c-network-library)