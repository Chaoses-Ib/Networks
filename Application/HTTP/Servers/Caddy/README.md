# [Caddy](https://caddyserver.com/)
[GitHub](https://github.com/caddyserver/caddy)

> Fast and extensible multi-platform HTTP/1-2-3 web server with automatic HTTPS

[All features of the Caddy Web Server](https://caddyserver.com/features)

[Getting Started --- Caddy Documentation](https://caddyserver.com/docs/getting-started)

[Build from source --- Caddy Documentation](https://caddyserver.com/docs/build)

`scoop install caddy`

40 MiB, ~8.8x Nginx.
- LZMA2: 9.4 MiB
- [Caddy binaries on Linux shrink by ~2.5 MB with Go 1.15! (~33 MB down to ~31 MB) ... | Hacker News](https://news.ycombinator.com/item?id=24126664)

[Download Caddy](https://caddyserver.com/download)

## Config
### Caddyfile
[The Caddyfile --- Caddy Documentation](https://caddyserver.com/docs/caddyfile)
- [Caddyfile Concepts --- Caddy Documentation](https://caddyserver.com/docs/caddyfile/concepts)
- Addresses
  - Defaults to `https://` if there is domain name or `:443` but no protocol

[Caddyfile Tutorial --- Caddy Documentation](https://caddyserver.com/docs/caddyfile-tutorial)

### Nginx
[caddyserver/nginx-adapter: Run Caddy with your NGINX config](https://github.com/caddyserver/nginx-adapter)
- Basic

## Static files
[Static files quick-start --- Caddy Documentation](https://caddyserver.com/docs/quick-starts/static-files)
- Caddyfile 400 Bad Request? Only HTTPS

## Proxying
[`reverse_proxy` (Caddyfile directive) --- Caddy Documentation](https://caddyserver.com/docs/caddyfile/directives/reverse_proxy)

## Performance
- Memory usage
  
	> Only caveat is ram usage. Caddy uses a fair bit more so if you are ram limited, Nginx.
	> - For 10 concurrent clients, Nginx below 32MB, Caddy below 64MB.
	> - For 200 concurrent clients, Nginx below 32MB, Caddy below 96MB.
	> - For 500 concurrent clients, Nginx below 64MB, Caddy below 128MB.

	[Are there ways to tune Caddy to reduce memory usage? - Help - Caddy Community](https://caddy.community/t/are-there-ways-to-tune-caddy-to-reduce-memory-usage/20533)
- GC

## Security
### HTTPS
[Automatic HTTPS --- Caddy Documentation](https://caddyserver.com/docs/automatic-https)

[tls (Caddyfile directive) --- Caddy Documentation](https://caddyserver.com/docs/caddyfile/directives/tls)
```caddy
example.com {
	tls cert.pem key.pem
}
```

TLS termination:
```caddy
:443 {
	tls "C:\cert\cert.pem" "C:\cert\key.pem"
	reverse_proxy 127.0.0.1:80
}
```

### Rate limiting
[Module http.handlers.rate\_limit - Caddy Documentation](https://caddyserver.com/docs/modules/http.handlers.rate_limit)

No official support.

- [mholt/caddy-ratelimit: HTTP rate limiting module for Caddy 2](https://github.com/mholt/caddy-ratelimit)
  - Always happens after TLS handshake?
  - [This module is making Caddy Consume around 4.8GB of Memory - Issue #44 - mholt/caddy-ratelimit](https://github.com/mholt/caddy-ratelimit/issues/44)
  - [Hayak3/caddy2\_ratelimit: A distributed ratelimit for caddy2](https://github.com/Hayak3/caddy2_ratelimit)

		[New caddy rate limit module - Plugins - Caddy Community](https://caddy.community/t/new-caddy-rate-limit-module/20241)
- [RussellLuo/caddy-ext: Various Caddy v2 extensions (a.k.a. modules).](https://github.com/RussellLuo/caddy-ext) (discontinued)
- [shaj13/tlslimit: Limiting the rate of TLS handshakes](https://github.com/shaj13/tlslimit)

  [GitHub - shaj13/tlslimit: Limiting the rate of TLS handshakes￼ : r/golang](https://www.reddit.com/r/golang/comments/ygz4ru/github_shaj13tlslimit_limiting_the_rate_of_tls/)

## [→HTTP/3](../../HTTP3.md#caddy)
