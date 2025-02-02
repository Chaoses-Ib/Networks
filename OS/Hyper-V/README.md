# Hyper-V: Virtual Switch
[Hyper-V Virtual Switch | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v-virtual-switch/hyper-v-virtual-switch)

[Hyper-V: the different virtual switches - RDR-IT](https://rdr-it.com/en/hyper-v-the-different-virtual-switches/)
- External switch (桥接)
  - Share with host (L2 NAT (arpnat))

    [networking - Hyper-V Virtual Switch issue: Same IP on guest and host - Super User](https://superuser.com/questions/1137818/hyper-v-virtual-switch-issue-same-ip-on-guest-and-host)

    [networking - Hyper-V guest doesn't see the internet through external virtual switch - Server Fault](https://serverfault.com/questions/767204/hyper-v-guest-doesnt-see-the-internet-through-external-virtual-switch)

- Internal switch (NAT)
  
  No gateway by default.

  [Set up a NAT network | Microsoft Docs](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/setup-nat-network)
  - `NetAdapter`
  - `Get-NetIPAddress -InterfaceIndex <ifIndex>`
    
  	Default 172.21.208.1/20，WSL 172.22.48.1/20

- Private switch

No built-in DHCP server.
- [How to enable DHCP on Hyper-V switch | Microsoft Community Hub](https://techcommunity.microsoft.com/discussions/itopstalkforum/how-to-enable-dhcp-on-hyper-v-switch/3063153)
- [networking - Hyper-V - Default Switch & DHCP Server - Super User](https://superuser.com/questions/1594803/hyper-v-default-switch-dhcp-server)

[virtual machine - Ubuntu 16.04 VM on Windows 10 Hyper-V - No Network Connectivity - Super User](https://superuser.com/questions/1096918/ubuntu-16-04-vm-on-windows-10-hyper-v-no-network-connectivity)

[Create and configure a virtual switch with Hyper-V | Microsoft Learn](https://learn.microsoft.com/en-us/windows-server/virtualization/hyper-v/get-started/create-a-virtual-switch-for-hyper-v-virtual-machines?tabs=hyper-v-manager&pivots=windows-server)

[Create a Virtual Network | Microsoft Docs](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/connect-to-network)

## Default Switch
[Change Hyper-V (Default Switch) IP address range - Microsoft Q&A](https://docs.microsoft.com/en-us/answers/questions/48268/change-hyper-v-default-switch-ip-address-range.html)  
不可更改

What if no Default Switch?
