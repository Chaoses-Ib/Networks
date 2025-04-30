# Virtual Private Networks
[Wikipedia](https://en.wikipedia.org/wiki/Virtual_private_network)

[networking - How does an L2 VPN actually work? - Super User](https://superuser.com/questions/1849177/how-does-an-l2-vpn-actually-work)

[除了warp和proton还有哪些免费的wireguard？](https://www.nodeseek.com/post-298376-1)

[免费为你的小鸡添加45+国家/100+地区落地永久出口，并解锁GPT/流媒体](https://www.nodeseek.com/post-284220-1)

## [WARP](https://one.one.one.one/)
Protocols:
- WireGuard
- MASQUE

  [Diniboy1123/usque: Open-source reimplementation of the Cloudflare WARP client's MASQUE protocol.](https://github.com/Diniboy1123/usque)

Endpoints:
- `engage.cloudflareclient.com`
- https://1.1.1.1/cdn-cgi/trace
- [peanut996/CloudflareWarpSpeedTest: ⭐WARP IP 优选工具](https://github.com/peanut996/CloudflareWarpSpeedTest)

  > 中国大陆WARP已全面被Ban，本工具无法查询到任何IPv4的IP地址。
- [Cloudflare Warp / Zero Trust 中国专线使用体验 - V2EX](https://www.v2ex.com/t/1125420)

Clients:
- WARP

  [Route traffic - Cloudflare Zero Trust docs](https://developers.cloudflare.com/cloudflare-one/connections/connect-devices/warp/configure-warp/route-traffic/)
- [wgcf: 🚤 Cross-platform, unofficial CLI for Cloudflare Warp](https://github.com/ViRb3/wgcf)
  - `scoop install wgcf`
  - [Set mtu to 1280 - Issue #40](https://github.com/ViRb3/wgcf/issues/40)
  - [WARP+ not work - Issue #85](https://github.com/ViRb3/wgcf/issues/85)

    > So yes, from the looks of it, even the official 1.1.1.1 app with WARP+ will be warp=on when using Wireguard instead of MASQUE
    - [Generated config doesn't use Warp=plus even if I have an active subscription. - Issue #459 - ViRb3/wgcf](https://github.com/ViRb3/wgcf/issues/459)

      > Your WARP+ license is valid, but your Linux device is registering as a "child" under your WARP+ account, and Cloudflare does not activate WARP+ on child devices, even if the license key is correct.
  - Only one account
- [wgcf-cli: A command-line tool for Cloudflare-WARP API, built using Cobra.](https://github.com/ArchiveNetwork/wgcf-cli)
- Clash
  - [WireGuard](https://wiki.metacubex.one/config/proxies/wg/)
  - [\[Feature\] 关于MASQUE协议 - Issue #1559 - MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo/issues/1559)

  [\[Bug\] wireguard利用dialer-proxy选项 使CF WARP通过VPS中继失败 - Issue #678 - MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo/issues/678)

[Cloudflare WARP 教程：给 VPS 额外添加"原生" IPv4/IPv6 双栈网络出口](https://bs.openface.cc/2023/10/cloudflare-warp-vps-ipv4ipv6.html)

[Cloudflare WARP提取WireGuard配置文件 - PEANUT996](https://peanut996.com/wireguard-from-warp/)

[WARP通杀篇续集：三种方法提取WireGuard密钥 | 花墨世界](https://sssis.me/warp-to-wireguard-2.html)
- https://t.me/generatewarpplusbot

[MisakaNo の 小破站 / warp-script - GitLab](https://gitlab.com/Misaka-blog/warp-script)

[vvbbnn00/WARP-Clash-API: 该项目可以让你通过订阅的方式使用Cloudflare WARP+，自动获取流量。This project enables you to use Cloudflare WARP+ through subscription, automatically acquiring traffic.](https://github.com/vvbbnn00/WARP-Clash-API)

[【教程】利用免费tunnelbroker+warp实现全球任意区域落地 - 技术教程 - CloChat](https://clochat.com/t/topic/1951)

## Android
- [VPN Hotspot: Share your VPN connection over hotspot or repeater! (root required)](https://github.com/Mygod/VPNHotspot)