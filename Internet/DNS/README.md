# Domain Name System
[Wikipedia](https://en.wikipedia.org/wiki/Domain_Name_System)

## Record types
[List of DNS record types - Wikipedia](https://en.wikipedia.org/wiki/List_of_DNS_record_types)

### TXT records
[Wikipedia](https://en.wikipedia.org/wiki/TXT_record)

Tools:
- nslookup: `nslookup -type=TXT villagevines.com`
- PowerShell: `Resolve-DnsName example.com -Type TXT`
- Web
  - [TXT Lookup - Check DNS TXT Records of Domain](https://dnslookup.online/txt.html)
  - [DNS Lookup Text Record - MxToolbox](https://mxtoolbox.com/TXTLookup.aspx)
  - [NsLookup.io](https://www.nslookup.io/txt-lookup/)
- China
  - [ITDOG](https://www.itdog.cn/dns/)
  - [DNS查询 - 站长工具](https://tool.chinaz.com/dns)

## Transport protocols
### DNS over UDP
Port number: 53

### DNS over QUIC
The design goal of DNS over QUIC (DoQ) is to provide DNS privacy with minimum latency. Although encrypted DNS protocols such as DNS over TLS and DNS over HTTPS are already established and in use, these protocols have several shortcomings due to being based on TCP, which DoQ attempts to overcome with QUIC's features. DoQ is currently being standardized within the DNS PRIVate Exchange IETF working group. [^DoQ-APNIC][^DoQ-V2EX-1]

[^DoQ-APNIC]: [A first look at DNS over QUIC | APNIC Blog](https://blog.apnic.net/2022/03/29/a-first-look-at-dns-over-quic/)
[^DoQ-V2EX-1]: [有没有用 DoQ 的 - V2EX](https://www.v2ex.com/t/844822#reply4)

## Windows
[Domain Name System - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/dns/dns-start-page)

Flush: `ipconfig /flushdns`

## Firewalls
- [Pi-hole: Network-wide Ad Blocking](https://pi-hole.net/) ([GitHub](https://github.com/pi-hole/pi-hole))

- hosts

  Not work with TXT records?

- Windows Firewall

  Can only block all UDP connections with a target port of 53 of a program.