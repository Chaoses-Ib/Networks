# Virtual Switch
%%t220226%%

[Hyper-V: the different virtual switches - RDR-IT](https://rdr-it.com/en/hyper-v-the-different-virtual-switches/)
- External switch
  
	桥接
- Internal switch
  
	NAT
- Private switch

[Set up a NAT network | Microsoft Docs](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/user-guide/setup-nat-network)
- `NetAdapter`
- `Get-NetIPAddress -InterfaceIndex <ifIndex>`
  
	Default 172.21.208.1/20，WSL 172.22.48.1/20

[Create a Virtual Network | Microsoft Docs](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/connect-to-network)

## Default Switch
[Change Hyper-V (Default Switch) IP address range - Microsoft Q&A](https://docs.microsoft.com/en-us/answers/questions/48268/change-hyper-v-default-switch-ip-address-range.html)  
不可更改