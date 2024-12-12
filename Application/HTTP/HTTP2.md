# HTTP/2
[Wikipedia](https://en.wikipedia.org/wiki/HTTP/2), [MDN](https://developer.mozilla.org/en-US/docs/Glossary/HTTP_2)

> The primary goals for HTTP/2 are to reduce latency and head-of-line blocking by enabling full request and response multiplexing, minimize protocol overhead via efficient compression of HTTP header fields (HPACK), and support for request prioritization.

[HTTP/2 vs. HTTP/1.1 | Cloudflare](https://www.cloudflare.com/learning/performance/http2-vs-http1.1/)
> In 2015, a new version of HTTP called HTTP/2 was created. HTTP/2 solves several problems that the creators of HTTP/1.1 did not anticipate. In particular, HTTP/2 is much faster and more efficient than HTTP/1.1.
> - One of the ways in which HTTP/2 is faster is in how it prioritizes content during the loading process.
> - Multiplexing: HTTP/1.1 loads resources one after the other, so if one resource cannot be loaded, it blocks all the other resources behind it. In contrast, HTTP/2 is able to use a single TCP connection to send multiple streams of data at once so that no one resource blocks any other resource. HTTP/2 does this by splitting data into binary-code messages and numbering these messages so that the client knows which stream each binary message belongs to.
> - Header compression: Small files load more quickly than large ones. To speed up web performance, both HTTP/1.1 and HTTP/2 compress HTTP messages to make them smaller. However, HTTP/2 uses a more advanced compression method called HPACK that eliminates redundant information in HTTP header packets. This eliminates a few bytes from every HTTP packet. Given the volume of HTTP packets involved in loading even a single webpage, those bytes add up quickly, resulting in faster loading.
> - Server push

[Will HTTP/2 make my site faster? -- O'Reilly](https://www.oreilly.com/content/will-http2-make-my-site-faster/)
- Latency
  
  > HTTP/2 performs better than HTTP/1.1 over high-latency connections. This is because the binary framing and header compression built within the new version of the protocol make the communication more efficient and require fewer round trips. This is especially beneficial for mobile connections, which usually have high-latency connections and limited upstream bandwidth.

- Packet Loss
  
  > High packet loss has a detrimental impact on page-load time over HTTP/2. That’s because HTTP/2 opens a single TCP connection, and the TCP protocol reduces the TCP window size each time there is loss/congestion. Fewer bytes can be sent over the wire via HTTP/2’s single TCP connection than over the six connections that are standard in HTTP/1.1.
  > 
  > The long-term solution to the problem of packet loss will come from the development of better underlying congestion control. Keep an eye for technologies like QUIC, a new transport that reduces latency compared to that of TCP, and BBR, an improved TCP congestion control algorithm.

- Type of content

  > TCP’s congestion control can detrimentally affect HTTP/2 performance because less data will flow over the wire when there’s congestion. This will be more noticeable on pages that have larger objects because it will take much longer to download all the needed bytes through a smaller pipe.
  > 
  > On the other hand, pages that have a large number of small objects (150+) may see a 5-25% performance improvement of the objects delivered over HTTP/2 thanks to features like multiplexing (more requests can be made concurrently) and header compression (fewer bytes are sent to the server for each request).

[7 Tips for Faster HTTP/2 Performance](https://www.f5.com/company/blog/nginx/7-tips-for-faster-http2-performance)

[Benchmarking HTTP/2 vs. HTTP/1.1: Results Not as Expected : r/node](https://www.reddit.com/r/node/comments/1cemrgp/benchmarking_http2_vs_http11_results_not_as/)

[Why Turning on HTTP/2 Was a Mistake](https://lucid.co/techblog/2019/04/10/why-turning-on-http2-was-a-mistake) ([Hacker News](https://news.ycombinator.com/item?id=19720962))
- Request spikes

## Nginx
[Module `ngx_http_v2_module`](https://nginx.org/en/docs/http/ngx_http_v2_module.html)
```nginx
server {
    listen 443 ssl;

    http2 on;

    ssl_certificate server.crt;
    ssl_certificate_key server.key;
}
```
[How to Enable HTTP2.0 in Nginx?](https://www.tutorialspoint.com/how-to-enable-http2-0-in-nginx)

[Can I enable HTTP/2 for specific server blocks (virtual hosts) only, on Nginx? - Stack Overflow](https://stackoverflow.com/questions/40987592/can-i-enable-http-2-for-specific-server-blocks-virtual-hosts-only-on-nginx)

Performance:

[Optimizing HTTP/2 prioritization with BBR and `tcp_notsent_lowat`](https://blog.cloudflare.com/http-2-prioritization-with-nginx/)

[HTTP2 drastically slows down up and download - Seafile Server - Seafile Community Forum](https://forum.seafile.com/t/http2-drastically-slows-down-up-and-download/15472)
> We tested with a few combinations:
> 
> 1. Nginx with `proxy_request_buffering` set to 'on': This makes Nginx buffer the entire file before sending to upstream (seaf-server). In this setting, the upload speed is totally decided by Nginx. Result: The upload speed is normal.
> 2. Nginx with `proxy_request_buffering` set to 'off': Nginx will forward the data to seaf-server upon receiving it. In this setting, the upload speed is decided by both Nginx and seaf-server. Nginx will convert from http2 to http 1.1. Result: The upload speed is only half of setting 1.
> 3. Nginx with `proxy_request_buffering` set to 'off', and replace seaf-server with the new fileserver written in Go language. The result is the same as setting 2.
> 
> All tests use Chrome as the client.
> 
> We could assume the http handling of Go standard library is quite efficient and conforms to standards. Given that the speed of settings 2 and 3 has no difference, we think the bottleneck is in the conversion from http2 to http 1.1 in Nginx.

[performance - Why HTTP/2 is slower than plain HTTPS? - Stack Overflow](https://stackoverflow.com/questions/33658302/why-http-2-is-slower-than-plain-https) (Windows)

[Enabling HTTP/2 makes the site much slower in nginx - Server Fault](https://serverfault.com/questions/979694/enabling-http-2-makes-the-site-much-slower-in-nginx)

[networking - Nginx HTTP/2 performance worse than HTTP/1.1 with TLS - Server Fault](https://serverfault.com/questions/806904/nginx-http-2-performance-worse-than-http-1-1-with-tls)

[nginx - http2 seems to slow down static downloading - Stack Overflow](https://stackoverflow.com/questions/70721439/http2-seems-to-slow-down-static-downloading)

[performance - Why is my HTTP/2 stream slower than HTTP/1.1 and HTTPS - Stack Overflow](https://stackoverflow.com/questions/42421615/why-is-my-http-2-stream-slower-than-http-1-1-and-https)

### Upload
[Delivering HTTP/2 upload speed improvements](https://blog.cloudflare.com/delivering-http-2-upload-speed-improvements/)
> HTTP/1.1 simply uses a single buffer, so TCP socket buffers do the flow control. However with HTTP/2, the application layer also has receiver flow control and NGINX uses a fixed size buffer for the receiver. This limits upload speed when the current link has a BDP larger than the current request body buffer size. So the bottleneck is HTTP/2 flow control when the buffer size is too tight.

> The CloudFlare article says they sent the patch to NGINX upstream. But I couldn't find either the commit or the code in the repo of Nginx. Maybe it's declined for some reason.

[Given nginx configuration slows down uploads over https - Issue #1106 - tus/tusd](https://github.com/tus/tusd/issues/1106)

[Slow uploads with HTTP/2 - Issue #9578 - nextcloud/documentation](https://github.com/nextcloud/documentation/issues/9578)
```nginx
client_body_buffer_size 512k;
```

[apache 2.4 - Upload files slow (nginx + http2) - Server Fault](https://serverfault.com/questions/1051387/upload-files-slow-nginx-http2)

## Tools
- Chrome DevTools
- [HTTP/2 Test - Verify HTTP/2 Support | KeyCDN Tools](https://tools.keycdn.com/http2-test)

## Rapid Reset attack
[How it works: The novel HTTP/2 'Rapid Reset' DDoS attack | Google Cloud Blog](https://cloud.google.com/blog/products/identity-security/how-it-works-the-novel-http2-rapid-reset-ddos-attack)
> The client opens a large number of streams at once as in the standard HTTP/2 attack, but rather than waiting for a response to each request stream from the server or proxy, the client cancels each request immediately.
> 
> Mitigations for this attack vector can take multiple forms, but mostly center around tracking connection statistics and using various signals and business logic to determine how useful each connection is. For example, if a connection has more than 100 requests with more than 50% of the given requests canceled, it could be a candidate for a mitigation response. The magnitude and type of response depends on the risk to each platform, but responses can range from forceful GOAWAY frames as discussed before to closing the TCP connection immediately.

[HTTP/2 Rapid Reset: deconstructing the record-breaking attack](https://blog.cloudflare.com/technical-breakdown-http2-rapid-reset-ddos-attack/)
> A common HTTP deployment architecture is to run an HTTP/2 proxy or load-balancer in front of other components. When a client request arrives it is quickly dispatched and the actual work is done as an asynchronous activity somewhere else. This allows the proxy to handle client traffic very efficiently. However, this separation of concerns can make it hard for the proxy to tidy up the in-process jobs. Therefore, these deployments are more likely to encounter issues from rapid resets.

[HTTP/2 Zero-Day vulnerability results in record-breaking DDoS attacks](https://blog.cloudflare.com/zero-day-rapid-reset-http2-record-breaking-ddos-attack/)
> As of August 2024, it is supported by 66.2% of websites (35.3% HTTP/2 + 30.9% HTTP/3 with backwards compatibility) and supported by almost all web browsers (over 98% of users).