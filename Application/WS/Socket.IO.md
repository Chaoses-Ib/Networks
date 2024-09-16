# [Socket.IO](https://socket.io/)
[Introduction | Socket.IO](https://socket.io/docs/v4/)

> Although Socket.IO indeed uses WebSocket for transport when possible, it adds additional metadata to each packet. That is why a WebSocket client will not be able to successfully connect to a Socket.IO server, and a Socket.IO client will not be able to connect to a plain WebSocket server either.

The Socket.IO connection can be established with different low-level transports:
- HTTP long-polling
- WebSocket
- WebTransport

Pros:
- HTTP long-polling fallback
- Automatic reconnection
- Packet buffering
- Acknowledgements
- Broadcasting
- Multiplexing

Cons:
- Package format overhead
- The size of the browser bundle itself is [`10.4 kB`](https://bundlephobia.com/package/socket.io-client) (minified and gzipped).

## Servers
Rust: [Socketioxide: A socket.io server implementation in Rust that integrates with the Tower ecosystem and the Tokio stack.](https://github.com/Totodore/socketioxide)