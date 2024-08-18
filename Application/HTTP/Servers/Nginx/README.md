# Nginx
[Wikipedia](https://en.wikipedia.org/wiki/Nginx)

[Beginner's Guide](https://nginx.org/en/docs/beginners_guide.html)

[Nginx Cheatsheet](https://techbeats.blog/nginx-cheatsheet)

[Nginx 入门教程](https://xuexb.github.io/learn-nginx/)

[准备要做一个技术分享会，主题是 Nginx，大家平时遇到什么坑可以讨论一下吗 - V2EX](https://hk.v2ex.com/t/872148)

[Awesome Nginx: A curated list of awesome Nginx distributions, 3rd party modules, Active developers, etc.](https://github.com/agile6v/awesome-nginx)

## Windows
[nginx for Windows](https://nginx.org/en/docs/windows.html)

- > Only the `select()` and `poll()` (1.15.9) connection processing methods are currently used, so high performance and scalability should not be expected.
- > The UDP proxy functionality is not supported.
- > nginx/Windows uses the directory where it has been run as the prefix for relative paths in the configuration.

[Installing Nginx on Windows --- A Step-by-Step Guide | by Chandramathi Muthuraj | Medium](https://medium.com/@chandramuthuraj/installing-nginx-on-windows-a-step-by-step-guide-6750575c63e2)

`scoop install nginx`

4.5 MiB.

## Modules
[NGINX Modules](https://www.f5.com/pdf/product-overview/2019-04-24-NGINX-Modules-datasheet.pdf)

### Bindings
Rust:
- [ngx-rust: Rust binding for NGINX](https://github.com/nginxinc/ngx-rust)
- [nginx-rs: Nginx module written in Rust](https://github.com/dcoles/nginx-rs) (discontinued)

## Configs
- [nginx-config: An (unofficial) nginx configuration parser](https://github.com/tailhook/nginx-config) (discontinued)
  - [nginx-config-mod: A command-line utility and a rust library to validate and make certain tweaks/rewrites of nginx configs](https://github.com/tailhook/nginx-config-mod) (discontinued)

## HTTP
### [ngx_http_core_module](https://nginx.org/en/docs/http/ngx_http_core_module.html)
- Trailing slashes

  [proxy - using trailing slashes in nginx configuration - Server Fault](https://serverfault.com/questions/607615/using-trailing-slashes-in-nginx-configuration)

  [Nginx trailing slash in proxy pass url - Stack Overflow](https://stackoverflow.com/questions/22759345/nginx-trailing-slash-in-proxy-pass-url)
  > As stated in [nginx documentation](http://nginx.org/r/proxy_pass) if `proxy_pass` used without URI (i.e. without path after server:port) nginx will put URI from original request exactly as it was with all double slashes, `../` and so on.

- Exact matching: `location = /abc`
  
  [Nginx location matches - Stack Overflow](https://stackoverflow.com/questions/5239131/nginx-location-matches)

- SPA
  ```nginx
  location / {
    try_files $uri $uri/ /index.html;
  }
  ```

[NGINX as a file server](https://www.yanxurui.cc/posts/server/2017-03-21-NGINX-as-a-file-server/)

### [ngx_http_proxy_module](https://nginx.org/en/docs/http/ngx_http_proxy_module.html)
[NGINX Reverse Proxy | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)

- `$remote_addr`

  ```nginx
  proxy_set_header X-Real-IP $remote_addr;
  ```

- `$proxy_add_x_forwarded_for`: `$http_x_forwarded_for,$remote_addr`

  The "X-Forwarded-For" client request header field with the `$remote_addr` variable appended to it, separated by a comma. If the "X-Forwarded-For" field is not present in the client request header, the `$proxy_add_x_forwarded_for` variable is equal to the `$remote_addr` variable.

[Nginx: reverse proxy passing client IP to the server - Server Fault](https://serverfault.com/questions/920030/nginx-reverse-proxy-passing-client-ip-to-the-server)

### [ngx_http_realip_module](https://nginx.org/en/docs/http/ngx_http_realip_module.html)
[http headers - NGinx `$proxy_add_x_forwarded_for` and `real_ip_header` - Stack Overflow](https://stackoverflow.com/questions/29279084/nginx-proxy-add-x-forwarded-for-and-real-ip-header)

## Security
- [ngx\_waf: Handy, High performance, ModSecurity compatible Nginx firewall module & 方便、高性能、兼容 ModSecurity 的 Nginx 防火墙模块](https://github.com/ADD-SP/ngx_waf)