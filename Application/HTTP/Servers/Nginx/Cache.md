# Cache
## Proxy cache
[Module `ngx_http_proxy_module`](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_cache)

[NGINX Content Caching | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/content-cache/content-caching/)
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

[NGINX proxy default cache time with Cache-Control and no expiration - Server Fault](https://serverfault.com/questions/915463/nginx-proxy-default-cache-time-with-cache-control-and-no-expiration)
> By default, with just `proxy_cache` configured, nginx only caches responses that have `max-age` set in the `Cache-Control` header.
>
> Without any `Cache-Control` header or just `Cache-Control: public` nginx doesn't cache the response (i.e. you get each time `X-Cache-Status: MISS` when you also configure `add_header X-Cache-Status $upstream_cache_status;`).
>
> You can configure a default caching time for responses without a `Cache-Control` header or ones without a `max-age` field in a `Cache-Control` header:
```nginx
# for 200, 301, 302 responses
proxy_cache_valid     10m;
# for all other responses
proxy_cache_valid any 1m;
```

[How to set up Nginx as a caching reverse proxy? - Server Fault](https://serverfault.com/questions/30705/how-to-set-up-nginx-as-a-caching-reverse-proxy)
