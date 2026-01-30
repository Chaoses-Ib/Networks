#import "@local/ib:0.1.0": *
#title[TCP Performance]
- Congestion control
- Packet scheduling
- TCP window size

Recommended settings:
```conf
net.ipv4.tcp_congestion_control = bbr
net.core.default_qdisc = fq

net.ipv4.tcp_adv_win_scale = 1
# BDP*2
net.ipv4.tcp_rmem = 4096 131072 15000000
net.ipv4.tcp_wmem = 4096 16384 15000000
net.ipv4.tcp_notsent_lowat = 131072
net.ipv4.tcp_slow_start_after_idle = 0
```

Congestion control + packet scheduling:
```sh
cat /proc/sys/net/ipv4/tcp_congestion_control
cat /proc/sys/net/core/default_qdisc

# echo "cubic" > /proc/sys/net/ipv4/tcp_congestion_control
# echo "fq_codel" > /proc/sys/net/core/default_qdisc
echo "bbr" > /proc/sys/net/ipv4/tcp_congestion_control
echo "fq" > /proc/sys/net/core/default_qdisc

cat /proc/sys/net/ipv4/tcp_congestion_control
cat /proc/sys/net/core/default_qdisc
```

#a[linux - better TCP performance over a "high delay network" - Server Fault][https://serverfault.com/questions/300070/better-tcp-performance-over-a-high-delay-network]

#a[部分地区到美西CN2GIA及CMIN2的单线程速度存在问题][https://www.nodeseek.com/post-201967-1]

Tools:
- #a[TCP 迷之调参 - 智能网络优化工具][https://omnitt.com/]
- https://cdn.skk.moe/sh/optimize.sh

= TCP window size
- `tcp_rmem`, `tcp_wmem`
- `tcp_adv_win_scale`
- `sk_rcvbuf`
- Linux autotuning
  - ```sh ss -tmi```

#q[TCP receive window is the maximum number of unacknowledged user payload bytes the sender should transmit (bytes-in-flight) at any point in time.
The size of the receive window can and does go up and down during the course of a TCP session.
It is a mechanism whereby the receiver can tell the sender to stop sending if the sent packets cannot be successfully received because the receive buffers are full.
It is this receive window that often limits throughput over high-latency networks.]

Debian 13:
```conf
net.ipv4.tcp_rmem = 4096 131072 6291456
net.ipv4.tcp_wmem = 4096 16384 4194304
net.ipv4.tcp_adv_win_scale = 1
net.ipv4.tcp_notsent_lowat = 4294967295
```

#a[Performance Tuning - klzgrad/naiveproxy Wiki][https://github.com/klzgrad/naiveproxy/wiki/Performance-Tuning]
- $"Mbps"/8 times "RTT/s" times 2$
  ```conf
  net.ipv4.tcp_adv_win_scale = 1
  # Client
  net.ipv4.tcp_rmem = 4096 131072 67108864
  # Server
  net.ipv4.tcp_wmem = 4096 16384 67108864
  net.ipv4.tcp_notsent_lowat = 131072
  ```
- ```conf net.ipv4.tcp_slow_start_after_idle = 0```

#a[Optimizing TCP for high WAN throughput while preserving low latency][https://blog.cloudflare.com/optimizing-tcp-for-high-throughput-and-low-latency/]
- #q[The tradeoff is that using a low value for `tcp_rmem` limits TCP throughput over high latency links.]
- #q[Because Linux autotuning will adjust correctly for sessions with lower RTTs and bottleneck links with lower throughput, all we need to be concerned about are the maximums.]

  $"BDP"times 4
  = "Mbps"/8 times "RTT/s" times 4
  = "Mbps" times "RTT/s"/2
  $
- ```conf
  net.ipv4.tcp_rmem = 8192 262144 536870912
  net.ipv4.tcp_wmem = 4096 16384 536870912
  net.ipv4.tcp_adv_win_scale = -2
  #net.ipv4.tcp_collapse_max_bytes = 6291456
  net.ipv4.tcp_notsent_lowat = 131072
  ```
  #q[The middle value of `tcp_rmem` was changed (from `2097152` to `262144`) as a result of separate work that found that Linux autotuning was setting receive buffers too high for localhost sessions.
  This updated setting reduces TCP memory usage for those sessions, but does not change anything about the type of TCP sessions that is the focus of this post.]

#a[『败类教程』美西CN2跨网也能单线程500M且0重传！手把手教你TCP调优][https://www.nodeseek.com/post-197087-1]
- #a[TCP缓冲区计算器][https://tcp-cal.mereith.com/]
- #a[BlackSheep-cry/TCP-Optimization-Tool: 一个较为灵活的TCP调优工具，依据iperf3测试结果进行调优][https://github.com/BlackSheep-cry/TCP-Optimization-Tool]

= Windows
Windows performs better for high-latency networks with the default CUBIC congestion control algorithm.
- Probably because it uses a larger maximum TCP window size.
- However, when using the BBR2 congestion control it can be slow, perhaps because the maximum window size is too large.
