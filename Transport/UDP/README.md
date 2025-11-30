# User Datagram Protocol
[Wikipedia](https://en.wikipedia.org/wiki/User_Datagram_Protocol)

[5分钟了解游戏加速器的原理与搭建 - 知乎](https://zhuanlan.zhihu.com/p/435932408)

## Services
None

## 限制
- DDoS: 部分 DDoS 防护服务会在遭遇攻击时限制 UDP 流量
  - 关联 TCP 流量检测

  [网络层(TCP/UDP)攻击与防御原理 | 曹世宏的博客](https://cshihong.github.io/2019/05/14/%E7%BD%91%E7%BB%9C%E5%B1%82-TCP-UDP-%E6%94%BB%E5%87%BB%E4%B8%8E%E9%98%B2%E5%BE%A1%E5%8E%9F%E7%90%86/)

- QoS

  [运营商UDP QOS严重算侵害消费者权益吗？ - 知乎](https://www.zhihu.com/question/520997268)
  > 算吧，不过 ISP 也是出于无奈之举。
  > 黑客搞攻击是用 UDP 多倍暴力发包的，会堵死网络，所以运营商都不待见这个协议，都有干扰，只是属国内三流氓严重点。
  > 而且有人之间用这种方法绕过运营商的计费系统实现免流（因为 UDP 是不可靠协议，钻空子了），所以就干扰了。
  > 我用 zerotier 异地组网，一旦开始传输大文件，跑满宽带，不到 10 秒就断了。

  [运营线对 UDP 限制是为何 - V2EX](https://www.v2ex.com/t/803960)

  [都说TCP比UDP可靠，但是真实网络传输中，丢包和传输出错的概率有多大呢？ - 知乎](https://www.zhihu.com/question/612954759)
  > 后面总结了一点,如果国内你要用UDP传输数据,一定要"少量多次的发",不要一次性丢一大堆数据过去,很容易碰到运营商阈值,后面你再发,先丢包再说.

  没想到还有这种狗事

Circumvention:
- [UDP over TCP](#udp-over-tcp)
- [→Port hopping](../Ports/Hopping.md)

## UDP-based protocols
- [KCP](../KCP.md)
- [QUIC](../QUIC/README.md)
- [Secure Reliable Transport (SRT) Protocol](https://github.com/Haivision/srt)

  [draft-sharabayko-srt-01](https://datatracker.ietf.org/doc/html/draft-sharabayko-srt-01)
- [DNS](../../Internet/Name/DNS/README.md)
- [DHCP](../../Internet/DHCP/README.md)

[grasshopper: A secure chained relayer for UDP](https://github.com/xtaci/grasshopper)

## UDP over TCP
- [→Tunnels](../../Internet/Censorship/Tunnels.md)
  - SOCKS

  [Add a selection option for UDP availability by Paulgudring - Pull Request #954 - MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo/pull/954)

C++:
- [udp2raw: A Tunnel which Turns UDP Traffic into Encrypted UDP/FakeTCP/ICMP Traffic by using Raw Socket](https://github.com/wangyu-/udp2raw)

Rust:
- [udp-over-tcp: A command-line tool for tunneling UDP datagrams over TCP.](https://github.com/jonhoo/udp-over-tcp)
- [ma-chengyuan/uot: Socks-UoT: Full Cone UDP for TCP-only proxy systems](https://github.com/ma-chengyuan/uot)

Go:
- [justlovediaodiao/udp-over-tcp: A proxy library for transferring udp packets over tcp.](https://github.com/justlovediaodiao/udp-over-tcp)

## TCP over UDP
- [→Tunnels](../../Internet/Censorship/Tunnels.md)
  - [KCP](../KCP.md)
  - QUIC
    - Hysteria
    - TUIC
- [iproxy](https://web.archive.org/web/20090105192448/http://verge.net.au/linux/iproxy/)[^hormanIproxyRunningTCP2002]
- Java: [nikiibayat/TCP-over-UDP: An implementation of an educational tool for implementing and testing TCP over UDP in computer networks.](https://github.com/nikiibayat/TCP-over-UDP)
- Go
  - [microwaves/truck: TCP to UDP proxy](https://github.com/microwaves/truck)

    [Easy TCP to UDP proxy : r/golang](https://www.reddit.com/r/golang/comments/76zglg/easy_tcp_to_udp_proxy/)
- Python
  - [erl-ang/tcp-over-udp: A simplified version of the transmission control protocol (TCP) that operates over user datagram protocol (UDP) to provide reliable data transfer.](https://github.com/erl-ang/tcp-over-udp)
  - [hakantunc/tcp-over-udp: emulate a subset of TCP protocol](https://github.com/hakantunc/tcp-over-udp)

[Tunneling TCP over UDP (DNS in particular)](https://yury.zaytsev.net/press/2010/12/04/tcp-udp-dns-tunneling.html)


[^hormanIproxyRunningTCP2002]: Horman, S. (2002). iproxy: Running TCP services over UDP.
