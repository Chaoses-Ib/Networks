# Explicit Congestion Notification (ECN)
[Wikipedia](https://en.wikipedia.org/wiki/Explicit_Congestion_Notification)

> Conventionally, TCP/IP networks signal congestion by dropping packets. When ECN is successfully negotiated, an ECN-aware router may set a mark in the IP header instead of dropping a packet in order to signal impending congestion. The receiver of the packet echoes the congestion indication to the sender, which reduces its transmission rate as if it detected a dropped packet.

> Rather than responding properly or ignoring the bits, some outdated or faulty network equipment has historically dropped or mangled packets that have ECN bits set. As of 2015, measurements suggested that the fraction of web servers on the public Internet for which setting ECN prevents network connections had been reduced to less than 1%.

> Passive support has existed in Ubuntu Linux since 12.04 and in Windows Server since 2012. Passive support in the most popular websites has increased from 8.5% in 2012 to over 70% in May 2017. Adoption across the Internet now requires clients to actively request ECN. In June 2015, Apple announced that ECN will be enabled by default on its supported and future products, to help drive the adoption of ECN signaling industry-wide.

## QUIC
[ECN in QUIC - quicwg/base-drafts Wiki](https://github.com/quicwg/base-drafts/wiki/ECN-in-QUIC)

- quic-go
  - `QUIC_GO_DISABLE_ECN=true`

  [GSO fails on some platforms / interfaces - Issue #3911 - quic-go/quic-go](https://github.com/quic-go/quic-go/issues/3911)
  - [ecn bug - Issue #4178 - quic-go/quic-go](https://github.com/quic-go/quic-go/issues/4178)
  - [disable GSO and ECN on kernels older than version 5 by marten-seemann - Pull Request #4456 - quic-go/quic-go](https://github.com/quic-go/quic-go/pull/4456)
  - [配置都正常但是还是连接不了 failed to initialize client (connect error: timeout: no recent network activity) - Issue #929 - apernet/hysteria](https://github.com/apernet/hysteria/issues/929)
  - [disable quic-go's ECN support by default by fatedier - Pull Request #4069 - fatedier/frp](https://github.com/fatedier/frp/pull/4069)
