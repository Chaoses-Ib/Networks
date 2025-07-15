# IP Addresses
[Wikipedia](https://en.wikipedia.org/wiki/IP_address)

[Wikipedia:IP addresses are not people - Wikipedia](https://en.wikipedia.org/wiki/Wikipedia:IP_addresses_are_not_people)

## CLI
- `hostname -I` (`--all-ip-addresses`)

  > Display all network addresses of the host. This option enumerates all configured addresses on all network inter‐faces. The loopback interface and IPv6 link-local addresses are omitted. Contrary to option -i, this option does not depend on name resolution. Do not make any assumptions about the order of the output.

- `ip addr show eth0 | grep "inet\b" | awk '{print $2}' | cut -d/ -f1`

[How to display IP address of eth0 interface using a shell script? - Ask Ubuntu](https://askubuntu.com/questions/560412/how-to-display-ip-address-of-eth0-interface-using-a-shell-script)

[networking - How can I display the IP address of an interface? - Server Fault](https://serverfault.com/questions/195273/how-can-i-display-the-ip-address-of-an-interface)

## Echo services
HTTP:
- [查看我的 IP 地址 | 查询本机 IP 地址及归属地 | 查看 DNS 出口 IP | 查看递归 DNS 信息 | 测试 CDN 命中节点 | Sukka | https://ip.skk.moe](https://ip.skk.moe/)
- [BGP.Tools](https://bgp.tools/)
- [Wikipedia:Get my IP address - Wikipedia](https://en.wikipedia.org/wiki/Wikipedia:Get_my_IP_address?withJS=MediaWiki:Get-my-ip.js)
- [http://ip.me](https://ip.me/)
  - Netherlands
  - `curl -s ip.me`
- [ipify - A Simple Public IP Address API](https://www.ipify.org/)
  - http://api.ipify.org
  - https://api.ipify.org
  - https://api.ipify.org?format=json
  - Cloudflare
- https://api.myip.com (Text)
  - Cloudflare
- https://api.my-ip.io/ip (Text)
  - German
- https://ipecho.net/plain (Text)
  - GCP?
- https://ipv4.ping0.cc
  - SpartanHost
- China
  - http://myip.ipip.net/ (Natural text, 0.26s)
  - https://2024.ip138.com/ (HTML, 0.11s)
  - https://2024.ipchaxun.com/ (JSON)
    - （海外）腾讯云, 0.14s
  - https://api-v3.speedtest.cn/ip (JSON, `1.2.3.*`)
    - 阿里云杭州, 0.18s
- ~~https://ip.seeip.org~~

DNS:
- myip.opendns.com
- o-o.myaddr.l.google.com

[ihmily/ip-info-api: Free IP information query APIs / 免费IP信息查询API接口，GET请求，可直接访问，无任何鉴权](https://github.com/ihmily/ip-info-api)

Libraries:
- Rust
  - [rust-public-ip: Find the public IP address of a device](https://github.com/avitex/rust-public-ip)
  - [public-ip-address: Rust crate to retrieve public IP address and geolocation data. 🦀](https://github.com/ghztomash/public-ip-address)
  - [16Hexa/nginx-control](https://github.com/16Hexa/nginx-control)

## Blocklists
- [CrowdSec blocklists](../Security/Firewalls/CrowdSec.md#decisions)

  [IP Lookup](https://app.crowdsec.net/cti)
- [firehol/blocklist-ipsets: ipsets dynamically updated with firehol's update-ipsets.sh script](https://github.com/firehol/blocklist-ipsets)
- [ProxyDB - Proxies By IP](https://proxydb.net/by_ip)
