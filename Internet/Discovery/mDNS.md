# Multicast DNS (mDNS)
[Wikipedia](https://en.wikipedia.org/wiki/Multicast_DNS)

- UDP port 5353
- Windows
- Chromium

## Windows
- `ping "$env:COMPUTERNAME.local"`

[mDNS and DNS-SD slowly making their way into Windows 10 | Ctrl blog](https://www.ctrl.blog/entry/windows-mdns-dnssd.html)

> All DNS-SD APIs and functionality are entirely disabled if you're running a machine with a Hyper-V kernel and route traffic through a Network Virtualized Switch. The other network discovery protocols deployed by Windows NBNS, LLMNR, and SSDP all still work even though DNS-SD is made unavailable. A very peculiar limitation, however, the ``Settings app`: `Network`: `Ethernet`` is also entirely broken in this scenario, so the newer Windows APIs may not entirely understand a switched interface from a virtualization host's perspective.

> **Update** (2017-01): The optional 'Device discovery' setting, part of Developer mode, now uses mDNS to announce the device on the network. It' unclear whether this will be on by default outside of developer mode at a later time.

> This requires version 1803 of the Windows 10 SDK or later.

Why the fuck it needs Windows SDK?

[bonjour - How to enable mDNS on Windows 10 build 17134? - Super User](https://superuser.com/questions/1330027/how-to-enable-mdns-on-windows-10-build-17134)
> In recent versions (tested on Windows 10 10.0.19042), it appears that Windows resolves mDNS for all applications out of the box, without needing a registry hack or Bonjour at all.

[Aligning on mDNS: ramping down NetBIOS name resolution and LLMNR | Microsoft Community Hub](https://techcommunity.microsoft.com/blog/networkingblog/aligning-on-mdns-ramping-down-netbios-name-resolution-and-llmnr/3290816)

[mDNS in the Enterprise | Microsoft Community Hub](https://techcommunity.microsoft.com/blog/networkingblog/mdns-in-the-enterprise/3275777)

[windows 10 - What happened to mDNS or Bonjour? Do I need it anymore? - Super User](https://superuser.com/questions/1824603/what-happened-to-mdns-or-bonjour-do-i-need-it-anymore)
> Windows 10 (as of release 10.16xx or thereabouts) does have a built-in mDNS and DNS-SD implementation, but it is not called "mDNSResponder". Rather, it's part of the same "Dnscache" service that also handles regular DNS.

[How to claim MDNS address on windows? : r/techsupport](https://www.reddit.com/r/techsupport/comments/12k9mbu/how_to_claim_mdns_address_on_windows/)