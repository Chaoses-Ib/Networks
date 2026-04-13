#import "@local/ib:0.1.0": *
#title[Cache]
= Static file cache
```nginx
location /assets/ {
    add_header Cache-Control "max-age=31536000, immutable";
}
```

Or:
```nginx
location ~* ^/assets/ {
    expires 1y;
    add_header Cache-Control "public, immutable";
}
```
- `expires`
  #footnote[#a[Module `ngx_http_headers_module`][https://nginx.org/en/docs/http/ngx_http_headers_module.html#expires]]
  will cause 2 `Cache-Control` headers and `Expires`.

Only when any arg
#footnote[#a[Alphabetical index of variables][https://nginx.org/en/docs/varindex.html]]
is present:
```nginx
add_header Cache-Control "max-age=1";
if ($is_args) {
    add_header Cache-Control "max-age=31536000, immutable";
}
```

= Proxy cache
#a[Module `ngx_http_proxy_module`][https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_cache]

#a[NGINX Content Caching | NGINX Documentation][https://docs.nginx.com/nginx/admin-guide/content-cache/content-caching/]
```nginx
http {
    # ...
    proxy_cache_path /data/nginx/cache keys_zone=mycache:10m;
    server {
        proxy_cache mycache;
        location / {
            proxy_pass http://localhost:8000;
        }
    }
}
```
- `proxy_cache_path` is often `/var/cache/nginx/proxy_cache`,
  #footnote[#a[configuration - Understanding the nginx `proxy_cache_path` directive - Server Fault][https://serverfault.com/questions/583570/understanding-the-nginx-proxy-cache-path-directive]]
  #footnote[#a[How to Set Up Nginx Caching for Better Performance][https://oneuptime.com/blog/post/2026-02-20-nginx-caching-performance/view]]
  but it requires ```sh mkdir /var/cache/nginx```.

#md(```
[NGINX proxy default cache time with Cache-Control and no expiration - Server Fault](https://serverfault.com/questions/915463/nginx-proxy-default-cache-time-with-cache-control-and-no-expiration)
> By default, with just `proxy_cache` configured, nginx only caches responses that have `max-age` set in the `Cache-Control` header.
>
> Without any `Cache-Control` header or just `Cache-Control: public` nginx doesn't cache the response (i.e. you get each time `X-Cache-Status: MISS` when you also configure `add_header X-Cache-Status $upstream_cache_status;`).
>
> You can configure a default caching time for responses without a `Cache-Control` header or ones without a `max-age` field in a `Cache-Control` header:
```)
```nginx
# for 200, 301, 302 responses
proxy_cache_valid     10m;
# for all other responses
proxy_cache_valid any 1m;
```

- `proxy_cache_revalidate` is `off` by default.

- To cache but revalidate every time:
  #footnote[#t[170108] #a[\#1182 (Responses with "no-cache" or "max-age=0" should be cached) -- nginx][https://trac.nginx.org/nginx/ticket/1182]]
  #footnote[#a[http headers - nginx cache but immediately expire/revalidate using `Cache-Control: public, s-maxage=0` - Stack Overflow][https://stackoverflow.com/questions/41252208/nginx-cache-but-immediately-expire-revalidate-using-cache-control-public-s-ma]]
  - `Cache-Control: max-age=1` (after 1s)
  - `X-Accel-Expires: @1` (Unix epoch +1s)
  - `X-Accel-Redirect`

- ```nginx add_header X-Cache-Status $upstream_cache_status;```
  - `HIT`
  - `MISS`
  - `REVALIDATED`

- `If-Modified-Since` will be removed for the upstream by default.
  #footnote[#a[how to get nginx with `proxy_pass` and `if_modified_since` to return a 304-Not Modified - Server Fault][https://serverfault.com/questions/500652/how-to-get-nginx-with-proxy-pass-and-if-modified-since-to-return-a-304-not-modif]]

- `proxy_cache_bypass` can be used to refresh cache (instead of just bypassing).
  #footnote[#a[How to force Nginx to cache revalidate - Server Fault][https://serverfault.com/questions/946777/how-to-force-nginx-to-cache-revalidate]]

[How to set up Nginx as a caching reverse proxy? - Server Fault](https://serverfault.com/questions/30705/how-to-set-up-nginx-as-a-caching-reverse-proxy)
