# Windows Firewalls
- 某些云服务商（例如阿里云）提供的 Windows 服务器镜像默认关闭了防火墙，需要手动开启。

屏蔽所有协议时会表现为 blackhole，不会响应 TCP 的 SYN。

## Libraries
Rust:
- [winfw-rs: Bindings for Windows Firewall from Rust](https://github.com/marirs/winfw-rs)
  - Cannot enable firewall automatically.

## Tools
- [simplewall: Simple tool to configure Windows Filtering Platform (WFP) which can configure network activity on your computer.](https://github.com/henrypp/simplewall)

  `scoop install simplewall`

- [Windows Firewall Notifier: WFN extends the default Windows embedded firewall by allowing to handle and notify about outgoing connections, offers real time connections monitoring, connections map, bandwidth usage monitoring and more...](https://github.com/wokhan/WFN)

- [WaGi Coding's IP-Blacklister (Windows Firewall): This Tool blocks a Mass of IP Adresses via the Windows Firewall. You can run in Automatic-Mode using a Abusive IP List like blocklist.de](https://github.com/WaGi-Coding/WaGis-Mass-IP-Blacklister-Windows)