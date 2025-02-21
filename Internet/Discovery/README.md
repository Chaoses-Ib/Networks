# Service Discovery
[Wikipedia](https://en.wikipedia.org/wiki/Service_discovery)

- P2P
  - Broadcast
  - Multicast

  Security concerns

- Client-server

## Windows
- [NetBIOS Name Service (NBNS)](NetBIOS.md) (deprecated in favor of mDNS)
- [SSDP](Simple.md)
- [UPnP](UPnP.md)
- [LLTD](Link.md) (Windows Vista)
- [WS-Discovery](Web.md) (Windows Vista)
- [LLMNR](Link-Local.md) (Windows Vista, deprecated in favor of mDNS)
- [mDNS](mDNS.md) (Windows 10)
  - Edge

Windows runs 7 service discovery protocols by default... If Edge also counts then there are 8.

> Windows will special-case domains ending in the `.local` Top-Level Domain (TLD) and also do a sneaky NetBIOS Name Service (NBNS) (sometimes known as WINS) and a Link-Local Multicast Name Resolution (LLMNR) look-up of the domain without the TLD.[^mdns]

[windows - which protocols are used for network device discovery (aka: how to hide a device) - Super User](https://superuser.com/questions/1833733/which-protocols-are-used-for-network-device-discovery-aka-how-to-hide-a-device)

[How does Windows Network Discovery actually work? : r/networking](https://www.reddit.com/r/networking/comments/1cemlne/how_does_windows_network_discovery_actually_work/)


[^mdns]: [mDNS and DNS-SD slowly making their way into Windows 10 | Ctrl blog](https://www.ctrl.blog/entry/windows-mdns-dnssd.html)