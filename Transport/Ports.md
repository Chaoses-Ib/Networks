# Ports
[List of TCP and UDP port numbers - Wikipedia](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)

## Ephemeral ports
[Wikipedia](https://en.wikipedia.org/wiki/Ephemeral_port)

- IANA port range: 49152~65535

  Windows Vista+, Windows Server 2008+, FreeBSD 4.6+.

- Linux: 32768~60999

## Port reusing
### Load balancing
[The `SO_REUSEPORT` socket option \[LWN.net\]](https://lwn.net/Articles/542629/)
- The `SO_REUSEPORT` implementation distributes connections evenly across all of the threads (or processes) that are blocked in `accept()` on the same port.
- The other noteworthy point is that there is a [defect](https://lwn.net/Articles/542738/) in the current implementation of TCP `SO_REUSEPORT`. If the number of listening sockets bound to a port changes because new servers are started or existing servers terminate, it is possible that incoming connections can be dropped during the three-way handshake.

Go: [reusing tcp ports](https://seankhliao.com/blog/12020-07-04-reusing-tcp-ports/)

### Protocol demultiplexing
HTTP/HTTPS:
- [axum-server-dual-protocol: Host a HTTP and HTTPS server on the same port with `axum-server`](https://github.com/daxpedda/axum-server-dual-protocol)

### HTTP routing
Nginx: [Nginx: How do I forward an HTTP request to another port? - Server Fault](https://serverfault.com/questions/536576/nginx-how-do-i-forward-an-http-request-to-another-port)