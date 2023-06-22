# Link Layer
[Data link layer - Wikipedia](https://en.wikipedia.org/wiki/Data_link_layer), [Link layer - Wikipedia](https://en.wikipedia.org/wiki/Link_layer).

The **link layer** is the group of methods and communications protocols confined to the link that a host is physically connected to. The link is the physical and logical network component used to interconnect hosts or nodes in the network and a link protocol is a suite of methods and standards that operate only between adjacent network nodes of a network segment.[^wiki]

## Services
The basic service of any link layer is to move a datagram from one node to an adjacent node over a single communication link. Possible services that can be offered by a link-layer protocol include[^topdown]:
- Framing
  Almost all link-layer protocols encapsulate each network-layer datagram within a link-layer frame before transmission over the link. A frame consists of a data field, in which the network-layer datagram is inserted, and a number of header fields.
- Link access
  A medium access control (MAC) protocol specifies the rules by which a frame is transmitted onto the link. It serves to coordinate the frame transmissions of many nodes.
- Reliable delivery
  A link-layer reliable delivery service is often used for links that are prone to high error rates, such as a wireless link, with the goal of correcting an error locally—on the link where the error occurs—rather than forcing an end-to-end retransmission of the data by a transport- or application-layer protocol.
- Error detection and correction
  Many link-layer protocols provide a mechanism to detect bit errors.

## Network links and protocols
There are two types of network links[^topdown]:
- Point-to-point links
  A point-to-point link consists of a single sender at one end of the link and a single receiver at the other end of the link.
  Protocols:
  - Point-to-point protocol (PPP)
  - High-level data link control (HDLC)
- Broadcast links
  A broadcast link  can have multiple sending and receiving nodes all connected to the same, single, shared broadcast channel.
  - Ethernet
  - Wireless LANs

  在通常情况下，一旦发生碰撞所有传输的帧就会损坏，因此需要使用 [Multiple Access Protocols](MAC/README.md) 来规范主机在共享广播信道上的传输行为。

## Implementation
链路层的主体是在 **network adapter** 中实现的，也叫做 **network interface controller (NIC)**。位于网络适配器核心的是链路层控制器，通常为一个实现了许多链路层服务的专用芯片。链路层的软件部分负责实现高层链路层功能，例如组装链路层寻址信息和激活控制器硬件。[^topdown]

## Error-detection and -Correction
At the sending node, data, $D$ to be protected against bit errors is augmented with **error-detection and -correction bits (EDC)**.[^topdown]

- Parity Checks
- Checksumming Methods
- Cyclic Redundancy Check


[^wiki]: [Link layer - Wikipedia](https://en.wikipedia.org/wiki/Link_layer)
[^topdown]: Computer Networking：A Top-Down Approach