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
  - [Adapting fail2ban for nginx](https://forum.nginx.org/read.php?11,223078,247238)
- [IPBan: Since 2011, IPBan is the worlds most trusted, free security software to block hackers and botnets. With both Windows and Linux support, IPBan has your dedicated or cloud server protected. Upgrade to IPBan Pro today and get a discount. Learn more at ↓](https://github.com/digitalruby/ipban)
  - OS: Windows Server 2016 or newer
  - [IPBan Pro](https://ipban.com/) (paid)
- [EvlWatcher: a "fail2ban" style modular log file analyzer for windows](https://github.com/devnulli/EvlWatcher)
- [Fail2Ban4Win: 🧱 Ban subnets using Windows Firewall rules after they make enough incorrect login attempts, as indicated by Windows Event Log records.](https://github.com/Aldaviva/Fail2Ban4Win)
- [wail2ban: fail2ban, for windows.](https://github.com/glasnt/wail2ban) (discontinued)

Discussions:
- 2021-09 [Is there a fail2ban alternative for Windows? : r/jellyfin](https://www.reddit.com/r/jellyfin/comments/plfjc9/is_there_a_fail2ban_alternative_for_windows/)
- 2024-02 [Anyway of having something similar to fail2ban for a window cw control server? : r/msp](https://www.reddit.com/r/msp/comments/1azvdqu/anyway_of_having_something_similar_to_fail2ban/)