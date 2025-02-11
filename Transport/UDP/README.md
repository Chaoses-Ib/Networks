# User Datagram Protocol
[Wikipedia](https://en.wikipedia.org/wiki/User_Datagram_Protocol)

[5分钟了解游戏加速器的原理与搭建 - 知乎](https://zhuanlan.zhihu.com/p/435932408)

## Services
None

## 限制
- DDoS: 部分 DDoS 防护服务会在遭遇攻击时限制 UDP 流量

- QoS

  [运营商UDP QOS严重算侵害消费者权益吗？ - 知乎](https://www.zhihu.com/question/520997268)
  > 算吧，不过 ISP 也是出于无奈之举。
  > 黑客搞攻击是用 UDP 多倍暴力发包的，会堵死网络，所以运营商都不待见这个协议，都有干扰，只是属国内三流氓严重点。
  > 而且有人之间用这种方法绕过运营商的计费系统实现免流（因为 UDP 是不可靠协议，钻空子了），所以就干扰了。
  > 我用 zerotier 异地组网，一旦开始传输大文件，跑满宽带，不到 10 秒就断了。

  [运营线对 UDP 限制是为何 - V2EX](https://www.v2ex.com/t/803960)

  没想到还有这种狗事

Circumvention:
- UDP over TCP
  - [udp2raw: A Tunnel which Turns UDP Traffic into Encrypted UDP/FakeTCP/ICMP Traffic by using Raw Socket](https://github.com/wangyu-/udp2raw)
- [→Port hopping](../Ports/Hopping.md)

## UDP-based protocols
- [DHCP](../../Internet/DHCP/README.md)
- [QUIC](../QUIC/README.md)
- [Secure Reliable Transport (SRT) Protocol](https://github.com/Haivision/srt)

  [draft-sharabayko-srt-01](https://datatracker.ietf.org/doc/html/draft-sharabayko-srt-01)
- [DNS](../../Internet/DNS/README.md)
