# Addressing
## Classful Addresing
**Classful addresing（分类编址）** 根据 IP 地址网络部分的长度，将子网分为 A、B 和 C 类网络。

Class | Leading bits | First byte (10)
--- | --- | ---
A | 0 | 0~127\*
B | 10 | 128~191
C | 110 | 192~223
D | 1110 | 224~239
E | 1111 | 240~255

- A\*: 127 保留给了 loopback address
- D: 保留给 multicast
- E: 保留

然而，C 类网络只能容纳 254 台主机，太少了，B 类 65534 台又太多了，很浪费。尽管可以通过组合多个 C 类地址来组成 supernetwork，但这存在以下几个问题：
- Supernetting is implemented in different ways on different routers
- Supernetting on one router interface can influence how routes are advertised on other interfaces of the same router
- Detecting a [persistent routing loop](https://en.wikipedia.org/wiki/Persistent_routing_loop "Persistent routing loop") becomes a difficult problem

## Classless Inter-Domain Routing
**Classless Inter-Domain Routing（无类别域间路由选择）** 将 IP 地址分为 network prefix 和 host identifier。[^cidr-wiki]

## Special addresses
Special Address | Netid | Hostid | Source or Destination
--- | --- | --- | ---
Network address | Specific | All 0s | None
Direct broadcast address | Specific | All 1s | Destination
Limited broadcast address | All 1s | All 1s | Destination
This host on this network | All 0s | All 0s | Source
Specific host on this network | All 0s | Specific | Destination
Loopback address | 127 | Any | Destination

### Private addresses
[^private-wiki]

CIDR notation | Address range
--- | ---
10.0.0.0/8 | 10.0.0.0~10.255.255.255
172.16.0.0/12 | 172.16.0.0~172.31.255.255
192.168.0.0/16 | 192.168.0.0~192.168.255.255


[^cidr-wiki]: [Classless Inter-Domain Routing - Wikipedia](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing)
[^private-wiki]: [Private network - Wikipedia](https://en.wikipedia.org/wiki/Private_network)