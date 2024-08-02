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
- Trailing slashes

  [proxy - using trailing slashes in nginx configuration - Server Fault](https://serverfault.com/questions/607615/using-trailing-slashes-in-nginx-configuration)

  [Nginx trailing slash in proxy pass url - Stack Overflow](https://stackoverflow.com/questions/22759345/nginx-trailing-slash-in-proxy-pass-url)
  > As stated in [nginx documentation](http://nginx.org/r/proxy_pass) if `proxy_pass` used without URI (i.e. without path after server:port) nginx will put URI from original request exactly as it was with all double slashes, `../` and so on.

- Exact matching: `location = /abc`
  
  [Nginx location matches - Stack Overflow](https://stackoverflow.com/questions/5239131/nginx-location-matches)

[NGINX as a file server](https://www.yanxurui.cc/posts/server/2017-03-21-NGINX-as-a-file-server/)

## Security
- [ngx\_waf: Handy, High performance, ModSecurity compatible Nginx firewall module & 方便、高性能、兼容 ModSecurity 的 Nginx 防火墙模块](https://github.com/ADD-SP/ngx_waf)