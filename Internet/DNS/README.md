# Domain Name System
## DNS transport protocols
### DNS over QUIC
The design goal of DNS over QUIC (DoQ) is to provide DNS privacy with minimum latency. Although encrypted DNS protocols such as DNS over TLS and DNS over HTTPS are already established and in use, these protocols have several shortcomings due to being based on TCP, which DoQ attempts to overcome with QUIC's features. DoQ is currently being standardized within the DNS PRIVate Exchange IETF working group. [^DoQ-APNIC][^DoQ-V2EX-1]

[^DoQ-APNIC]: [A first look at DNS over QUIC | APNIC Blog](https://blog.apnic.net/2022/03/29/a-first-look-at-dns-over-quic/)
[^DoQ-V2EX-1]: [有没有用 DoQ 的 - V2EX](https://www.v2ex.com/t/844822#reply4)