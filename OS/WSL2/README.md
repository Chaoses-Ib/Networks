# Windows Subsystem for Linux 2 (WSL2)
[Accessing network applications with WSL | Microsoft Learn](https://learn.microsoft.com/en-us/windows/wsl/networking)

```sh
wslinfo --networking-mode
```

## NAT mode
```pwsh
netsh interface portproxy add v4tov4 listenport=<yourPortToForward> listenaddress=0.0.0.0 connectport=<yourPortToConnectToInWSL> connectaddress=(wsl hostname -I)
```
- TCP only
- `connectaddress=(wsl hostname -I)` doesn't work on Windows 21H2 (20348.2700) + WSL v2.3.26.0, but `connectaddress=127.0.0.1` works (when the ports are different)?

[Connecting to WSL2 server via local network - Stack Overflow](https://stackoverflow.com/questions/61002681/connecting-to-wsl2-server-via-local-network)

[Port forwarding repeated failure on WSL 1.1.3 - Issue #9751 - microsoft/WSL](https://github.com/microsoft/WSL/issues/9751)

[network programming - WSL-2: Which ports are automatically forwarded? - Stack Overflow](https://stackoverflow.com/questions/64513964/wsl-2-which-ports-are-automatically-forwarded)

[After Windows Update 24H2 WSL cannot access the internet - Issue #12353 - microsoft/WSL](https://github.com/microsoft/WSL/issues/12353)

## Mirrored mode
> On machines running Windows 11 22H2 and higher you can [set `networkingMode=mirrored` under `[wsl2]` in the `.wslconfig` file](https://learn.microsoft.com/en-us/windows/wsl/wsl-config#configuration-settings-for-wslconfig) to enable mirrored mode networking. Enabling this changes WSL to an entirely new networking architecture which has the goal of 'mirroring' the network interfaces that you have on Windows into Linux, to add new networking features and improve compatibility.

Here are the current benefits to enabling this mode:
- IPv6 support
- Connect to Windows servers from within Linux using the localhost address `127.0.0.1`. IPv6 localhost address `::1` is not supported
- Improved networking compatibility for VPNs
- Multicast support
- Connect to WSL directly from your local area network (LAN)

[Win11 WSL2, How to verify `networkingMode=mirrored` is effective? - Super User](https://superuser.com/questions/1848010/win11-wsl2-how-to-verify-networkingmode-mirrored-is-effective)

Available in Windows 21H2 WSL Settings, but not actually working?

Doesn't support Windows Server: [Cannot enable Mirrored network on WSL - Issue #11154 - microsoft/WSL](https://github.com/microsoft/WSL/issues/11154)
```
wsl: 指定的请求不受支持。
错误代码: CreateInstance/CreateVm/ConfigureNetworking/0x803b0015
wsl: 无法配置 networkingMode Mirrored) (网络，回退到 networkingMode None。
```
- ~v2.3.26~v2.4.10
- [Error code: CreateInstance/CreateVm/ConfigureNetworking/0x8007054f - Issue #12351 - microsoft/WSL](https://github.com/microsoft/WSL/issues/12351)

## Bridge mode
`%USERPROFILE%\.wslconfig`:
```ini
[wsl2]
networkingMode=bridged
vmSwitch=My WSL Switch
```
See [NIC Bridge mode 🖧 · Issue #4150 · microsoft/WSL](https://github.com/microsoft/WSL/issues/4150#issuecomment-1018524753) for details.

## VirtioProxy mode
[networkingMode: mirrored not working but virtioproxy does. - Issue #10717 - microsoft/WSL](https://github.com/microsoft/WSL/issues/10717)

[After Windows Update 24H2 WSL cannot access the internet - Issue #12353 - microsoft/WSL](https://github.com/microsoft/WSL/issues/12353)
> Using *WSL Settings* and changing network mode from NAT to VirtioProxy enables http from within WSL (e.g. `wget google.com` works) but ping is still blocked.

## Network is unreachable
Symptoms:
```sh
$ ping 8.8.8.8
ping: connect: Network is unreachable
```
```sh
$ ip addr
...
6: eth0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc mq state DOWN group default qlen 1000
    link/ether 5c:bb:f6:9e:ee:f0 brd ff:ff:ff:ff:ff:ff
```

Possible reasons:
- You are using [bridge mode](#bridge-mode) and the virtual switch was broken however
  
  Bridging to VMware's VMnet and then updating VMware may cause this problem. The broken switch will be displayed as an internal switch in the Virtual Switch Manager.

  The solution is to fix the virtual switch to an external one.
- [WSL2 network unreachable - Stack Overflow](https://stackoverflow.com/questions/66338549/wsl2-network-unreachable)