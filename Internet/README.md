# Internet Layer
[Network layer - Wikipedia](https://en.wikipedia.org/wiki/Network_layer), [Internet layer - Wikipedia](https://en.wikipedia.org/wiki/Internet_layer).

## Services
[^topdown]

- Guaranteed delivery
- Guaranteed delivery with bounded delay
- In-order packet delivery
- Guaranteed minimal bandwidth
- Security

The Internet’s network layer provides a single service, known as *best-effort service*.

## Data plane
The data plane functions of the network layer are the per-router functions in the network layer that determine how a datagram (that is, a network-layer packet) arriving on one of a router’s input links is forwarded to one of that router’s output links.[^topdown]

### Forwarding
When a packet arrives at a router’s input link, the router must move the packet to the appropriate output link.[^topdown]

## Control plane
The control plane functions of the network layer are the network-wide logic that controls how a datagram is routed among routers along an end-to-end path from the source host to the destination host. [^topdown]

### Routing
The network layer must determine the route or path taken by packets as they flow from a sender to a receiver.[^topdown]

## Tools
- [lent: The FLExible Network Tester](https://flent.org/) ([GitHub](https://github.com/tohojo/flent))

- [查看我的 IP 地址 | 查询本机 IP 地址及归属地 | 查看 DNS 出口 IP | 查看递归 DNS 信息 | 测试 CDN 命中节点 | Sukka | https://ip.skk.moe](https://ip.skk.moe/)


[^topdown]: Computer Networking：A Top-Down Approach