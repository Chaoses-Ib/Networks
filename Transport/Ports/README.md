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

[常用游戏（应用）端口及屏蔽方法\_朝南\_新浪博客](https://blog.sina.com.cn/s/blog_705c9d0601011r8x.html)

## ISPs
[4444 端口之谜 - V2EX](https://v2ex.com/t/971720)
```
接到电信运营商的通知，为了增强网络安全性，中国电信将于北京时间 2017 年 09 月 28 日 00:00 开始在全国范围的 IDC 机房电信链路网络出口添加病毒防护策略，屏蔽部分端口（详细参看下列清单），届时对这些端口的访问将被阻断。建议您提前检查您的业务中是否包含下述端口的服务，提前更换端口以免受到影响。
目的端口：137-139 ，协议：TCP/UDP
目的端口：593 ，协议：TCP/UDP
目的端口：445 ，协议：TCP/UDP
目的端口：4444 ，协议：TCP/UDP
目的端口：135 ，协议：TCP/UDP
目的端口：3332 ，协议：TCP
目的端口：9996 ，协议：TCP/UDP
目的端口：6669 ，协议：TCP
目的端口：1434 ，协议：TCP/UDP
目的端口：3127-3130 ，协议：TCP
目的端口：42 ，协议：TCP
目的端口：1068 ，协议：TCP/UDP
目的端口：5554 ，协议：UDP
目的端口：17185 ，协议：UDP目的端口：137-139 ，协议：TCP/UDP
目的端口：593 ，协议：TCP/UDP
目的端口：445 ，协议：TCP/UDP
目的端口：4444 ，协议：TCP/UDP
目的端口：135 ，协议：TCP/UDP
目的端口：3332 ，协议：TCP
目的端口：9996 ，协议：TCP/UDP
目的端口：6669 ，协议：TCP
目的端口：1434 ，协议：TCP/UDP
目的端口：3127-3130 ，协议：TCP
目的端口：42 ，协议：TCP
目的端口：1068 ，协议：TCP/UDP
目的端口：5554 ，协议：UDP
目的端口：17185 ，协议：UDP
```
[IDC 机房电信链路端口屏蔽说开来（常见端口分析） - VirCloud's Blog - Learning&Sharing](https://vircloud.net/operations/ct-hielded.html)

[简单测试本地运营商屏蔽了哪些 TCP 端口 - V2EX](https://www.v2ex.com/t/509732)

[电信为什么要屏蔽80端口，有可能解除屏蔽吗？ - 知乎](https://www.zhihu.com/question/21367235)

## Ephemeral ports
[Wikipedia](https://en.wikipedia.org/wiki/Ephemeral_port)

- IANA port range: 49152~65535

  Windows Vista+, Windows Server 2008+, FreeBSD 4.6+.

- Linux: 32768~60999

[Is it a bad thing to see many [TCP Port numbers reused]?](https://osqa-ask.wireshark.org/questions/17955/is-it-a-bad-thing-to-see-many-tcp-port-numbers-reused/)

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
