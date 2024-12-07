# Windows Subsystem for Linux (WSL)
## Bridge mode
`%USERPROFILE%\.wslconfig`:
```ini
[wsl2]
networkingMode=bridged
vmSwitch=My WSL Switch
```
See [NIC Bridge mode 🖧 · Issue #4150 · microsoft/WSL](https://github.com/microsoft/WSL/issues/4150#issuecomment-1018524753) for details.

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