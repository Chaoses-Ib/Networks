# Congestion Control
[Wikipedia](https://en.wikipedia.org/wiki/TCP_congestion_control)

- 发送方如何感知拥塞？
  
  端到端拥塞控制：超时 / 接收到 3 个冗余 ACK
- 发送方该按什么算法来决定发送速率的限制？
  
  慢启动、拥塞避免和快速恢复。
- 发送方如何限制发送速率？
  
  Congestion window（拥塞窗口）

  $$LastByteSend-LastByteAcked\le \min{\{cwnd,rwnd\}}$$

## 拥塞控制算法
![](images/CongestionControl_FSM.png)
- cwnd 增加时总是伴随着 segment 的传输
- 当只存在冗余 ACK 形式的丢包时，cwnd 的变化规律为 Additive-Increase, Multiplicative-Decrease（AIMD，加性增、乘性减）

![|400](images/CongestionControl_TransmissionRound.png)

### 慢启动
刚建立连接时，cwnd 的长度为一个 MSS。每当一个 segment 被确认时就增加一个 MSS，以指数形式增长。

当 cwnd 达到 ssthresh（slow start threshold）时，连接会从慢启动转移到拥塞避免状态。

一旦发生超时，ssthresh 会被设为 cwnd 的一半，并将 cwnd 重置为一个 MSS，进行重传。

一旦收到 3 个冗余 ACK，ssthresh 会被设为 cwnd 的一半，并将 cwnd 减半后加上 3 个 MSS，进行重传，再转移到快速恢复状态。

### 拥塞避免
每当收到一个确认时，将 cwnd 增加 $\frac{MSS}{cwnd}\cdot MSS$，即一个 RTT 内增加一个 MSS，以线性形式增长。

一旦发生丢包，与慢启动状态执行相同操作。

### 快速恢复
每当收到一个重复 ACK，将 cwnd 增加一个 MSS。（因为当收到新 ACK 时 cwnd 会被设为 ssthresh，增加的 MSS 只会影响快速恢复状态）

当收到一个新 ACK，将 cwnd 设为 ssthresh，转移到拥塞避免状态。

一旦发生超时，与慢启动状态执行相同操作。

## Algorithms
Linux:
- BIC is used by default in Linux kernels 2.6.8 through 2.6.18. (August 2004 -- September 2006)
- CUBIC is used by default in Linux kernels since version 2.6.19. (November 2006)
- PRR is incorporated in Linux kernels to improve loss recovery since version 3.2. (January 2012)
- BBRv1 is incorporated in Linux kernels to enable model-based congestion control since version 4.9. (December 2016)

Windows:
```pwsh
> Get-NetTCPSetting | Select SettingName, CongestionProvider

SettingName      CongestionProvider
-----------      ------------------
Automatic
InternetCustom   CUBIC
DatacenterCustom CUBIC
Compat           NewReno
Datacenter       CUBIC
Internet         CUBIC
```

### BBR
[Wikipedia](https://en.wikipedia.org/wiki/TCP_congestion_control#TCP_BBR), [GitHub](https://github.com/google/bbr)

[When to use and not use BBR | APNIC Blog](https://blog.apnic.net/2020/01/10/when-to-use-and-not-use-bbr/)

[SMB Performance fixed by switching TCP congestion algo to BBR : r/homelab](https://www.reddit.com/r/homelab/comments/17iwe0v/smb_performance_fixed_by_switching_tcp_congestion/)
> In real work the differences are quite marked. I did a lot of work on Mobile network optimisation, we had a 25% increase in data goodput (payload) across the network by implementing a proxy, that's the equivalent of millions of $ of investment, or if you are looking at throughput a sustained 2% packet loss makes a 1G link run at about ~50mbps, with BBR you ignore (the packet gets sent but you don't throttle back) so you still get near enough 1Gbps

[Google's BBRv3 TCP Congestion Control Showing Great Results, Will Be Upstreamed To Linux - Phoronix](https://www.phoronix.com/news/Google-BBRv3-Linux)
> Google found BBRv3 to have a 12% reduction in the packet re-transmit rate and a slight latency improvement.
>
> Google engineers plan to propose mainlining BBRv3 into the Linux kernel TCP/networking code in August. The plan is to upgrade the BBR module to the v3 code from v1.

[BBR and FQ As new Defaults - Feature requests - VyOS Forums](https://forum.vyos.io/t/bbr-and-fq-as-new-defaults/12344)

[Queuing disciplines](../../Internet/Forwarding/Scheduling.md):
- [Linux Kernel-Tuning \[defect.ch - Wiki\]](https://wiki.defect.ch/os/linux/kernel-tuning)

  > You will find a lot of instructions which set “net.core.default_qdisc” to “fq”. The reason is, the first implementation was specifically designed for fq and you can still find references in the source code:
  > 
  > > NOTE: BBR might be used with the fq qdisc (“man tc-fq”) with pacing enabled, otherwise TCP stack falls back to an internal pacing using one high resolution timer per TCP socket and may use more resources.
  > 
  > According to the official documentation, BBR doesn't require fq anymore. It also works with fq_codel for example.
  > 
  > > This means that there is no longer a strict requirement to install the “fq” qdisc to use BBR. Any qdisc will work, though “fq” performs better for highly-loaded servers.

- [Can I use BBR with `fq_codel`?](https://groups.google.com/g/bbr-dev/c/4jL4ropdOV8)

  > BBR will run well with fq_codel only after linux-4.13

  > It can be said that BBR "runs well" with fq_codel in linux 4.9, in the sense of achieving high throughput. But, as Eric points out, the problem is that without some sort of pacing BBR will inject too many packets into the network too quickly. In that sense, BBR without pacing does not run well.
  > 
  > Without pacing in place, BBR would behave like the "BDP-scale line-rate burst" approach mentioned in that section. And beyond that, BBR without pacing keeps more packets in flight than the algorithm intends (because the algorithm periodically uses lower pacing rates to drain packets out of the bottleneck queue).

- What about `pfifo_fast`?

Linux:
```conf
CONFIG_TCP_CONG_BBR=y
CONFIG_DEFAULT_TCP_CONG="bbr"
```
```sh
# cat /proc/sys/net/ipv4/tcp_congestion_control
cubic
​# echo "bbr" > /proc/sys/net/ipv4/tcp_congestion_control
# cat /proc/sys/net/ipv4/tcp_congestion_control
bbr
```
- Permission denied: `sudo su`
- `echo: write error: No such file or directory`: Not supported
  - WSL2

  [how to enable BBR? - Porteus](https://forum.porteus.org/viewtopic.php?t=10807)

[Increase Linux Internet speed with TCP BBR congestion control - nixCraft](https://www.cyberciti.biz/cloud-computing/increase-your-linux-server-internet-speed-with-tcp-bbr-congestion-control/)

[Linux Kernel-Tuning \[defect.ch - Wiki\]](https://wiki.defect.ch/os/linux/kernel-tuning)

Windows 11 22H2:
```pwsh
netsh int tcp set supplemental Template=Internet CongestionProvider=bbr2
netsh int tcp set supplemental Template=Datacenter CongestionProvider=bbr2
netsh int tcp set supplemental Template=Compat CongestionProvider=bbr2
netsh int tcp set supplemental Template=DatacenterCustom CongestionProvider=bbr2
netsh int tcp set supplemental Template=InternetCustom CongestionProvider=bbr2

Get-NetTCPSetting | Select SettingName, CongestionProvider
```

WSL1:
- [Ubuntu on Windows WSL does not have tcp congestion. - Issue #1061 - esnet/iperf](https://github.com/esnet/iperf/issues/1061)

### [Brutal](https://github.com/apernet/tcp-brutal)
[Hakcer News](https://news.ycombinator.com/item?id=38164574)

> Kernel version 4.9 or later is required, version 5.8 or later is recommended. **If your kernel version is earlier than 5.8, only IPv4 is supported.** [(lack of exported symbol `tcpv6_prot`)](https://github.com/torvalds/linux/commit/6abde0b241224347cd88e2ae75902e07f55c42cb#diff-8b341e52e57c996bc4f294087ab526ac0b1c3c47e045557628cc24277cbfda0dR2124)
> 
> **⚠️ Warning** For systems with kernel versions lower than 4.13, you MUST manually enable fq pacing (`tc qdisc add dev eth0 root fq pacing`), otherwise TCP Brutal will not work properly.

> An important aspect to understand about TCP Brutal's rate setting is that it applies to each individual connection. **This makes it suitable only for protocols that support multiplexing (mux), which allows a client to consolidate all proxy connections into a single TCP connection.** For protocols that require a separate connection for each proxy connection, using TCP Brutal will overwhelm the receiver if multiple connections are active at the same time.

[tcp-brutal与udp-brutal - Issue #3 - apernet/tcp-brutal](https://github.com/apernet/tcp-brutal/issues/3)
> 个人使用感受，在同样的线路上跑tcp brutal没有udp brutal效果明显。tcp brutal速度不稳定也达不到设定速度

[都 2024 年了，该更新翻墙技术了](https://keakon.top/2024/01/12/%E9%83%BD2024%E5%B9%B4%E4%BA%86%EF%BC%8C%E8%AF%A5%E6%9B%B4%E6%96%B0%E7%BF%BB%E5%A2%99%E6%8A%80%E6%9C%AF%E4%BA%86)
> 我试了下只在服务端开启，也能使下载速度从约 10KB/s 提升到约 2MB/s。

Nginx: [brutal-nginx: Using TCP Brutal congestion control algorithm in NGINX](https://github.com/sduoduo233/brutal-nginx)
```nginx
# NGX_HTTP_MAIN_CONF|NGX_HTTP_SRV_CONF|NGX_HTTP_LOC_CONF|NGX_CONF_FLAG

tcp_brutal on;
# Send rate in bytes per second
tcp_brutal_rate 1048576;
```

[sing-box TCP Brutal配置-荒岛](https://lala.im/8902.html)

## 吞吐量
$$\begin{align} \\
\text{连接平均吞吐量}
&=\frac{0.75\times W}{RTT} \\
&=\frac{1.22\times MSS}{RTT \sqrt L}
\end{align}$$