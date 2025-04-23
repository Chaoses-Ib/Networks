# Index
## Auto index
[`ngx_http_autoindex_module`](https://nginx.org/en/docs/http/ngx_http_autoindex_module.html).

```nginx
autoindex on;
autoindex_format json;
```

HTML:
```html
<html>
<head><title>Index of /data/</title></head>
<body>
<h1>Index of /data/</h1><hr><pre><a href="../">../</a>
<a href="test.exe">test.exe</a>                                        18-Apr-2025 15:59              123456
</pre><hr></body>
</html>

```

JSON:
```json
[
{ "name":"test.exe", "type":"file", "mtime":"Fri, 18 Apr 2025 15:59:32 GMT", "size":123456 }
]
```
[What NGINX autoindex\_format JSON(P) response fields/format should I expect? - Stack Overflow](https://stackoverflow.com/questions/46945732/what-nginx-autoindex-format-jsonp-response-fields-format-should-i-expect)

- [pretty-autoindex: Show nginx autoindex more pretty!](https://github.com/spring-raining/pretty-autoindex)
- [kstep/nginx-autoindex-js: Nice nginx JSON autoindex AJAX-client](https://github.com/kstep/nginx-autoindex-js)

## Random index
[Module `ngx_http_random_index_module`](https://nginx.org/en/docs/http/ngx_http_random_index_module.html)
