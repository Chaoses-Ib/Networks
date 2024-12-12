# IPv6 Transition Mechanisms
[Wikipedia](https://en.wikipedia.org/wiki/IPv6_transition_mechanism)

[Interoperability between IPv6 and IPv4](https://web.archive.org/web/20190311062132/http://ntrg.cs.tcd.ie/undergrad/4ba2.02/ipv6/interop.html)

## Mismatch problem
Is listening on `localhost` listening on `127.0.0.1`, `::1` or both?

> Ideally, a server binding to "localhost" should create a listening socket for each of its IP addresses (e.g. `127.0.0.1` and `::1`), and a client connecting to "localhost" should try each IP address in order, until one succeeds.
> 
> But a lot of standard libraries (including parts of Java and Go) get this wrong, and pick exactly one IP address arbitrarily. When you combine a buggy client with a buggy server, and their preferences for IPv4/IPv6 disagree, then all hell breaks loose.

- `IPV6_V6ONLY`

  > `IPV6_V6ONLY` works when binding to `::` (all interfaces), but it's irrelevant when binding to `localhost`, because you can only bind one address per socket.

  - `/proc/sys/net/ipv6/bindv6only`

    > Default value for `IPV6_V6ONLY` socket option, which restricts use of the IPv6 socket to IPv6 communication only. TRUE: disable IPv4-mapped address feature FALSE: enable IPv4-mapped address feature
    > 
    > Default: FALSE (as specified in RFC3493)

  [linux - How do I disable IPv4-mapped IPv6? - Server Fault](https://serverfault.com/questions/408667/how-do-i-disable-ipv4-mapped-ipv6)

- Windows

  [localhost on Windows now uses ::1 instead of 127.0.0.1 : r/ipv6](https://www.reddit.com/r/ipv6/comments/fuaqf/localhost_on_windows_now_uses_1_instead_of_127001/)

- Java: `::1`

  `-Djava.net.preferIPv4Stack=true`

  [\[JDK-8170568\] Improve address selection for network clients - Java Bug System](https://bugs.openjdk.org/browse/JDK-8170568)

  [linux - How to support both IPv4 & IPv6 on Java - Stack Overflow](https://stackoverflow.com/questions/10378471/how-to-support-both-ipv4-ipv6-on-java)

  [android - Why does my service always bind to ipv6 localhost instead of ipv4? - Stack Overflow](https://stackoverflow.com/questions/8319399/why-does-my-service-always-bind-to-ipv6-localhost-instead-of-ipv4)

- Go: `127.0.0.1`
  
  [proposal: net/v2: Listen is unfriendly to multiple address families, endpoints and subflows - Issue #9334 - golang/go](https://github.com/golang/go/issues/9334)

- Chrome

  > The weirdest was a co-worker who had some simple webserver, which was listening on only IPv4 or IPv6 (but not both). When he went to "localhost" on Firefox it used IPv4 and he was able to see it. On Chrome "localhost" was IPv6 (or the other way around), and he got "Could not connect" error. It confused him no end how this simple web server worked on FF but not Chrome.

- Nginx

  > Had exactly this bug, sometimes nginx couldn't connect to the backend (but very rarely, and not reproducible on demand), which I eventually tracked to the fact that `localhost` sometimes resolved to `::1` instead of `127`, which is what the backend was listening on. Still don't understand why it was only like 1 in 1000 requests, and not every or every other request. Just one more slice of ipv6 mystery.

  > I had a very similar problem recently with docker + nginx. Best I could figure out was the randomness of the problem was being caused by keep alive connection limits. If the connection was opened as IPv4 it would work until it hit the keep alive limit but the new connection might run into the IPv4/IPv6 lookup problem and fail. Never really figured it out for sure. It's definitely thrown some cold water on my plans to go dual stack everywhere all the time. Not sure it's worth the risk of running into these stupid bugs.

  `error.log` (Nginx for Windows v1.27.0~1.27.2):
  ```log
  [error] *21 connect() failed (80: No connection could be made because the target machine actively refused it) while connecting to upstream, client: 1.2.3.4, server: example.com, request: "POST /test HTTP/1.1", upstream: "http://[::1]:10000/test", host: "example.com"
  ```
  But the client receives no errors (at least most of the time). Will Nginx retry with `127.0.0.1`?

[Internet Draft: Let 'localhost' be localhost | Hacker News](https://news.ycombinator.com/item?id=14949978)

## Performance
[ip - Windows 2008 R2 performance IPv6 traffic vs IPv4 - Server Fault](https://serverfault.com/questions/401623/windows-2008-r2-performance-ipv6-traffic-vs-ipv4)
