# Transmission Control Protocol
**Transmission Control Protocol (TCP)** provides reliable, ordered, and error-checked delivery of a stream of octets (bytes) between applications running on hosts communicating via an IP network.[^wiki]

## Services
- Connection-oriented service
- Reliable data transfer
- Congestion-control

## RFC documents
- [RFC 675](https://datatracker.ietf.org/doc/html/rfc675) – Specification of Internet Transmission Control Program, December 1974 Version
- **[RFC 793](https://datatracker.ietf.org/doc/html/rfc793)** – TCP v4
- [STD 7](https://tools.ietf.org/html/std7) – Transmission Control Protocol, Protocol specification
- [RFC 1122](https://datatracker.ietf.org/doc/html/rfc1122) – includes some error corrections for TCP
- [RFC 1323](https://datatracker.ietf.org/doc/html/rfc1323) – TCP Extensions for High Performance (Obsoleted by RFC 7323)
- [RFC 1379](https://datatracker.ietf.org/doc/html/rfc1379) – Extending TCP for Transactions—Concepts (Obsoleted by RFC 6247)
- [RFC 1948](https://datatracker.ietf.org/doc/html/rfc1948) – Defending Against Sequence Number Attacks
- [RFC 2018](https://datatracker.ietf.org/doc/html/rfc2018) – TCP Selective Acknowledgment Options
- [RFC 3168 - The Addition of Explicit Congestion Notification (ECN) to IP](https://datatracker.ietf.org/doc/html/rfc3168)
- [**RFC 2581** - TCP Congestion Control](https://datatracker.ietf.org/doc/html/rfc2581)
- [RFC 5681](https://datatracker.ietf.org/doc/html/rfc5681) – TCP Congestion Control
- [RFC 6247](https://datatracker.ietf.org/doc/html/rfc6247) – Moving the Undeployed TCP Extensions RFC 1072, RFC 1106, RFC 1110, RFC 1145, RFC 1146, RFC 1379, RFC 1644, and RFC 1693 to Historic Status
- [RFC 6298](https://datatracker.ietf.org/doc/html/rfc6298) – Computing TCP's Retransmission Timer
- [RFC 6824](https://datatracker.ietf.org/doc/html/rfc6824) – TCP Extensions for Multipath Operation with Multiple Addresses
- [RFC 7323](https://datatracker.ietf.org/doc/html/rfc7323) – TCP Extensions for High Performance
- [RFC 7413 - TCP Fast Open](https://datatracker.ietf.org/doc/html/rfc7413)
- [RFC 7414](https://datatracker.ietf.org/doc/html/rfc7414) – A Roadmap for TCP Specification Documents

## Segment structure
[^topdown]
```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|          Source Port          |       Destination Port        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                        Sequence Number                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Acknowledgment Number                      |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|  Data |Reserv-|C|E|U|A|P|R|S|F|                               |
| Offset|  ed   |W|C|R|C|S|S|Y|I|            Window             |
|       |       |R|E|G|K|H|T|N|N|                               |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|           Checksum            |         Urgent Pointer        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Options                    |    Padding    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                             data                              |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```

### Flag field
- RST, SYN, FIN: used for connection setup and teardown
- PSH: the receiver should pass the data to the upper layer immediately
- ACK: the value carried in the acknowledgment field is valid
- URG: there is data in this segment that the sending-side upper-layer entity has marked as “urgent”
  The location of the *last byte* of this urgent data is indicated by the urgent pointer.
- CWR, ECE: used in explicit congestion notification

### Sequence numbers and acknowledgment numbers
The **sequence number** for a segment is the byte-stream number of the first byte in the segment.

Both sides of a TCP connection randomly choose an initial sequence number. This is done to minimize the possibility that a segment that is still present in the network from an earlier, already-terminated connection between two hosts is mistaken for a valid segment in a later connection between these same two hosts (which also happen to be using the same port numbers as the old connection).

The **acknowledgment number** that Host A puts in its segment is the sequence number of the next byte Host A is expecting from Host B.

### Maximum segment size
$$\text{TCP header} + \text{Maximum Segment Size (MSS)} \le \text{Maximum Transmission Unit (MTU)}$$

The length of the TCP header is typically 40 bytes, and both Ethernet and PPP link-layer protocols have an MTU of 1500 bytes, thus a typical value of MSS is 1460 bytes.

## Timeout interval
超时间隔必须大于 RTT，否则会出现不必要的重传，但也不应该大得太多，否则传输延迟会增大。

为了估计 RTT，TCP 会维持一个 SampleRTT 的均值 EstimatedRTT：
$$\text{EstimatedRTT}=(1-\alpha)\cdot\text{EstimatedRTT}+\alpha\cdot\text{SampleRTT}$$
即 exponential weighted moving average（EWMA，指数加权移动平均），其中 $\alpha$ 的推荐值为 $0.125$。

DevRTT 用于估算 SampleRTT 一般会偏离 EstimatedRTT 的程度：
$$\text{DevRTT}=(1-\beta)\cdot\text{DevRTT}+\beta\cdot|\text{SampleRTT}-\text{EstimatedRTT}|$$
$\beta$ 的推荐值为 $0.25$。

超时间隔 TimeoutInterval：
$$\text{TimeoutInterval}=\text{EstimatedRTT}+4\cdot\text{DevRTT}$$
推荐的初始值为 1 秒。当出现超时时 TimeoutInterval 会被加倍，直到收到 segment 并更新 EstimatedRTT。

## RDT
[^topdown]
```c
/* Assume sender is not constrained by TCP ﬂow or congestion control, that data from above is less than MSS in size, and that data transfer is in one direction only. */

NextSeqNum=InitialSeqNumber
SendBase=InitialSeqNumber

loop (forever) {
    switch(event)
        event: data received from application above
            create TCP segment with sequence number NextSeqNum
            if (timer currently not running)
                start timer
            pass segment to IP
            NextSeqNum=NextSeqNum+length(data)
            break;

        event: timer timeout
            retransmit not-yet-acknowledged segment with
                smallest sequence number
            start timer
            break;

        event: ACK received, with ACK ﬁeld value of y
            if (y > SendBase) {
                SendBase=y
                if (there are currently any not-yet-acknowledged segments)
                    start timer
            }
            else {/* a duplicate ACK for already ACKed segment */
                increment number of duplicate ACKs
                    received for y
                if (number of duplicate ACKS received for y==3)
                   /* TCP fast retransmit */
                   resend segment with sequence number y
            }
            break;

} /* end of loop forever */
```
- 超时时只重传一个 segment。
  
  TCP 既不是 GBN，也不是 SR。
- 超时时间隔加倍，提供了一定程度的拥塞控制。
- 收到 3 个冗余 ACK 时进行快速重传。

## Flow Control
![|400](images/ReceiveWindow.png)[^topdown]

发送方会维护一个 receive window：
$$\text{rwnd}=\text{RcvBuffer}-(\text{LastByteRcvd}-\text{LastByteRead})$$

通过将未确认的数据量控制在 rwnd 以内，就可以保证接收方的缓存不会溢出：
$$\text{LastByteSent}-\text{LastByteAcked}\le\text{rwnd}$$

## Connection management
![](images/Connection_States.png)

三次握手与四次挥手

建立连接：
1. 客户端发送 SYN
  
   使用随机序列号 client_isn
2. 服务端分配 TCP 缓存和变量，发送 SYN-ACK
  
   使用随机序列号 server_isn

   确认号为 client_isn + 1

   （如果服务端不接受连接会发送 RST）
3. 客户端发送 ACK
  
   序列号为 client_isn + 1

   确认号为 server_isn + 1

关闭连接：
1. 一方发送 FIN，收到 ACK
2. 另一方之后也发送 FIN，收到 ACK

另一方可能同时会将 ACK 和 FIN 合并到一起发送。

## 粘包
> TCP 是基于字节流的协议
> 你发两次数据，比如 {1, 2} 和 {3, 4}
> 客户端一定会收到 1, 2, 3, 4
> 但是可能是 {1, 2}{3, 4}，可能是 {1}{2, 3, 4}，可能是 {1, 2, 3, 4}
> 分包就是为了防止粘到一起 或者被割开

[怎么解决TCP网络传输「粘包」问题？ - 知乎](https://www.zhihu.com/question/20210025)


[^wiki]: [Transmission Control Protocol - Wikipedia](https://en.wikipedia.org/wiki/Transmission_Control_Protocol)
[^topdown]: Computer Networking：A Top-Down Approach