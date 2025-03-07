# Ports
## Port numbers
[List of TCP and UDP port numbers - Wikipedia](https://en.wikipedia.org/wiki/List_of_TCP_and_UDP_port_numbers)

> The port numbers in the range from 0 to 1023 (0 to 210 − 1) are the well-known ports or system ports. They are used by system processes that provide widely used types of network services. On Unix-like operating systems, a process must execute with superuser privileges to be able to bind a network socket to an IP address using one of the well-known ports.

[Port Number Database Search - WintelGuy.com](https://wintelguy.com/port-search/)

[请教大佬们，高位端口安全性高？ - V2EX](https://www.v2ex.com/t/847273)
- [nmap/nmap-services](https://raw.githubusercontent.com/nmap/nmap/master/nmap-services)

[端口映射 3389 到 5 位端口，一直在被爆破，怎么防护可以兼顾安全性跟便捷性？ - V2EX](https://v2ex.com/t/944163)

[解决 Hyper-V 端口占用问题 | Cassius's Blog](https://www.yuweihung.com/posts/2021/hyper-v-reserved-port/)

[RouterOS 端口扫描防御 | 華鳥風月](https://blog.9-ch.com/post/homelab-ros-anti-scan/)

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

## Port leak
- TCP port leak
- UDP port leak

  e.g. MSI.CentralServer v3.2024.1202.1

## Port exhaustion
- TCP port exhaustion
- UDP port exhaustion
  - DNS query fails

    [\[BUG\] 打开tun模式一段时间后浏览器无法上网 - Issue #2398 - clash-verge-rev](https://github.com/clash-verge-rev/clash-verge-rev/issues/2398)
  - QQ CPU 占有率高

```sh
[UDP] dial DIRECT (match GeoIP/cn) 198.18.0.1:1234 --> 114.245.33.144:8000 error: listen udp :0: bind: An operation on a socket could not be performed because the system lacked sufficient buffer space or because a queue was full.
```
[c# - "An operation on a socket could not be performed because the system lacked sufficient buffer space or because a queue was full" - Stack Overflow](https://stackoverflow.com/questions/4415175/an-operation-on-a-socket-could-not-be-performed-because-the-system-lacked-suffi)

Tools:
- `netstat -anob`
- System Informer

[TCP/IP port exhaustion troubleshooting - Windows Client | Microsoft Learn](https://learn.microsoft.com/en-us/troubleshoot/windows-client/networking/tcp-ip-port-exhaustion-troubleshooting)

[Port Exhaustion and You (or, why the Netstat tool is your friend) | Microsoft Learn](https://learn.microsoft.com/en-us/archive/blogs/askds/port-exhaustion-and-you-or-why-the-netstat-tool-is-your-friend)

[How to stop running out of ephemeral ports and start to love long-lived connections](https://blog.cloudflare.com/how-to-stop-running-out-of-ephemeral-ports-and-start-to-love-long-lived-connections/)
