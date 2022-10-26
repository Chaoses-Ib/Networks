# Internet Layer
[^topdown]
## Services
- Guaranteed delivery
- Guaranteed delivery with bounded delay
- In-order packet delivery
- Guaranteed minimal bandwidth
- Security

The Internet’s network layer provides a single service, known as *best-effort service*.

## Data plane
The data plane functions of the network layer are the per-router functions in the network layer that determine how a datagram (that is, a network-layer packet) arriving on one of a router’s input links is forwarded to one of that router’s output links.

### Forwarding
When a packet arrives at a router’s input link, the router must move the packet to the appropriate output link.

## Control plane
The control plane functions of the network laye are the network-wide logic that controls how a datagram is routed among routers along an end-to-end path from the source host to the destination host. 

### Routing
The network layer must determine the route or path taken by packets as they flow from a sender to a receiver.

[^topdown]: Computer Networking：A Top-Down Approach