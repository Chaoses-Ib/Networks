# Rate Limiting
[Wikipedia](https://en.wikipedia.org/wiki/Rate_limiting)

## Libraries
Rust:
- [ratelimit\_meter: A leaky-bucket-as-a-meter rate-limiting implementation in Rust](https://github.com/antifuchs/ratelimit_meter)
  - [governor: A rate-limiting library for Rust (f.k.a. ratelimit\_meter)](https://github.com/boinkor-net/governor)
- [rhythm: Rate limiting crate in rust](https://github.com/edmundselliot/rhythm)

## Servers
- [→Nginx](../Application/HTTP/Servers/Nginx/README.md#rate-limiting)

## Response-dependent rate limiting
Tools:
- [Fail2Ban: Daemon to ban hosts that cause multiple authentication errors](https://github.com/fail2ban/fail2ban) ([Wikipedia](https://en.wikipedia.org/wiki/Fail2ban))
  - OS: Linux
    - `apt install fail2ban`
    - [\[BR\]: fail2ban does not start on some debian/ubuntu systems - backend should probably be set to systemd on all systemd-based distros - Issue #3292 - fail2ban/fail2ban](https://github.com/fail2ban/fail2ban/issues/3292#issuecomment-1142503461)
      - [\[BR\]: Failed during configuration: Have not found any log file for sshd jail - Issue #3567 - fail2ban/fail2ban](https://github.com/fail2ban/fail2ban/issues/3567)
  - `/etc/fail2ban`
  - fail2ban-client
  - `jail.conf`
    - Defaults
      - SSH servers
      - HTTP servers
        - Apache, Nginx, PHP, lighttpd
        - Proxy: squid, 3proxy
      - Webmail and groupware servers
      - Web applications
      - FTP servers
      - Mail servers
      - DNS servers
      - Others
        - SQL servers
  - Nginx
    - [`filter.d/nginx-limit-req.conf`](https://github.com/fail2ban/fail2ban/blob/master/config/filter.d/nginx-limit-req.conf)
    - [BlockChainCaffe/Nginx-Fail2Ban-filters: A set of optional Fail2Ban filters for Nginx](https://github.com/BlockChainCaffe/Nginx-Fail2Ban-filters)
  
    [Survive DDOS attack with Nginx's and fail2ban](https://easyengine.io/tutorials/nginx/fail2ban/)

    [Adapting fail2ban for nginx](https://web.archive.org/web/20240907040327/https://forum.nginx.org/read.php?11,223078,247238)

  [How To Protect SSH with Fail2Ban on Ubuntu 20.04 | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-protect-ssh-with-fail2ban-on-ubuntu-20-04)

  [Guide to fail2ban - It works, but it's quite complicated : r/selfhosted](https://www.reddit.com/r/selfhosted/comments/1hnd6cj/guide_to_fail2ban_it_works_but_its_quite/)
- [→CrowdSec](Firewalls/CrowdSec.md)
- [SSHGuard](https://www.sshguard.net/) ([GitHub](https://github.com/sshguard/sshguard/))
- [IPBan: Since 2011, IPBan is the worlds most trusted, free security software to block hackers and botnets. With both Windows and Linux support, IPBan has your dedicated or cloud server protected. Upgrade to IPBan Pro today and get a discount. Learn more at ↓](https://github.com/digitalruby/ipban)
  - OS: Windows Server 2016 or newer
  - [IPBan Pro](https://ipban.com/) (paid)
- [EvlWatcher: a "fail2ban" style modular log file analyzer for windows](https://github.com/devnulli/EvlWatcher)
- [Fail2Ban4Win: 🧱 Ban subnets using Windows Firewall rules after they make enough incorrect login attempts, as indicated by Windows Event Log records.](https://github.com/Aldaviva/Fail2Ban4Win)
- [wail2ban: fail2ban, for windows.](https://github.com/glasnt/wail2ban) (discontinued)

Discussions:
- 2021-09 [Is there a fail2ban alternative for Windows? : r/jellyfin](https://www.reddit.com/r/jellyfin/comments/plfjc9/is_there_a_fail2ban_alternative_for_windows/)
- 2024-02 [Anyway of having something similar to fail2ban for a window cw control server? : r/msp](https://www.reddit.com/r/msp/comments/1azvdqu/anyway_of_having_something_similar_to_fail2ban/)

## Distributed rate limiting
单点 rate limiting 很好实现，多点就比较麻烦了，每个模块都要记录 IP，在调用其它模块时传递，其它模块还要限制来源或者添加 token 来避免伪造。直接使用内部 token 来绕过 limit 更简单一些，但是总 rate limit 是各点 rate limit 之和。

Nginx: [ngx_http_realip_module](../Application/HTTP/Servers/Nginx/README.md#ngx_http_realip_module)