# Domain Name System
[Wikipedia](https://en.wikipedia.org/wiki/Domain_Name_System)

DNS is a sort of distributed database, where the data is stored in a tree structure.

[一文搞清楚 DNS 的来龙去脉 - 林子er - 博客园](https://www.cnblogs.com/linvanda/p/15810600.html)

[中国全网DNS错误数据分析](https://blog.xlab.qianxin.com/zhong-guo-quan-wang-cuo-wu-shu-ju-fen-xi/)

[两份交流文档 -- DNS和AMQP | 风河博客](https://web.archive.org/web/20200921055953/http://blog.dnsbed.com/?p=302)

[十种 DNS 攻击类型和缓解措施 | Hui.Ke](https://www.hui.ke/posts/dns-attacks/)

[公司局域网出现大量DNS攻击是什么原因？ - 知乎](https://www.zhihu.com/question/503640038)

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

## Libraries
Rust:
- OS
  - std

    [Using std crates to make a DNS request - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/using-std-crates-to-make-a-dns-request/106069)

    [Is there a "better" way for dns resolving of an IP and connect? - help - The Rust Programming Language Forum](https://users.rust-lang.org/t/is-there-a-better-way-for-dns-resolving-of-an-ip-and-connect/101623)
  - [dns-lookup: A small libc::getaddrinfo wrapper for Rust to perform dns lookups.](https://github.com/keeperofdakeys/dns-lookup/)
- [hickory-dns: A Rust based DNS client, server, and resolver](https://github.com/hickory-dns/hickory-dns) (trust-dns)
  - [resolver](https://github.com/hickory-dns/hickory-dns/tree/main/crates/resolver)
    - UDP, TLS, HTTP/2, QUIC, HTTP/3

    > This library contains implementations for IPv4 (A) and IPv6 (AAAA) resolution, more features are in the works.
  - [recursor](https://github.com/hickory-dns/hickory-dns/tree/main/crates/recursor)

    > This library can be used to perform DNS resolution beginning with a set of root (hints) authorities. It does not require an upstream recursive resolver to find records in DNS.

  [DNS caching - Issue #296 - seanmonstar/reqwest](https://github.com/seanmonstar/reqwest/issues/296)
- [domain: A DNS library for Rust.](https://github.com/nlnetlabs/domain/)
- [notgull/async-dns: Asynchronous DNS lookups](https://github.com/notgull/async-dns)
  - [al8n/async-dns at patch](https://github.com/al8n/async-dns/tree/patch)
- [dingo: Command-line DNS client using bitvec, nom and RFC 1035](https://github.com/adamchalmers/dingo)

  [What I learned from making a DNS client in Rust](https://blog.adamchalmers.com/making-a-dns-client/) ([r/rust](https://www.reddit.com/r/rust/comments/u0uyjd/what_i_learned_from_making_a_dns_client_in_rust/))
- [rustdns: DNS Client in Rust](https://github.com/bramp/rustdns) (discontinued)
  - UDP, TCP, HTTPS, HTTPS JSON

## Tools
- [BIND 9 - ISC](https://www.isc.org/bind/)
  - `scoop install bind`
    ```pwsh
    arpaname.exe | ddns-confgen.exe | delv.exe | dig.exe | dnssec-cds.exe | dnssec-dsfromkey.exe | dnssec-importkey.exe | dnssec-keyfromlabel.exe | dnssec-keygen.exe 
    | dnssec-revoke.exe | dnssec-settime.exe | dnssec-signzone.exe | dnssec-verify.exe | host.exe | mdig.exe | named-checkconf.exe | named-checkzone.exe | named-com 
    pilezone.exe | named-journalprint.exe | named-rrchecker.exe | named.exe | nsec3hash.exe | nslookup-bind.exe | nsupdate.exe | rndc-confgen.exe | rndc.exe | tsig-keyge 
    n.exe
    ```

Web:
- [Dig web interface - online dns lookup tool](https://digwebinterface.com/?colorize=on&stats=on)
- [Dig（DNS 查询）](https://toolbox.googleapps.com/apps/dig/)

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

- [getaddrinfo](https://learn.microsoft.com/en-us/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfo)
- [GetAddrInfoExW](https://learn.microsoft.com/en-us/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexw)

- [`DnsQuery_A`](https://learn.microsoft.com/en-us/windows/win32/api/windns/nf-windns-dnsquery_a)

  [Windows-classic-samples/Samples/Win7Samples/netds/dns/dnsquery/DNSQuery.Cpp](https://github.com/microsoft/Windows-classic-samples/blob/main/Samples/Win7Samples/netds/dns/dnsquery/DNSQuery.Cpp)
- [`DnsQueryEx`](https://learn.microsoft.com/en-us/windows/win32/api/windns/nf-windns-dnsqueryex)

  Rust: notgull/async-dns
- [`DnsQueryRaw`](https://learn.microsoft.com/en-us/windows/win32/api/windns/nf-windns-dnsqueryraw)

[c++ - How does one specify a specific DNS server to query using DnsQuery? - Stack Overflow](https://stackoverflow.com/questions/8931824/how-does-one-specify-a-specific-dns-server-to-query-using-dnsquery)

[Query DNS using specific DNS servers in .NET - Stack Overflow](https://stackoverflow.com/questions/1565055/query-dns-using-specific-dns-servers-in-net)

## Firewalls
- [Pi-hole: Network-wide Ad Blocking](https://pi-hole.net/) ([GitHub](https://github.com/pi-hole/pi-hole))

- hosts

  Not work with TXT records?

- Windows Firewall

  Can only block all UDP connections with a target port of 53 of a program.

## DNS flood
[Wikipedia](https://en.wikipedia.org/wiki/DNS_Flood)

[domain name system - Estimating DNS bandwidth: Average size of a DNS request? - Server Fault](https://serverfault.com/questions/79424/estimating-dns-bandwidth-average-size-of-a-dns-request)
- 27+100=128 B/query

Variants:
- Phantom Domain Attack
- Random Subdomain Attack

Services:
- 阿里云
  - 免费版: 2万次/s (0.53~2.5MB/s)
  - 付费版: 20万次/s (5.3~25MB/s)
  - 基础防御: 1000万次/s (0.26~1.25GB/s)

Why this is not widely used?

[【漏洞分析】DDOS攻防分析（一）------DNS篇 - XuepengZ - 博客园](https://www.cnblogs.com/Shepherdzhao/p/15191084.html)
- 519暴风断网