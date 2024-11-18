# Domain Name System
[Wikipedia](https://en.wikipedia.org/wiki/Domain_Name_System)

## Subdomains
### `www` subdomain
Discussions:
- 2009-10 [domain name - What is the purpose of the WWW subdomain? - Super User](https://superuser.com/questions/60006/what-is-the-purpose-of-the-www-subdomain)
- 2012-09 [www vs using root domain : r/webdev](https://www.reddit.com/r/webdev/comments/10ajc6/www_vs_using_root_domain/)
- 2024-02 [domain name system - Is it better to redirect root to www or www to root? - Server Fault](https://serverfault.com/questions/1153285/is-it-better-to-redirect-root-to-www-or-www-to-root)

[5个方法将不带www的根域名301重定向到www主域名 - 米发](https://www.mfpad.com/blog/forwarding-naked-domain-to-www-domain)

## Record types
[List of DNS record types - Wikipedia](https://en.wikipedia.org/wiki/List_of_DNS_record_types)

### CNAME records
[Why CNAME/MX/NS targets require a "dot" | DNSControl](https://docs.dnscontrol.org/language-reference/why-the-dot)

Some DNS control panels add the final dot automatically.
- AWS Route 53

  [domain name system - AWS Route 53 CNAME - dot at end of target value or not? - Server Fault](https://serverfault.com/questions/861134/aws-route-53-cname-dot-at-end-of-target-value-or-not)
  > A trailing dot is optional; Amazon Route 53 assumes that the domain name is fully qualified. This means that Amazon Route 53 treats *www.example.com* (without a trailing dot) and *www.example.com.* (with a trailing dot) as identical.

- 阿里云

Tools:
- [CNAME Lookup - MxToolbox](https://mxtoolbox.com/CNAMELookup.aspx)

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

## Subdomain discovery
- Brute force enumeration
- Server
  - [Reverse DNS lookup](Reverse%20DNS%20Lookup.md)
  - Certificates
    - [→Certificate Transparency]()
  - Port scan
- Search engines
  - `site:example.com`
- WHOIS databse

[Subdomain enumeration tools and techniques](https://www.ceeyu.io/resources/blog/subdomain-enumeration-tools-and-techniques)

Tools:
- [BBOT: A recursive internet scanner for hackers.](https://github.com/blacklanternsecurity/bbot)

  [How it Works - BBOT Docs](https://www.blacklanternsecurity.com/bbot/Dev/how_it_works/)

- [OneForAll: OneForAll是一款功能强大的子域收集工具](https://github.com/shmilylty/OneForAll)

- [dnsub: 一款好用且强大的子域名扫描工具](https://github.com/yunxu1/dnsub) (discontinued)

- [reconbulk: Automated Subdomain Enumeration and Scanning Tool](https://github.com/TaurusOmar/reconbulk) (discontinued)

- [knock: Knock Subdomain Scan](https://github.com/guelfoweb/knock)
  - Brute force enumeration
  - Certificates

- [lijiejie/subDomainsBrute: A fast sub domain brute tool for pentesters](https://github.com/lijiejie/subDomainsBrute) (discontinued)
  - Brute force enumeration
  - Certificates

- [ksubdomain: 无状态子域名爆破工具](https://github.com/knownsec/ksubdomain) (discontinued)
  - Brute force enumeration

## Windows
[Domain Name System - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/dns/dns-start-page)

Flush: `ipconfig /flushdns`

## Firewalls
- [Pi-hole: Network-wide Ad Blocking](https://pi-hole.net/) ([GitHub](https://github.com/pi-hole/pi-hole))

- hosts

  Not work with TXT records?

- Windows Firewall

  Can only block all UDP connections with a target port of 53 of a program.