# NetBIOS Name Service (NBNS)
[Wikipedia](https://en.wikipedia.org/wiki/NetBIOS#Name_service)

- UDP port 137

[\[MS-ADTS\]: NetBIOS-Based Discovery | Microsoft Learn](https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/bbd104fb-7d78-44d5-9e50-48ea120a0d91)

> NetBIOS name resolution has been turned off by default on cellular interfaces for some time because it should never be applicable there. In the latest Windows Dev and Beta Insider builds, it has been placed in “learning mode” where NetBIOS is only used as a fallback after mDNS and LLMNR queries fail. This means devices will typically stop using NetBIOS name resolution unless it is manually re-enabled because mDNS will most frequently answer first.

[I never really understood NetBIOS. : r/ccna](https://www.reddit.com/r/ccna/comments/15z7c16/i_never_really_understood_netbios/)
