# IPv4
**Internet Protocol version 4 (IPv4)** is the fourth version of the Internet Protocol (IP). It is one of the core protocols of standards-based internetworking methods in the Internet and other packet-switched networks.[^wiki]

[^wiki]: [IPv4 - Wikipedia](https://en.wikipedia.org/wiki/IPv4)

## RFC
- [RFC 791 - Internet Protocol](https://datatracker.ietf.org/doc/html/rfc791)

## Datagram format
[^topdown]
```
 0                   1                   2                   3
 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|Version|  IHL  |Type of Service|          Total Length         |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|         Identification        |Flags|      Fragment Offset    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|  Time to Live |    Protocol   |         Header Checksum       |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                       Source Address                          |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Destination Address                        |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
|                    Options                    |    Padding    |
+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
```
- Version: 4
- Internet Header Length: $[5,15]$ (measured in units of 32-bit words)
- Type of Service
  ```
      0     1     2     3     4     5     6     7
  +-----+-----+-----+-----+-----+-----+-----+-----+
  |                 |     |     |     |     |     |
  |   PRECEDENCE    |  D  |  T  |  R  |  0  |  0  |
  |                 |     |     |     |     |     |
  +-----+-----+-----+-----+-----+-----+-----+-----+
  ```
  Precedence, Low Delay, High Throughput, High Relibility
- Total Length: $[20,65535]$
- Fragmentation
  - Identification: Assigned by the sender to aid in assembling the fragments of a datagram.
  - Flags
    ```
      0   1   2
    +---+---+---+
    |   | D | M |
    | 0 | F | F |
    +---+---+---+
    ```
    Don't Fragment, More Fragments
  - Fragment Offset: Where in the datagram this fragment belongs, measured in units of 8 octets (64 bits).
- Time to Live  
  Measured in units of seconds, but every module that processes a datagram must decrease the TTL by at least one.
- Protocol: [List of IP protocol numbers](https://en.wikipedia.org/wiki/List_of_IP_protocol_numbers)

  远不止 TCP 和 UDP。
- Header Checksum
  
  Note that the checksum must be recomputed and stored again at each router, since the TTL field, and possibly the options field as well, will change.
- Source Address, Destination Address
- Options

[^topdown]: Computer Networking：A Top-Down Approach