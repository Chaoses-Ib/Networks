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

## Nginx
[caddyserver/nginx-adapter: Run Caddy with your NGINX config](https://github.com/caddyserver/nginx-adapter)

## Static files
[Static files quick-start --- Caddy Documentation](https://caddyserver.com/docs/quick-starts/static-files)
- Caddyfile 400 Bad Request? Only HTTPS

## HTTPS
[Automatic HTTPS --- Caddy Documentation](https://caddyserver.com/docs/automatic-https)

[tls (Caddyfile directive) --- Caddy Documentation](https://caddyserver.com/docs/caddyfile/directives/tls)
```caddy
example.com {
	tls cert.pem key.pem
}
```

## [→HTTP/3](../../HTTP3.md#caddy)
