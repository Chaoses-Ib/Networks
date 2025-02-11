# Port Hopping
## Random
[端口跳跃 - Hysteria 2](https://v2.hysteria.network/zh/docs/advanced/Port-Hopping/)
> 中国用户有时报告运营商会阻断或限速 UDP 连接。不过，这些限制往往仅限单个端口。端口跳跃可用作此情况的解决方法。

[UDP 端口跳跃，不连续的端口阻断 - V2EX](https://www.v2ex.com/t/1024299)

## Time-based
> We proposed and studied a new practical technique, called *port hopping*, to detect and mitigate the effect of DoS/DDoS flooding attacks. In this technique, the server's port numbers change dynamically as a function of time and a cryptographic key shared between the server and the client.[^leePortHoppingResilient2004]

- [udphop: 专用于UDP的端口跳跃及IP地址跳跃工具。A tool of UDP's Port Hopping & IP Address Hopping](https://github.com/cnbatch/udphop)

## Sequence-based

## Implementations
[→Proxy Servers](../../Internet/Proxy/README.md#tools)

- iptables
  ```sh
  # IPv4
  sudo iptables -t nat -A PREROUTING -i eth0 -p udp --dport 20000:50000 -j REDIRECT --to-ports 443
  # IPv6
  sudo ip6tables -t nat -A PREROUTING -i eth0 -p udp --dport 20000:50000 -j REDIRECT --to-ports 443
  ```
  [linux - iptables error: unknown option --dport - Server Fault](https://serverfault.com/questions/563033/iptables-error-unknown-option-dport)

- nftables
  ```nginx
  define INGRESS_INTERFACE="eth0"
  define PORT_RANGE=20000-50000
  define HYSTERIA_SERVER_PORT=443

  table inet hysteria_porthopping {
    chain prerouting {
      type nat hook prerouting priority dstnat; policy accept;
      iifname $INGRESS_INTERFACE udp dport $PORT_RANGE counter redirect to :$HYSTERIA_SERVER_PORT
    }
  }
  ```

- Nginx (`--with-stream`)
  ```nginx
  stream {
      server {
          listen 49000-50000 udp;
          proxy_pass 127:0.0.1:443;
      }
  }
  ```
  - `udp` is Linux only.
  - Listening on port range requires v1.15.10+.

    [Nginx Proxy a large port range to equivalent port on a different ip address - Server Fault](https://serverfault.com/questions/279262/nginx-proxy-a-large-port-range-to-equivalent-port-on-a-different-ip-address)

  [linux - UDP forwarding with nginx - Stack Overflow](https://stackoverflow.com/questions/40917372/udp-forwarding-with-nginx)

- NPS

### Windows
TCP:
```pwsh
# netsh interface ipv4 show interfaces
# netsh interface ipv4 set interface 2 forwarding=enabled
# netsh interface ipv4 show interface 2

for ($port = 49000; $port -le 50000; $port++) {
    netsh interface portproxy add v4tov4 listenport=$port listenaddress=0.0.0.0 protocol=tcp connectport=80 connectaddress=127.0.0.1
    Write-Host $port
}

netsh interface portproxy show all
netsh interface portproxy reset
```
[port range forwarding to WSL - Issue #8963 - microsoft/WSL](https://github.com/microsoft/WSL/issues/8963)

UDP:
- ~~`netsh interface portproxy add v4tov4 listenport=$port listenaddress=0.0.0.0 protocol=udp connectport=443 connectaddress=127.0.0.1`~~
- `netsh routing ip nat add portmapping "Ethernet" udp 0.0.0.0 50000 127.0.0.1 443`

  [networking - Simple port forwarding for UDP stream on Windows - Super User](https://superuser.com/questions/1667083/simple-port-forwarding-for-udp-stream-on-windows)

  [How to install and configure Windows server routing](https://rdr-it.com/en/how-to-install-config-windows-server-routing/)
- Virtual Switch / [WSL2](../../OS/WSL2/README.md)
- Realm
- rinetd
- socat
  - Doesn't support port range

    [Using Socat Listening Multiple Port (Port Range) - Stack Overflow](https://stackoverflow.com/questions/62549768/using-socat-listening-multiple-port-port-range)

  [networking - Forward incoming UDP Packets on Windows Server to client on different interface - Server Fault](https://serverfault.com/questions/1051667/forward-incoming-udp-packets-on-windows-server-to-client-on-different-interface)

  [UDP port forwarding with socat | Matt Ryall](https://mattryall.net/blog/udp-port-forwarding-with-socat)

  [Forwarding UDP --- Openport 2.0 documentation](https://openport.readthedocs.io/en/latest/recipes_forwarding_udp.html)
- NAS
- ~~Nginx~~

[UDP port forwarding in WSL2 - Issue #11194 - microsoft/WSL](https://github.com/microsoft/WSL/issues/11194)

[windows udp报文转发工具rinetd/AUTAPF - 代号尚行](https://blog.claves.cn/archives/8131)

[请问 windows 下有什么同时支持 udp 和范围端口的端口转发工具？ - V2EX](https://www.v2ex.com/t/826230)

[Windows UDP端口范围转发工具有没有？-美国VPS综合讨论-全球主机交流论坛 - Powered by Discuz!](https://hostloc.com/thread-1268196-1-1.html)


[^leePortHoppingResilient2004]: Lee, H. C. J., & Thing, V. L. L. (2004). Port hopping for resilient networks. IEEE 60th Vehicular Technology Conference, 2004. VTC2004-Fall. 2004, 5, 3291-3295 Vol. 5. https://doi.org/10.1109/VETECF.2004.1404672
