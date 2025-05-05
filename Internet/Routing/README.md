# Routing
## Asymmetric routing
[BGP and asymmetric routing | Noction](https://www.noction.com/blog/bgp-and-asymmetric-routing)

> Using a combination of experiments on real networks and simulation, we analyze TCP performance in such networks where the throughput achieved is not solely a function of the link and traftic characteristics in the direction of data transfer (theforward direction), but depends significantly on the reverse direction as well. We focus on bandwidth and latency asymmetries, and propose and evaluate several schemes to improve end-to-end performance in these cases. These include techniques to decrease the rate of acknowledgments on the constrained reverse channel (ack congestion control and ackjiltering), techniques to reduce source burstiness when acknowledgments are infrequent (TCP sender adaptation), and algorithms at the reverse bottleneck router to schedule data and acks differently from FIFO.[^balakrishnanEffectsAsymmetryTCP1997]

- Will BBR and Brutal congestion control help with asymmetric routing?

- Will TCP affect the reverse routing path (compared to UDP and ICMP)? Or, is it possbile for TCP and UDP to use different routing paths?

  [Can the path of traffic vary depending on the type of protocol? : r/networking](https://www.reddit.com/r/networking/comments/t4zecx/can_the_path_of_traffic_vary_depending_on_the/)

  [TCP vs UDP routing handled differently? - MikroTik](https://forum.mikrotik.com/viewtopic.php?t=144892)

[networking - Is it possible to force TCP to find another path to the host? - Super User](https://superuser.com/questions/1760194/is-it-possible-to-force-tcp-to-find-another-path-to-the-host)

[Asymmetrical Routing through stateful firewall devices : r/networking](https://www.reddit.com/r/networking/comments/1bmv5jw/asymmetrical_routing_through_stateful_firewall/)

## Traceroute
> Previous works have extensively investigated pitfalls and flaws causing the measurements performed with this tool to be inaccurate or incomplete. In this paper, we show how, even in the absence of all these well-investigated pitfalls and flaws, our ability to properly troubleshoot the network with Traceroute is strongly limited. Indeed, by using stateof-the-art alias resolution techniques, we investigate how and how much the IP-level description provided by Traceroute can distort our understanding of the characteristics of Internet paths. We experimentally evaluate the impact on path properties like equal-cost multipaths, loops, routing cycles, load balancing, route prevalence and persistence. Our results confirm that researchers and network operators relying on Traceroute may poorly estimate (i) the number of multiple equal-cost routes to the destination; (ii) the presence of suboptimal routing in the network; (iii) the routing stability.[^marchettaHowHowMuch2016]

- traceroute ([Wikipedia](https://en.wikipedia.org/wiki/Traceroute))
  - UDP, ICMP
- mtr ([Wikipedia](https://en.wikipedia.org/wiki/MTR_(software)))
- Windows tracert
  - ICMP
- [trippy: A network diagnostic tool](https://github.com/fujiapple852/trippy) (`trip`)
  - [Features](https://trippy.rs/start/features/)
    - ICMP, UDP (`-p udp -S 443`), TCP (`-p tcp -P 443`)
    - Packet size & payload pattern
    - NAT detection
  - Installation
    - `scoop install trippy`
    - Debian 13+: `apt install trippy`
    - [Downloads](https://trippy.rs/start/installation/#downloads)
  - [Usage Examples](https://trippy.rs/guides/usage/)
- [BestTrace](https://www.ipip.net/product/client.html)
  - Map

TCP:
- ~~[tcptraceroute](https://web.archive.org/web/20130424094134/http://michael.toren.net/code/tcptraceroute/)~~

  [mct/tcptraceroute: A traceroute implementation using TCP packets](https://github.com/mct/tcptraceroute)
- [simulatedsimian/tracetcp: tracetcp. Traceroute utility that uses tcp syn packets to trace network routes.](https://github.com/SimulatedSimian/tracetcp)
  ```pwsh
  scoop bucket add aoisummer_scoop-bucket https://github.com/aoisummer/scoop-bucket
  scoop install aoisummer_scoop-bucket/tracetcp
  ```
- [tcproute.exe - tcp based traceroute for windows](https://www.elifulkerson.com/projects/tcproute.php)

Online:
- [traceroute.org](http://www.traceroute.org/)
- [ITDOG](https://www.itdog.cn/traceroute/)

[TCP Traceroute : r/linux](https://www.reddit.com/r/linux/comments/195g57/tcp_traceroute/)

### Reverse traceroute
- ~~[Reverse Traceroute](https://web.archive.org/web/20111021143920/http://revtr.cs.washington.edu/)~~[^katz-bassettReverseTraceroute2010]
- [Reverse Traceroute](https://revtr.ccs.neu.edu/)
- [HSAnet/reverse-traceroute: An implementation of reverse traceroute](https://github.com/HSAnet/reverse-traceroute)


[^katz-bassettReverseTraceroute2010]: Katz-Bassett, E., Madhyastha, H. V., Adhikari, V. K., Scott, C., Sherry, J., Van Wesep, P., Anderson, T. E., & Krishnamurthy, A. (2010). Reverse traceroute. NSDI, 10, 219–234. https://www.usenix.org/legacy/event/nsdi10/tech/full_papers/katz-bassett.pdf
[^balakrishnanEffectsAsymmetryTCP1997]: Balakrishnan, H., Padmanabhan, V. N., & Katz, R. H. (1997). The effects of asymmetry on TCP performance. Proceedings of the 3rd Annual ACM/IEEE International Conference on Mobile Computing and Networking  - MobiCom ’97, 77–89. https://doi.org/10.1145/262116.262134
[^marchettaHowHowMuch2016]: Marchetta, P., Montieri, A., Persico, V., Pescapé, A., Cunha, Í., & Katz-Bassett, E. (2016). How and how much traceroute confuses our understanding of network paths. 2016 IEEE International Symposium on Local and Metropolitan Area Networks (LANMAN), 1–7. https://doi.org/10.1109/LANMAN.2016.7548847
