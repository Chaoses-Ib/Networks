# Network Interface Controllers
[Wikipedia](https://en.wikipedia.org/wiki/Network_interface_controller)

Network interface controller (NIC), network interface card, network adapter, LAN adapter, physical network interface

[What does network interface do? and what's difference between a network interface and a network interface card (NIC)? - Network Engineering Stack Exchange](https://networkengineering.stackexchange.com/questions/73888/what-does-network-interface-do-and-whats-difference-between-a-network-interfac)
> "NIC" used to be short for *network interface card* when this function required an add-on card. When it evolved to an on-board commodity, it became *network interface controller*. Technically, there's no difference beyond the form factor. Strictly speaking, *network interface* may also refer to a port with less (or more) functionality than a NIC, e.g. a switch port or sometimes even a print server option card for a printer or a serial server.

[Solved: Difference between interface and controller interface ? - Cisco Community](https://community.cisco.com/t5/switching/difference-between-interface-and-controller-interface/td-p/2931591)
> Certain interface types have several modes of operation that need to be configured before the interface becomes operable. These modes are configured for the entire interface hardware - that is the interface **controller** \- and they in turn determine how the individual **interfaces** driven by this controller operate. For example, an ISDN PRI controller can be configured either for US T-carrier or European E-carrier operation, and based on that, it provides you with either 23 or 30 resulting Serial interfaces, one for each B-channel. Without configuring the **controller**, the Serial **interfaces** would not even be available, because their count depends on what mode (T-carrier or E-carrier) is the controller working in.
>
> This is the basic logic: The controller represents the hardware of the interface module whose configuration affects all interfaces on the module. Configuring the controller is typical for ISDN or selected DSL interface modules. Ethernet interfaces or plain Serial interfaces do not have similar configurable properties, and so there is no controller configuration available for them.
