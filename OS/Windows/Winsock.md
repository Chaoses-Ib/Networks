# Windows Sockets (Winsock)
[Windows Sockets 2 - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/winsock/windows-sockets-start-page-2)

![](images/Winsock/image.png)[^winter]

## AFD.SYS
[Recon2015-20 Steven Vittitoe Reverse Engineering Windows AFD.sys](https://recon.cx/2015/slides/recon2015-20-steven-vittitoe-Reverse-Engineering-Windows-AFD-sys.pdf)

- CVE-2014-1767 (MS14-040)
  
  [windows-kernel-exploits/MS14-040](https://github.com/SecWiki/windows-kernel-exploits/blob/master/MS14-040/README.md)

  [\[原创\] 凑个热闹： CVE-2014-1767 分析报告](https://github.com/CrackerCat/simpread/blob/e51f798a516c348f5abfeda1e197780275f66edd/md/%5B%E5%8E%9F%E5%88%9B%5D%20%E5%87%91%E4%B8%AA%E7%83%AD%E9%97%B9%EF%BC%9A%20CVE-2014-1767%20%E5%88%86%E6%9E%90%E6%8A%A5%E5%91%8A.md)

- CVE-2023-21768

  [Patch Tuesday -> Exploit Wednesday: Pwning Windows Ancillary Function Driver for WinSock (afd.sys) in 24 Hours](https://securityintelligence.com/x-force/patch-tuesday-exploit-wednesday-pwning-windows-ancillary-function-driver-winsock/)

  [Ha0-Y/CVE-2023-21768](https://github.com/Ha0-Y/CVE-2023-21768/blob/cb62f87ceb3bc19ebb426e0863fb5ded2bb22f8a/CVE-2023-21768.md)

## Winsock Kernel (WSK)
[Introduction to Winsock Kernel - Windows drivers | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/drivers/network/introduction-to-winsock-kernel)

- [MiroKaku/libwsk: The Kernel-Mode Winsock library, supporting TCP, UDP and Unix sockets (DGRAM and STREAM).](https://github.com/MiroKaku/libwsk)
- [wbenny/KSOCKET: KSOCKET provides a very basic example how to make a network connections in the Windows Driver by using WSK](https://github.com/wbenny/KSOCKET) (discontinued)
  - [mingw-w64-ksocket: Windows Kernel <-> User mode socket communication made for "Mingw64 Driver Plus Plus".](https://github.com/utoni/mingw-w64-ksocket)

## Ntdll.dll
[x86matthew - NTSockets - Downloading a file via HTTP using the NtCreateFile and NtDeviceIoControlFile syscalls](https://www.x86matthew.com/view_post?id=ntsockets)

- [NtSocket\_NtClient\_NtServer: Using NtCreateFile and NtDeviceIoControlFile to realize the function of winsock（利用NtCreateFile和NtDeviceIoControlFile 实现winsock的功能）](https://github.com/A-Normal-User/NtSocket_NtClient_NtServer)
- [R41N3RZUF477/NtSock](https://github.com/R41N3RZUF477/NtSock)

## Ws2_32.dll
[wine/dlls/ws2\_32/socket.c at master - wine-mirror/wine](https://github.com/wine-mirror/wine/blob/master/dlls/ws2_32/socket.c)


[^winter]: Windows Internals v6