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

## Port hopping
```sh
# IPv4
sudo iptables -t nat -A PREROUTING -i eth0 -p udp --dport 20000:50000 -j REDIRECT --to-ports 443
# IPv6
sudo ip6tables -t nat -A PREROUTING -i eth0 -p udp --dport 20000:50000 -j REDIRECT --to-ports 443
```
[linux - iptables error: unknown option --dport - Server Fault](https://serverfault.com/questions/563033/iptables-error-unknown-option-dport)

nftables:
```nginx
define INGRESS_INTERFACE="eth0"
define PORT_RANGE=20000-50000
define HYSTERIA_SERVER_PORT=443

table inet hysteria_porthopping {
  chain prerouting {
    type nat hook prerouting priority dstnat; policy accept;
    iifname $INGRESS_INTERFACE udp dport $PORT_RANGE counter redirect to :$HYSTERIA_SERVER_PORT
  }
}
```

[端口跳跃 - Hysteria 2](https://v2.hysteria.network/zh/docs/advanced/Port-Hopping/)
> 中国用户有时报告运营商会阻断或限速 UDP 连接。不过，这些限制往往仅限单个端口。端口跳跃可用作此情况的解决方法。

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
