#import "@local/ib:0.1.0": *
#title[0-RTT TCP Convert Protocol]
#a[RFC 8803 - 0-RTT TCP Convert Protocol][https://datatracker.ietf.org/doc/html/rfc8803]

= Differences with SOCKSv5
- #q[
  A first difference is that the 0-RTT TCP Convert Protocol exchanges all the control information during the initial RTT.
  This reduces the connection establishment delay compared to SOCKS, which requires two or more round-trip times before the establishment of the downstream connection towards the final destination.
  ]

  #q[A recently proposed extension to SOCKS leverages the TCP Fast Open (TFO) option [INTAREA-SOCKS] to reduce this delay.]

- #q[
  A second difference is that the Convert Protocol explicitly takes the TCP extensions into account.
  By using the Convert Protocol, the Client can learn whether a given TCP extension is supported by the destination Server.
  This enables the Client to bypass the Transport Converter when the Server supports the required TCP extension(s).
  Neither SOCKSv5 [RFC1928] nor the proposed SOCKSv6 [INTAREA-SOCKS] provide such a feature.
  ]

- #q[
  A third difference is that a Transport Converter will only confirm the establishment of the connection initiated by the Client provided that the downstream connection has already been accepted by the Server.
  If the Server refuses the connection establishment attempt from the Transport Converter, then the upstream connection from the Client is rejected as well.
  This feature is important for applications that check the availability of a Server or use the time to connect as a hint on the selection of a Server [RFC8305].
  ]

- #q[
  A fourth difference is that the 0-RTT TCP Convert Protocol only allows the Client to specify the IP address/port number of the destination Server and not a DNS name.
  We evaluated an alternate design that included the DNS name of the remote peer instead of its IP address as in SOCKS [RFC1928].
  However, that design was not adopted because it induces both an extra load and increased delays on the Transport Converter to handle and manage DNS resolution requests.
  Note that the name resolution at the Converter may fail (e.g., private names discussed in Section 2.1 of [RFC6731]) or may not match the one that would be returned by a Client's resolution library (e.g., Section 2.2 of [RFC6731]).
  ]

= Libraries
C++:
- #a[LENSS/5G-Transport-Converter: Source code for 5G MPTCP Transport Converter][https://github.com/LENSS/5G-Transport-Converter]

= Applications
- #q[has been standardized by 3GPP to be the driving transport protocol underlying ATSSS.]

#a[Code search results: ```js /\bRFC\b/ /\b8803\b/```][https://github.com/search?q=%2F%5CbRFC%5Cb%2F%20%2F%5Cb8803%5Cb%2F%20&ref=opensearch&type=code]
