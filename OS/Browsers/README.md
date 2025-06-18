# Browsers
## Protocols
[Comparison of web browsers: Protocol support - Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_web_browsers#Protocol_support)

- HTTP, HTTPS, SPDY, HTTP/2, HTTP/3
- WebSocket
  - WebTransport
- WebRTC
  - WebTorrent
- Direct Sockets
- DNS, DoH
- Internationalized domain name (IDN)
- Extended Validation (EV), OCSP
- Proxy: HTTP, SOCKS
- WebUSB
- WebBluetooth
- FTP: Removed

  [Deprecations and removals in Chrome 88  |  Blog  |  Chrome for Developers](https://developer.chrome.com/blog/chrome-88-deps-rems#ftp_support_removed)
  > The legacy FTP implementation in Chrome has no support for encrypted connections (FTPS), nor proxies. Usage of FTP in the browser is sufficiently low that it is no longer viable to invest in improving the existing FTP client. In addition, more capable FTP clients are available on all affected platforms.

[mozilla - What protocols are supported by Google chrome browser? - Stack Overflow](https://stackoverflow.com/questions/32474879/what-protocols-are-supported-by-google-chrome-browser)

[What are the communication protocols/standards that are supported by web browsers by default : r/webdev](https://www.reddit.com/r/webdev/comments/oshhbb/what_are_the_communication_protocolsstandards/)

## Direct Sockets
[WICG/direct-sockets: Direct Sockets API for the web platform](https://github.com/WICG/direct-sockets)

[Direct Sockets API](https://wicg.github.io/direct-sockets/)

[Direct Sockets API - Chrome Platform Status](https://chromestatus.com/feature/6398297361088512)
> Allows Isolated Web Apps to establish direct transmission control protocol (TCP) and user datagram protocol (UDP) communications with network devices and systems as well as listen to and accept incoming connections.

- Chrome: [131](https://developer.chrome.com/release-notes/131#direct_sockets_api)
- Firefox: ×
  
  [Raw Sockets API - Issue #431 - mozilla/standards-positions](https://github.com/mozilla/standards-positions/issues/431)

[Direct Sockets API in Chrome 131 | Hacker News](https://news.ycombinator.com/item?id=42022649)
> Direct sockets will have their uses for compatibility with existing applications, but it's possible to do almost any kind of networking you want on the web if you control both sides of the connection.

> 可能群友还不知道这意味着什么 意思是现在电脑上99%的app都真的可以用浏览器完整实现了，比如什么b站视频下载，完全可以做成一个独立的网页（IWA）了，你甚至可以用浏览器写一个 HTTP Server！这实在是太酷了！
