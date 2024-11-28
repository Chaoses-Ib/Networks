# Linux
## iptables
[Wikipedia](https://en.wikipedia.org/wiki/Iptables)

### Persisting rules
```sh
sudo apt install iptables-persistent
```
Any time you modify your rules, run:
```sh
iptables-save > /etc/iptables/rules.v4
ip6tables-save > /etc/iptables/rules.v6
```

[How to save iptables firewall rules permanently on Linux - nixCraft](https://www.cyberciti.biz/faq/how-to-save-iptables-firewall-rules-permanently-on-linux/)

[boot - Why do iptables rules disappear when restarting my Debian system? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/52376/why-do-iptables-rules-disappear-when-restarting-my-debian-system)

[Firewall: Persisting Iptables Rules | Servers for Hackers](https://serversforhackers.com/c/firewall-persisting-iptables-rules)

But why isn't this built-in?
- For history reasons, persistent cannot be the default
  - > Not everybody uses `iptables` program directly. Some people may use wrappers, e.g. `ufw`. In that case, it is better to not to store raw rules, but make a wrapper to generate them from its own persistent config.
  - > Several tools around iptables don't expect its persistence. For example, if you use `fail2ban`, it adds iptables rules when jail starts and removes them when it stops. If you save rules with netfilter-persistent in between, and reboot a host, it'll remember everything that fail2ban did and then, when fail2ban starts, it adds everything again. After several cycles, you'll find your iptables bloated with duplicated fail2ban stuff.

  [ubuntu - Why Does Iptables rules not persisten by default? - Server Fault](https://serverfault.com/questions/1103763/why-does-iptables-rules-not-persisten-by-default)

- But why not add a `--persistent` flag at least? Isn't this much better than `iptables-save` if there are some programs will automatically modify the rules?

## Libraries
Rust:
- [yaa110/rust-iptables: Rust bindings for iptables](https://github.com/yaa110/rust-iptables)
- [nftables-rs: Safe abstraction for nftables JSON API (libnftables-json).](https://github.com/namib-project/nftables-rs)

## Android
- 2024-04 [求免root，不影响vpn的安卓防火墙 - 问题求助❓ / 小问答 - 小众软件官方论坛](https://meta.appinn.net/t/topic/55026)