# Internet Control Message Protocol
The **Internet Control Message Protocol (ICMP)** is a supporting protocol in the Internet protocol suite. It is used by network devices, including routers, to send error messages and operational information indicating success or failure when communicating with another IP address, for example, an error is indicated when a requested service is not available or that a host or router could not be reached.[^wiki]

ICMP 被网络设备用于在与其它 IP 地址通讯时发送错误信息或指示成功或失败的操作信息。与 TCP 和 UDP 不同，ICMP 通常不用于交换数据，但并不是不能交换数据，[ICMP tunnel](https://en.wikipedia.org/wiki/ICMP_tunnel) 就是一种利用 ICMP 绕过防火墙进行隐秘数据交换的方法。

## RFC
[RFC 792 - Internet Control Message Protocol](https://datatracker.ietf.org/doc/html/rfc792)

## Header format
```
0                   1                   2                   3
0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|     Type      |     Code      |          Checksum             |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                            Content                            |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

## Smurf attack
A **Smurf attack** is a distributed denial-of-service attack in which large numbers of ICMP packets with the intended victim's spoofed source IP are broadcast to a computer network using an IP broadcast address. Most devices on a network will, by default, respond to this by sending a reply to the source IP address. If the number of machines on the network that receive and respond to these packets is very large, the victim's computer will be flooded with traffic. This can slow down the victim's computer to the point where it becomes impossible to work on.[^smurf-wiki]

### Mitigation
1. Configure hosts and routers to ignore packets where the source address is a broadcast address; and
2. Configure routers to not forward packets directed to broadcast addresses. Until 1999, standards required routers to forward such packets by default. Since then, the default standard was changed to not forward such packets.[^smurf-wiki]

缓解使得 Smurf 攻击失去了放大流量的作用，但 Smurf 攻击仍可用于隐藏攻击者的 IP。

[^wiki]: [Internet Control Message Protocol - Wikipedia](https://en.wikipedia.org/wiki/Internet_Control_Message_Protocol)
[^smurf-wiki]: [Smurf attack - Wikipedia](https://en.wikipedia.org/wiki/Smurf_attack)