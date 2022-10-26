# Dynamic Host Configuration Protocol
- DHCP server discovery
  
  This host on this network (0.0.0.0) → Limited broadcast address (255.255.255.255) on port 67
- DHCP server offer
- DHCP request
- DHCP ACK

DHCP 的缺陷是，主机在网络间移动时 IP 地址会改变，无法保持 TCP 连接。

- DHCP 为什么要使用 UDP，只用链路层或者网络层不就够了吗？
  
  首先不能用 TCP，因为 TCP 不能广播。

  上升到网络层的好处是可以跨广播域（DHCP relay），而之所以要用 UDP，可能只是因为不容易申请到 IP 协议号。[^udp-zhihu]

[^udp-zhihu]: [为什么DHCP不用链路层帧要用udp包? - 知乎](https://www.zhihu.com/question/504242193)