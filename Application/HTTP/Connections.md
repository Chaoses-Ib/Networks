# Connections
[HTTP persistent connection - Wikipedia](https://en.wikipedia.org/wiki/HTTP_persistent_connection)

## `Connection` header
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Connection)

> The **`Connection`** general header controls whether the network connection stays open after the current transaction finishes. If the value sent is `keep-alive`, the connection is persistent and not closed, allowing for subsequent requests to the same server to be done.

> The default value of `Connection` changed between HTTP/1.0 and HTTP/1.1. Therefore, to ensure backwards compatibility, browsers often send `Connection: keep-alive` explicitly despite that being the default in HTTP/1.1.

> Connection-specific header fields such as `Connection` and [`Keep-Alive`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Keep-Alive) are prohibited in [HTTP/2](https://httpwg.org/specs/rfc9113.html#ConnectionSpecific) and [HTTP/3](https://httpwg.org/specs/rfc9114.html#header-formatting). Chrome and Firefox ignore them in HTTP/2 responses, but Safari conforms to the HTTP/2 spec requirements and does not load any response that contains them.
