# Congestion control
> In contrast to TCP which moves the CCA to the kernel space, QUIC moves the CCA to both endpoints’ user spaces, to allow the algorithms to improve at a more rapid pace. This is one of several parts that are designed to prevent protocol ossification, so that QUIC remains a constantly developing protocol, unlike TCP which has been subjected to heavy ossification [5].[^chouchliapinImprovingBBRCongestion2023]

> The default CCA for TCP is CUBIC, both for Windows and Linux operating systems, however, QUIC has no defined default CCA. The most used CCAs are similar to that of TCP, which are CUBIC and NewReno.[^chouchliapinImprovingBBRCongestion2023]

How similar are the congestion control of QUIC and TCP?
- > QUIC’s congestion control mechanism is pretty much the same as TCP’s and doesn’t perform particularly well over e.g. mobile networks.[^hn]

  > It handles congestion control slightly differently since it can estimate the Round Trip Time more accurately, but it’s essentially the same ACK based mechanism that TCP uses. The current draft [0] from the QUIC working group basically describes TCP NewReno (the authors say so themselves).

  > Yes, congestion control is based on New Reno. But I think there are some higher level pieces where Quic is more flexible, and which can lead to higher performance on lossy links. E.g. has the ability to repackage data that was assumed lost in previous datagrams, and combine it with new data - leading to less total transmitted data in that cases. It doesn't have to retransmit every packet in exactly the same fashion. Some Quic implementation make use of this ability - while others don't. And it might also have a bit more flexibility when to retransmit (but I'm not an expert).

[How to select BBR as the congestion control in QUIC code?](https://groups.google.com/a/chromium.org/g/proto-quic/c/g27OSwdBeqM)

## Algorithms
- Loss-based
  - NeoReno
    - [RFC 9002 - QUIC Loss Detection and Congestion Control](https://datatracker.ietf.org/doc/rfc9002/)
- Hybrid
  - [BBR](#bbr)
    - mBBR[^chouchliapinImprovingBBRCongestion2023]
- Bandwidth-based
  - Brutal

### BBR
[BBR Congestion Control in QUIC and HTTP/3 ⋆ LiteSpeed Blog](https://blog.litespeedtech.com/2019/10/28/bbr-congestion-control-quic-http-3/)


[^chouchliapinImprovingBBRCongestion2023]: Chouchliapin, A. (2023). Improving the BBR congestion control algorithm for QUIC.
[^hn]: [I’m not an expert but QUIC doesn’t seem like enough of an improvement over TCP t... | Hacker News](https://news.ycombinator.com/item?id=24710737)
