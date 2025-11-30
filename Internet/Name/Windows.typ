#import "@local/ib:0.1.0": *
#title[Windows]
#a[Domain Name System - Win32 apps | Microsoft Learn][https://learn.microsoft.com/en-us/windows/win32/dns/dns-start-page]

= `ws2_32.dll`
== GetXbyY
#quote(block: true)[
This module takes care of forwarding the "getxbyy" family of operations to
the correct getxbyy provider. The preferred getxbyy provider is found via
a DLL path stored in the registry. If this registry entry is found, an
attempt is made to load the DLL and retrieve entry points from it. Any
failures cause entry points to be taken from the `WSOCK32.DLL` instead. A
getxbyy provider does not have to export all of the getxbyy functions since
any it does not export are taken from `WSOCK32.DLL`.

The getxbyy functions handled by this module that can be replaced by a
getxyy provider are the following:

- `gethostbyaddr()`
- `gethostbyname()`
- `gethostname()`
- `getservbyname()`
- `getservbyport()`
- `WSAAsyncGetServByName()`
- `WSAAsyncGetServByPort()`
- `WSAAsyncGetProtoByName()`
- `WSAAsyncGetProtoByNumber()`
- `WSAAsyncGetHostByName()`
- `WSAAsyncGetHostByAddr()`
- `WSACancelAsyncRequest()`

The actual entry points supplied by the getxbyy provider (or the
`WSOCK32.DLL`) are prefixed with a special string. This prefix is defined by
the manifest constant `GETXBYYPREFIX`.
]

#a[Basic Approach for GetXbyY in the API - Win32 apps | Microsoft Learn][https://learn.microsoft.com/en-us/windows/win32/winsock/basic-approach-for-getxbyy-in-the-api-2]

== Address list sorting
Mainly for IPv6.

- `SIO_ADDRESS_LIST_SORT`

  #a[Using `SIO_ADDRESS_LIST_SORT` - Win32 apps | Microsoft Learn][https://learn.microsoft.com/en-us/windows/win32/winsock/using-sio-address-list-sort]

  XP SP1:
  ```rs
  SortIPAddrs() {
    WSAIoctl(SIO_ADDRESS_LIST_SORT) {
      SortIPv6Addrs() {
        DeviceIoControl(IOCTL_IPV6_SORT_DEST_ADDRS)
      }
    }
  }
  ```

- #a[`CreateSortedAddressPairs` function (netioapi.h) - Win32 apps | Microsoft Learn][https://learn.microsoft.com/en-us/windows/win32/api/netioapi/nf-netioapi-createsortedaddresspairs]

== APIs
- #a[`getaddrinfo`][https://learn.microsoft.com/en-us/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfo]
  - `WspiapiGetAddrInfo`

  XP SP1:
  ```rust
  getaddrinfo() {
    if WSAStringToAddress(NodeName, AF_INET6) {
      ...
    } else if ParseV4Address(NodeName) {

    } else {
      LookupNode(NodeName) {
        QueryDNS() {
          QueryDNSforA() {
            gethostbyname() {
              getxyDataEnt()
            }
          }
        }
        SortIPAddrs()
      }
    }
  }
  ```
- #a[`GetAddrInfoExW`][https://learn.microsoft.com/en-us/windows/win32/api/ws2tcpip/nf-ws2tcpip-getaddrinfoexw]

= `dnsapi.dll`
- #a[`DnsQuery_W`][https://learn.microsoft.com/en-us/windows/win32/api/windns/nf-windns-dnsquery_w]

  XP SP1:
  ```rust
  DnsQuery_W() {
    Query_InProcess() {
      Query_Main() {
        QueryHostFile()
        GetRecordsForLocalName()
        while GetNextQueryName() {
          Query_SingleName() {
            Dns_BuildPacket()
            Dns_SendAndRecv() {
              Dns_SendAndRecvUdp() {
                Dns_GetUdpSocket() {
                  Dns_CreateSocket() {
                    Dns_CreateSocketEx() {
                      WSASocket()
                    }
                  }
                }
              }
              Dns_SendAndRecvTcp()
              Dns_SendAndRecvMulticast()
            }
          }
        }
      }
    }
  }
  ```
  
- #a[`DnsQuery_A`][https://learn.microsoft.com/en-us/windows/win32/api/windns/nf-windns-dnsquery_a]

  #a[Windows-classic-samples/Samples/Win7Samples/netds/dns/dnsquery/DNSQuery.Cpp][https://github.com/microsoft/Windows-classic-samples/blob/main/Samples/Win7Samples/netds/dns/dnsquery/DNSQuery.Cpp]

- #a[`DnsQueryEx`][https://learn.microsoft.com/en-us/windows/win32/api/windns/nf-windns-dnsqueryex]

  XP SP1:
  ```rust
  DnsQueryEx() {
    CombinedQueryEx() {
      if pQueryInfo.hEvent {
        CreateThread(&ShimDnsQueryEx)
        ERROR_IO_PENDING
      } else {
        ShimDnsQueryEx() {
          DnsQuery_W()
        }
      }
    }
  }
  ```

  Rust: notgull/async-dns
- #a[`DnsQueryRaw`][https://learn.microsoft.com/en-us/windows/win32/api/windns/nf-windns-dnsqueryraw]

#a[c++ - How does one specify a specific DNS server to query using DnsQuery? - Stack Overflow][https://stackoverflow.com/questions/8931824/how-does-one-specify-a-specific-dns-server-to-query-using-dnsquery]

#a[Query DNS using specific DNS servers in .NET - Stack Overflow][https://stackoverflow.com/questions/1565055/query-dns-using-specific-dns-servers-in-net]
