# Socket Addresses
[Network socket - Wikipedia](https://en.wikipedia.org/wiki/Network_socket#Socket_addresses)

> An application can communicate with a remote process by exchanging data with TCP/IP by knowing the combination of protocol type, IP address, and port number. This combination is often known as a *socket address*. It is the network-facing access handle to the network socket. The remote process establishes a network socket in its own instance of the protocol stack and uses the networking API to connect to the application, presenting its own socket address for use by the application.

[Socket Addresses - IBM Documentation](https://www.ibm.com/docs/en/zvse/6.2?topic=considerations-socket-addresses)

## Libraries
Rust:
- [std::net::SocketAddr](https://doc.rust-lang.org/std/net/enum.SocketAddr.html)
  - `FromStr`
    ```rust
    assert!("127.0.0.1:0".parse::<SocketAddr>().is_ok());
    assert!("127.0.0.1:80".parse::<SocketAddr>().is_ok());
    assert!("127.0.0.1:65535".parse::<SocketAddr>().is_ok());
    assert!("[::1]:80".parse::<SocketAddr>().is_ok());

    assert!("".parse::<SocketAddr>().is_err());
    assert!("127.0.0.1".parse::<SocketAddr>().is_err());
    assert!("127.0.0.1:65536".parse::<SocketAddr>().is_err());
    assert!("localhost:80".parse::<SocketAddr>().is_err());
    assert!("tcp://127.0.0.1:80".parse::<SocketAddr>().is_err());
    ```
    [Tracking Issue for addr\_parse\_ascii feature - Issue #101035 - rust-lang/rust](https://github.com/rust-lang/rust/issues/101035)

    Supported by Serde.

  - [`ToSocketAddrs`](https://doc.rust-lang.org/stable/std/net/trait.ToSocketAddrs.html)

JS:
- [node-sockaddr: Small JS library to parse a string into a nodejs socket address](https://github.com/stanford-oval/node-sockaddr)
