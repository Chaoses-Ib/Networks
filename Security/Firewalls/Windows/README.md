# Windows Firewalls
- 某些云服务商（例如阿里云）提供的 Windows 服务器镜像默认关闭了防火墙，需要手动开启。

屏蔽所有协议时会表现为 blackhole，不会响应 TCP 的 SYN。

## Hyper-V firewall
[Hyper-V firewall | Microsoft Learn](https://learn.microsoft.com/en-us/windows/security/operating-system-security/network-security/windows-firewall/hyper-v-firewall)

## Libraries
Rust:
- [winfw-rs: Bindings for Windows Firewall from Rust](https://github.com/marirs/winfw-rs)
  - Cannot enable firewall automatically.

.NET:
- [falahati/WindowsFirewallHelper: A class library to manage the Windows Firewall as well as adding your program to the Windows Firewall Exception list.](https://github.com/falahati/WindowsFirewallHelper)

## Tools
- [simplewall: Simple tool to configure Windows Filtering Platform (WFP) which can configure network activity on your computer.](https://github.com/henrypp/simplewall)

  `scoop install simplewall`

- [Windows Firewall Notifier: WFN extends the default Windows embedded firewall by allowing to handle and notify about outgoing connections, offers real time connections monitoring, connections map, bandwidth usage monitoring and more...](https://github.com/wokhan/WFN)

- [WaGi Coding's IP-Blacklister (Windows Firewall): This Tool blocks a Mass of IP Adresses via the Windows Firewall. You can run in Automatic-Mode using a Abusive IP List like blocklist.de](https://github.com/WaGi-Coding/WaGis-Mass-IP-Blacklister-Windows)

## Blocking IP addresses
[Using Windows Firewall to block a specific IP on Windows 10 - Super User](https://superuser.com/questions/1159401/using-windows-firewall-to-block-a-specific-ip-on-windows-10)

> Windows Firewall currently allows up to 1000 addresses per rule.

[Configuring many block IPs in Windows Firewall - Server Fault](https://serverfault.com/questions/196456/configuring-many-block-ips-in-windows-firewall)

[Deny access to 50,000 specific IP addresses using Windows Firewall - Stack Overflow](https://stackoverflow.com/questions/25283071/deny-access-to-50-000-specific-ip-addresses-using-windows-firewall)

[how do i add multiple ip addresses to be blocked into windows 11 - Microsoft Community](https://answers.microsoft.com/en-us/windows/forum/all/how-do-i-add-multiple-ip-addresses-to-be-blocked/7153857e-9291-40b8-8116-ee243ba34d43)