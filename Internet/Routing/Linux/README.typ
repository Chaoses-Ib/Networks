#import "@local/ib:0.1.0": *
#title[Linux Routing]
#a[Policy Routing with Linux][http://www.policyrouting.org/PolicyRoutingBook/]

= Routing tables
- ```sh ip rule show```
  ```sh
  0:      from all lookup local
  32766:  from all lookup main
  32767:  from all lookup default
  ```

- ```sh ip route show table local```
  ```sh
  local 1.2.3.4 dev eth0 proto kernel scope host src 1.2.3.4 
  broadcast 1.2.3.255 dev eth0 proto kernel scope link src 1.2.3.4 
  local 127.0.0.0/8 dev lo proto kernel scope host src 127.0.0.1 
  local 127.0.0.1 dev lo proto kernel scope host src 127.0.0.1 
  broadcast 127.255.255.255 dev lo proto kernel scope link src 127.0.0.1
  ```

- ```sh ip route show``` (`table main`)

  ```sh
  default via 1.2.3.1 dev eth0 onlink 
  1.2.3.0/24 dev eth0 proto kernel scope link src 1.2.3.4
  ```

#a[networking - Routing to the localhost, how does it work? - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/292834/routing-to-the-localhost-how-does-it-work]

= Local net
- ```conf net.ipv4.conf.eth0.route_localnet```

  #a[Linux Kernel `route_localnet` setting | Runtux Blog][https://blog.runtux.com/posts/2024/01/18/]

  #q[Some applications are using local servers that listen only to the loopback address and expect these to be able to only receive packets via the loopback interface – from local processes running on the same machine as the server.

  This is always a dangerous assumption, so you should never do dangerous things that rely on this type of (non-) authentication. At least on Linux there is some safeguard as long as you keep the setting of the route_localnet to 0. On other operating systems you may not be so lucky. And even on Linux this behaviour can be turned off.]

  #a[linux - Sending packets meant for an address on 127.0.0.1/8 to the network on Ubuntu - Super User][https://superuser.com/questions/1560665/sending-packets-meant-for-an-address-on-127-0-0-1-8-to-the-network-on-ubuntu]

- How to route local packets targeting `eth0` IP address to 127.0.0.1?

  So local services (and remote tunnels) can access each other via domain names and without exposing ports.

  - Listen on `0.0.0.0` and block external packages from `eth0` instead.
    - Expose by default.

    nftables:
    ```conf
    table inet filter {
      chain input {
        type filter hook input priority filter;
        ip saddr != { 127.0.0.1, 1.2.3.4 } tcp dport 3389 drop
      }
    }
    ```

  - DNS + `hosts`
    - Asymmetric configs
    - Doesn't work for remote tunnels unless all DNS queries are resolved on the server.

  - iptables/nftables NAT
    - `route_localnet` risk
    - Performance cost?

    ```sh
    sysctl net.ipv4.conf.eth0.forwarding=1
    
    sysctl -w net.ipv4.conf.eth0.route_localnet=1 # to enable redirecting to localhost
    EXTERNAL_IP=8.8.8.8 #change this line to reflect external ipaddress
    sudo iptables -t nat -A OUTPUT -d ${EXTERNAL_IP} -j DNAT --to-destination 127.0.0.1
    ```
    #a[networking - Redirect an external IP to localhost? - Ask Ubuntu][https://askubuntu.com/questions/1168293/redirect-an-external-ip-to-localhost]

    #a[loopback - redirect external request to localhost with iptables - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/570194/redirect-external-request-to-localhost-with-iptables]

    #a[linux - How do I route a packet to use localhost as a gateway? - Stack Overflow][https://stackoverflow.com/questions/4941184/how-do-i-route-a-packet-to-use-localhost-as-a-gateway]

  - ```sh ip addr add $EXTERNAL_IP/32 dev lo```

  - Let tunnels handle it.

  #a[routing - Linux: force source address for packets to locally bound IPs - Server Fault][https://serverfault.com/questions/532611/linux-force-source-address-for-packets-to-locally-bound-ips]

  #a[linux - How to route requests to an internal address to localhost - Unix & Linux Stack Exchange][https://unix.stackexchange.com/questions/665709/how-to-route-requests-to-an-internal-address-to-localhost]
