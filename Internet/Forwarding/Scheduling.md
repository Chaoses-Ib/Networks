# Packet Scheduling
[Wikipedia](https://en.wikipedia.org/wiki/Network_scheduler)

Packet scheduling, packet scheduler, network scheduler, queueing discipline (qdisc), queueing algorithm

[6.2 Queuing Disciplines --- Computer Networks: A Systems Approach Version 6.2-dev documentation](https://book.systemsapproach.org/congestion/queuing.html)

## Bufferbloat
> Bufferbloat is a phenomenon in packet-switched networks in which excess buffering of packets causes high latency and packet delay variation. Bufferbloat can be addressed by a network scheduler that strategically discards packets to avoid an unnecessarily high buffering backlog. Examples include CoDel, FQ-CoDel and random early detection.

[Bufferbloat.net](https://www.bufferbloat.net/projects/)

[Unbloating the buffers | Dan Groshev](https://dgroshev.com/blog/bufferbloat/) ([Hacker News](https://news.ycombinator.com/item?id=39101564))

[Fixing bufferbloat on your home network with OpenBSD 6.2 or newer - Paul Smith](https://www.pauladamsmith.com/blog/2018/07/fixing-bufferbloat-on-your-home-network-with-openbsd-6.2-or-newer.html) ([Hacker News](https://news.ycombinator.com/item?id=17453854))

## Fair queuing
[Wikipedia](https://en.wikipedia.org/wiki/Fair_queuing)

```sh
cat /proc/sys/net/core/default_qdisc
echo "fq" > /proc/sys/net/core/default_qdisc
```

[Please change default qdisc from `fq_codel` to `fq` - Issue #5090 - systemd/systemd](https://github.com/systemd/systemd/issues/5090)
- [Change default default qdisc from `fq_codel` to `sch_fq` - Issue #9725 - systemd/systemd](https://github.com/systemd/systemd/issues/9725#issuecomment-413369212)

[BBR and FQ As new Defaults - Feature requests - VyOS Forums](https://forum.vyos.io/t/bbr-and-fq-as-new-defaults/12344)
> “sch_fq is for TCP servers, fq_codel for routers” - Eric Dumazet (who is the author of both).

> With the 6.1 release of Linux, a new feature for sch_fq entered that is really important and beneficial to those running containerized services such as k8. For the first time, back pressure exists in Linux across containers, so sch_fq + TCP facing inwards, or outwards across the containers works really, really well, especially with BBR. WIN!

[tcp: switch to Early Departure Time model \[LWN.net\]](https://lwn.net/Articles/766564/)
> Also note that when FQ is not used and TCP wants pacing, the
internal pacing fallback has very different behavior, since TCP
emits packets at the time they should be sent (with unreasonable
assumptions about scheduling costs)

Not available in WSL2 by default.

## Linux
`sysctl net.core.default_qdisc`

> As the default queuing discipline, the packet scheduler uses a FIFO implementation called `pfifo_fast`, although systemd since its version 217 changes the default queuing discipline to `fq_codel`.
