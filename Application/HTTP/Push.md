# Server Push
[Push technology - Wikipedia](https://en.wikipedia.org/wiki/Push_technology)

- Polling (轮询)

  > 重复发送新的请求到服务端。如果服务端没有新的数据，就发送适当的指示并关闭连接。然后客户端等待一段时间后，发送另一个请求。

- 102 Processing
  
  [Reporting progress of a long-running operation in HTTP](https://gist.github.com/awwright/f9a1d2730ec01568342c53e5168a738e)

- Long-polling (长轮询)

  > 客户端发送一个请求到服务端，如果服务端没有新的数据，就保持住这个连接直到有数据。一旦服务端有了数据（消息）给客户端，它就使用这个连接发送数据给客户端，接着连接关闭。

- [→Server-sent events](#server-sent-events)

  > 客户端发送一个请求，服务端就保持这个连接直到有一个新的消息已经准备好了，那么它将消息发送回客户端，同时仍然保持这个连接是打开，这样这个连接就可以用于另一个可用消息的发送。一旦准备好了一个新消息，通过同一初始连接发送回客户端。

- Pushlet (iframe / htmlfile streaming)

- [→WebSocket](../WS/README.md)

- [→Push API](#push-api)

- HTTP/2 Server Push ([Wikipedia](https://en.wikipedia.org/wiki/HTTP/2_Server_Push))

  [HTTP/2 Push is dead](https://evertpot.com/http-2-push-is-dead/)

[ajax - Progress notifications from HTTP/REST service - Stack Overflow](https://stackoverflow.com/questions/1043883/progress-notifications-from-http-rest-service)

[Distributed System: HTTP PUSH-based mechanism | by Bindu C | Medium](https://medium.com/@bindubc/distributed-system-http-push-based-mechanism-6a976ea5076e)

[Web 实时推送技术的总结 | 老卫（柳伟卫）的博客 - 关注编程、系统架构、性能优化 | waylau.com](https://waylau.com/web-real-time-push-technology/)

Discussions:
- 2014-12 [实时处理进度条如何实现？ - V2EX](https://www.v2ex.com/t/151955)
- 2018-12 [为什么很少看到有人用 websocket？ - V2EX](https://www.v2ex.com/t/506933)
- 2019-10 [flask 实现 web 页面展示异步任务的执行过程 - V2EX](https://v2ex.com/t/612070)

## Server-sent events
> 客户端发送一个请求，服务端就保持这个连接直到有一个新的消息已经准备好了，那么它将消息发送回客户端，同时仍然保持这个连接是打开，这样这个连接就可以用于另一个可用消息的发送。一旦准备好了一个新消息，通过同一初始连接发送回客户端。

[基于 SSE 协议实现任务进度条的实时显示------Vue2 + Spring Boot 实践一、引言 在 Web 应用开发中 - 掘金](https://juejin.cn/post/7332403912269856807)

[html - WebSockets vs. Server-Sent events/EventSource - Stack Overflow](https://stackoverflow.com/questions/5195452/websockets-vs-server-sent-events-eventsource)

Pros:
- SSE is generally simpler to implement and easier to test/debug (a simple `curl` could be used).

- > SSEs are sent over traditional HTTP. That means they do not require a special protocol or server implementation to get working. WebSockets on the other hand, require full-duplex connections and new Web Socket servers to handle the protocol. In addition, Server-Sent Events have a variety of features that WebSockets lack by design such as automatic reconnection, event IDs, and the ability to send arbitrary events.

- SSE can be polyfilled into older browsers that do not support it natively using just JavaScript. Some implementations of SSE polyfills can be found on the [Modernizr github page](https://github.com/Modernizr/Modernizr/wiki/HTML5-Cross-Browser-Polyfills).

- Some enterprise firewalls with packet inspection have trouble dealing with WebSockets (Sophos XG Firewall, WatchGuard, McAfee Web Gateway).

Cons:
- SSE suffers from a limitation to the maximum number of open connections, which can be specially painful when opening various tabs as the limit is *per browser* and set to a very low number (6). The issue has been marked as "Won't fix" in [Chrome](https://bugs.chromium.org/p/chromium/issues/detail?id=275955) and [Firefox](https://bugzilla.mozilla.org/show_bug.cgi?id=906896). This limit is per browser + domain, so that means that you can open 6 SSE connections across all of the tabs to `www.example1.com` and another 6 SSE connections to `www.example2.com`.
  - Historically, one severe limitation of SSE, the 6-connections-per-domain limit (a problem when `yourapp.com` is opened in many browser tabs) is not an issue anymore with [`HTTP/2`](https://en.wikipedia.org/wiki/HTTP/2). All modern browsers support `HTTP/2` ([97.16%](https://caniuse.com/http2) of global users) and on the server-side `HTTP/2+` has also surpassed `HTTP/1` the last couple of years.

- SSE supports UTF-8 text messages only, whereas WebSockets can also transmit binary data.

- WebSockets support bidirectional (full-duplex) communication. That said, SSE *could* be used in conjunction with AJAX if bidirectional communication is needed. WebSockets are often said to be the simpler option in those cases, but I think such generalizations can be misleading, as it largely depends on the type of application, how it's designed and the technologies used.

- > In practice since everything that can be done with SSE can also be done with Websockets, Websockets is getting a lot more attention and love, and many more browsers support Websockets than SSE.

Discussions:
- 2023-11 [Websockets VS Server Sent Events : r/ExperiencedDevs](https://www.reddit.com/r/ExperiencedDevs/comments/1845vtf/websockets_vs_server_sent_events/)
  
  > I've used both extensively. I've directly implemented them raw, I've used frameworks like socket.io and I've also utilized SaaS solutions like PubNub. There is a long list of subtle pros/cons that you probably don't care a ton about.
  > 
  > IMO the real question is what is the majority type of data are you sending from the client -> server. Is it domain state (restful op on api resources) or is it application state (user presence, cursor position, etc)? This is important because domain state changes often require their own API separate from web sockets so that other types of consumers (i.e. integrations) can make mutations without having to utilize a web socket.
  > 
  > So applications like Jira, Google Docs, Trello, etc typically rely on SSE because they have already have to support non-websocket APIs for mutations. Highly collaborative Applications like Figma, online gaming, etc often rely on websockets because a lot of their data is ephemeral.
  > 
  > Not a hard rule by any means, just my personal rule of thumb.

### Servers
[axum::response::sse - Rust](https://docs.rs/axum/latest/x86_64-apple-darwin/axum/response/sse/index.html)

### Clients
We can use SSE on the client side with the built-in [EventSource API](https://developer.mozilla.org/en-US/docs/Web/API/EventSource). However, nowadays people often choose to use a library, such as the popular [fetch-event-source](https://github.com/Azure/fetch-event-source), which is an SSE-compatible alternative to EventSource that provides additional features, such as custom headers, more advanced retry strategies, automatically closing the connection when browser is minimized, etc.

## Push API
[Push API](https://w3c.github.io/push-api/), [MDN](https://developer.mozilla.org/en-US/docs/Web/API/Push_API)

Push API, Web push

Web Workers

[Implementing Web Push Messages in 2024](https://www.dr-lex.be/info-stuff/web-push.html)
> Web Push in its current state is an abomination, avoid it if you can. (2024-05)