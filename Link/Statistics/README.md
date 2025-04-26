# Statistics
- [spezifisch/ifstat-rs: ifstat reimplemented in rust, as a bit](https://github.com/spezifisch/ifstat-rs)
  - Linux, Windows, macOS

## Linux
- `netstat -s`

  <details>

  ```sh
  Ip:
      Forwarding: 2
      322929 total packets received
      6 with invalid addresses
      0 forwarded
      0 incoming packets discarded
      322923 incoming packets delivered
      179312 requests sent out
      6 outgoing packets dropped
      1 dropped because of missing route
  Icmp:
      17753 ICMP messages received
      16 input ICMP message failed
      ICMP input histogram:
          destination unreachable: 33
          echo requests: 17720
      18699 ICMP messages sent
      0 ICMP messages failed
      OutRateLimitHost: 64654
      ICMP output histogram:
          destination unreachable: 979
          echo replies: 17720
  IcmpMsg:
          InType3: 33
          InType8: 17720
          OutType0: 17720
          OutType3: 979
  Tcp:
      4852 active connection openings
      764 passive connection openings
      10171 failed connection attempts
      67 connection resets received
      1 connections established
      218419 segments received
      154430 segments sent out
      395 segments retransmitted
      20 bad segments received
      45498 resets sent
      InCsumErrors: 20
  Udp:
      21115 packets received
      65633 packets to unknown port received
      0 packet receive errors
      20357 packets sent
      0 receive buffer errors
      0 send buffer errors
  UdpLite:
  TcpExt:
      10170 resets received for embryonic SYN_RECV sockets
      4920 TCP sockets finished time wait in fast timer
      369 delayed acks sent
      Quick ack mode was activated 4431 times
      14017 packet headers predicted
      13319 acknowledgments not containing data payload received
      11930 predicted acknowledgments
      TCPSackRecovery: 8
      Detected reordering 43 times using SACK
      Detected reordering 7 times using reno fast retransmit
      18 congestion windows recovered without slow start after partial ack
      TCPLostRetransmit: 83
      TCPSackFailures: 1
      31 timeouts in loss state
      24 fast retransmits
      26 retransmits in slow start
      TCPTimeouts: 321
      TCPLossProbes: 62
      TCPLossProbeRecovery: 9
      TCPSackRecoveryFail: 4
      TCPBacklogCoalesce: 578
      TCPDSACKOldSent: 4564
      TCPDSACKOfoSent: 2
      TCPDSACKRecv: 27
      TCPDSACKOfoRecv: 2
      59 connections reset due to unexpected data
      25 connections reset due to early user close
      2 connections aborted due to timeout
      TCPDSACKIgnoredNoUndo: 21
      TCPSackMerged: 2
      TCPSackShiftFallback: 98
      TCPRcvCoalesce: 36423
      TCPOFOQueue: 5986
      TCPOFOMerge: 25
      TCPChallengeACK: 5
      TCPAutoCorking: 471
      TCPFromZeroWindowAdv: 27
      TCPToZeroWindowAdv: 27
      TCPWantZeroWindowAdv: 2164
      TCPSynRetrans: 173
      TCPOrigDataSent: 51264
      TCPACKSkippedSeq: 3
      TCPDelivered: 56031
      TCPAckCompressed: 4195
      TcpTimeoutRehash: 113
      TcpDuplicateDataRehash: 4220
      TCPDSACKRecvSegs: 25
      TCPDSACKIgnoredDubious: 4
  IpExt:
      InMcastPkts: 6
      OutMcastPkts: 10
      InOctets: 244579904
      OutOctets: 41937996
      InMcastOctets: 396
      OutMcastOctets: 556
      InNoECTPkts: 405186
  MPTcpExt:
  ```
  </details>

- ifconfig
  - `ifconfig eth0`

- iftop

- ifstat

  [ifstat(1): Report InterFace STATistics - Linux man page](https://linux.die.net/man/1/ifstat)

- iptables

  [linux - Limit monthly traffic per interface - Server Fault](https://serverfault.com/questions/582711/limit-monthly-traffic-per-interface)

- [nethogs: Linux 'net top' tool](https://github.com/raboof/nethogs)
  - Processes

[linux - Monitor network traffic volume over interface - Server Fault](https://serverfault.com/questions/336854/monitor-network-traffic-volume-over-interface)

[如何查看Linux系统网络流量负载情况？ - 云服务器 ECS - 阿里云](https://www.alibabacloud.com/help/zh/ecs/support/query-and-case-analysis-of-linux-network-traffic-load)

[raboof/nethogs links](https://github.com/raboof/nethogs#links)

### Period
- [vnStat: a network traffic monitor for Linux and BSD](https://github.com/vergoh/vnstat) ([Wikipedia](https://en.wikipedia.org/wiki/VnStat))
  - `apt -y install vnstat`
  - Period: `-5`, `-h`/`-hg`, `-d`, `-m`, `-y`
    - `Not enough data available yet`
  - Top: `-t`
  - Format: `--oneline`, `--json`, `--xml`
    - `--oneline`: [vnstat\_parse - Rust](https://docs.rs/vnstat_parse/latest/vnstat_parse/)
    - Period is specified like `--json m`, not `--json -m`
  - Live mode: `-l`
  - Alert: `--alert`
  - GUI
    - vnstati
    - [zdz/ServerStatus-Rust: ✨ Rust 版 ServerStatus 探针、威力加强版](https://github.com/zdz/ServerStatus-Rust)
    - [hulxv/vnstat-server: Serve your vnStat data and controlling in it easily by HTTP requests](https://github.com/Hulxv/vnstat-server)
      - [hulxv/vnstat-client: GUI Client for vnStat Network Monitor for Linux or GNU/Linux](https://github.com/hulxv/vnstat-client)
    - [kdkasad/vnstat-web: Graphical web interface for vnstat network traffic monitor](https://github.com/kdkasad/vnstat-web)

  [vnStat - ArchWiki](https://wiki.archlinux.org/title/VnStat), [\[OpenWrt Wiki\] Network Traffic Monitor with vnStat](https://openwrt.org/docs/guide-user/services/network_monitoring/vnstat)

- sar
- [collectl](https://collectl.sourceforge.net/)
- [Zabbix :: The Enterprise-Class Open Source Network Monitoring Solution](https://www.zabbix.com/)

[networking - How to track internet usage (upload & download) on Linux? - Super User](https://superuser.com/questions/615958/how-to-track-internet-usage-upload-download-on-linux)

[centos - Linux: How to measure daily/montly network traffic? - Server Fault](https://serverfault.com/questions/107393/linux-how-to-measure-daily-montly-network-traffic)

[networking - How to track the total network data in a month - Ask Ubuntu](https://askubuntu.com/questions/15836/how-to-track-the-total-network-data-in-a-month)

[debian - Measure traffic for an interface monthly - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/678077/measure-traffic-for-an-interface-monthly)

[networking - Linux daily, weekly and monthly network usage - Server Fault](https://serverfault.com/questions/363393/linux-daily-weekly-and-monthly-network-usage)

[Is there a tool which lets you explore historical network usage / bandwidth on a per-process basis, ideally via a web interface? Like iftop or nethogs but running constantly? : r/linuxadmin](https://www.reddit.com/r/linuxadmin/comments/uh45wl/is_there_a_tool_which_lets_you_explore_historical/)
