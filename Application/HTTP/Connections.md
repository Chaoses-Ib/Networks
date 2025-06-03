# Connections
[HTTP persistent connection - Wikipedia](https://en.wikipedia.org/wiki/HTTP_persistent_connection)

## `Connection` header
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Connection)

> The **`Connection`** general header controls whether the network connection stays open after the current transaction finishes. If the value sent is `keep-alive`, the connection is persistent and not closed, allowing for subsequent requests to the same server to be done.

If the client supports keep-alive, it adds an additional header to the request:
```http
Connection: keep-alive
```
When the server receives this request and generates a response, if it supports keep-alive then it also adds the same above header to the response. Following this, the connection is not dropped, but is instead kept open. When the client sends another request, it uses the same connection.

This will continue until either the client or the server decides that the conversation is over and in this case they omit the "Connection:" header from the last message sent or, better, they add the keyword "close" to it:
```http
Connection: close
```

> The default value of `Connection` changed between HTTP/1.0 and HTTP/1.1. Therefore, to ensure backwards compatibility, browsers often send `Connection: keep-alive` explicitly despite that being the default in HTTP/1.1.

> Connection-specific header fields such as `Connection` and [`Keep-Alive`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Keep-Alive) are prohibited in [HTTP/2](https://httpwg.org/specs/rfc9113.html#ConnectionSpecific) and [HTTP/3](https://httpwg.org/specs/rfc9114.html#header-formatting). Chrome and Firefox ignore them in HTTP/2 responses, but Safari conforms to the HTTP/2 spec requirements and does not load any response that contains them.

## `Keep-Alive` header
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Keep-Alive)

> The HTTP `Keep-Alive` request and response header allows the sender to hint how a connection may be used in terms of a timeout and a maximum amount of requests.

Nginx:
- `keepalive_time 1h;`
- [`keepalive_timeout 75s [header_timeout];`](https://nginx.org/en/docs/http/ngx_http_core_module.html#keepalive_timeout)
  
  > The first parameter sets a timeout during which a keep-alive client connection will stay open on the server side. The zero value disables keep-alive client connections. The optional second parameter sets a value in the "Keep-Alive: timeout=`*time*`" response header field. Two parameters may differ.

  [http - What's the difference between Nginx 'keepalive\_time' and 'keepalive\_timeout'? - Server Fault](https://serverfault.com/questions/1121478/whats-the-difference-between-nginx-keepalive-time-and-keepalive-timeout)
  > `keepalive_timeout` is the time where the server will keep an idle connection open. If you send a request and then do nothing on this connection, the server will shutdown the connection at 75s after your previous request. `keepalive_time` is the maximum duration where a connection can be kept open even if it is not idle. So, if your connection is idle (no requests are sent), the server will shut it down after 75s (`keepalive_timeout`). If your connection is not idle (you keep sending requests), the server will shut it down after 1 hour (`keepalive_time`).

## SSE
> ...authors can include a comment line (one starting with a ':' character) every 15 seconds or so.

```http
data: {"Progress":99}

:

data: {"Progress":100}

```

[Server-Sent Events (SSE) - add Keep-Alive Messages definition - Issue #7571 - whatwg/html](https://github.com/whatwg/html/issues/7571)

[SSE Timeout after 20 mins - Issue #28 - mpetazzoni/sse.js](https://github.com/mpetazzoni/sse.js/issues/28)
