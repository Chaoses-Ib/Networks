#import "@local/ib:0.1.0": *
#title[#a[nftables][https://www.netfilter.org/projects/nftables/index.html]]
#a-badge[https://wiki.nftables.org/wiki-nftables/index.php/Main_Page]
#a-badge[https://en.wikipedia.org/wiki/Nftables]
#a-badge[https://wiki.archlinux.org/title/Nftables]

#q[*nftables* replaces the popular *{ip,ip6,arp,eb}tables*.
This software provides a new in-kernel packet classification framework that is based on a network-specific Virtual Machine (VM) and a new ```sh nft``` userspace command line tool.
*nftables* reuses the existing Netfilter subsystems such as the existing hook infrastructure, the connection tracking system, NAT, userspace queueing and logging subsystem.]

#a[netfilter/iptables project homepage - The netfilter.org project][https://netfilter.org/]

Looks hard, but actually easier than iptables.

#t[1811]
#a[I cannot believe the complexity of nftables : r/linux][https://www.reddit.com/r/linux/comments/9wog4x/i_cannot_believe_the_complexity_of_nftables/]

#t[2306]
#a[Ask HN: How to learn nftables? It's extremely complicated or it's just me? | Hacker News][https://news.ycombinator.com/item?id=36334895]

= Configuration
#a-badge[https://man.archlinux.org/man/nft.8]
#a-badge[https://wiki.archlinux.org/title/Nftables#Configuration]

#a[Quick reference-nftables in 10 minutes - nftables wiki][https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes]

- Symbolic variables

  ```conf
  define variable = expr
  undefine variable
  redefine variable = expr
  $variable
  ```

- ```conf != { ... }``` is supported although undocumented.
  #footnote[#a[Can I match a set negatively in nftables? - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/517271/can-i-match-a-set-negatively-in-nftables]]

  For example:
  - ```conf ip saddr != { 127.0.0.1, 1.2.3.4 } tcp dport 3389 drop```

#a[How to drop packets to port 5901 other than localhost with nftables - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/691605/how-to-drop-packets-to-port-5901-other-than-localhost-with-nftables]

== Debian
- `/etc/nftables.conf`
  ```conf
  #!/usr/sbin/nft -f

  flush ruleset

  table inet filter {
    chain input {
      type filter hook input priority filter;
    }
    chain forward {
      type filter hook forward priority filter;
    }
    chain output {
      type filter hook output priority filter;
    }
  }
  ```
- ```sh systemctl enable nftables```
- ```sh systemctl restart nftables```
