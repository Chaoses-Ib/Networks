# Nginx
[Wikipedia](https://en.wikipedia.org/wiki/Nginx), [GitHub](https://github.com/nginx/nginx)

[Beginner's Guide](https://nginx.org/en/docs/beginners_guide.html)

[agentzh's Nginx Tutorials (version 2020.03.19)](https://openresty.org/download/agentzh-nginx-tutorials-en.html)

[Nginx Cheatsheet](https://techbeats.blog/nginx-cheatsheet)

Books:
- [NGINX Cookbook @Derek DeJonghe](https://www.oreilly.com/library/view/nginx-cookbook-2nd/9781098126230/)
  - [NGINX实战指南 | nginx-cookbook](https://lzqwebsoft.gitbook.io/nginx-cookbook)
- [Nginx 入门教程](https://xuexb.github.io/learn-nginx/)
- [hiyang/NGINX - 看云](https://www.kancloud.cn/hiyang/nginx/364780)

[准备要做一个技术分享会，主题是 Nginx，大家平时遇到什么坑可以讨论一下吗 - V2EX](https://hk.v2ex.com/t/872148)

[Avoiding the Top 10 NGINX Configuration Mistakes](https://www.f5.com/company/blog/nginx/avoiding-top-10-nginx-configuration-mistakes#no-keepalives)

[Awesome Nginx: A curated list of awesome Nginx distributions, 3rd party modules, Active developers, etc.](https://github.com/agile6v/awesome-nginx)

## Windows
[nginx for Windows](https://nginx.org/en/docs/windows.html)

- > Only the `select()` and `poll()` (1.15.9) connection processing methods are currently used, so high performance and scalability should not be expected.
  - [hello, nginx for windows problem with multithreading : r/nginx](https://www.reddit.com/r/nginx/comments/1adqgmw/hello_nginx_for_windows_problem_with/)
- > The UDP proxy functionality is not supported.
- > nginx/Windows uses the directory where it has been run as the prefix for relative paths in the configuration.

[Installing Nginx on Windows --- A Step-by-Step Guide | by Chandramathi Muthuraj | Medium](https://medium.com/@chandramuthuraj/installing-nginx-on-windows-a-step-by-step-guide-6750575c63e2)

`scoop install nginx`

4.5 MiB.

## CLI
[Command-line parameters](https://nginx.org/en/docs/switches.html)

[Controlling NGINX Processes at Runtime | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/basic-functionality/runtime-control/)

[Controlling nginx](https://nginx.org/en/docs/control.html)

On Windows, Nginx can start multiple instances, but `quit` can only quit the last instance.

## Modules
[NGINX Modules](https://www.f5.com/pdf/product-overview/2019-04-24-NGINX-Modules-datasheet.pdf)

[NGINX Extras](https://nginx-extras.getpagespeed.com/)

### Bindings
Rust:
- [ngx-rust: Rust binding for NGINX](https://github.com/nginxinc/ngx-rust)
- [nginx-rs: Nginx module written in Rust](https://github.com/dcoles/nginx-rs) (discontinued)

## Configs
- [misc-conf: Nom parser for nginx/apache configuration](https://github.com/metaworm/misc-conf)
- [nginx-config: An (unofficial) nginx configuration parser](https://github.com/tailhook/nginx-config) (discontinued)
  - [nginx-config-mod: A command-line utility and a rust library to validate and make certain tweaks/rewrites of nginx configs](https://github.com/tailhook/nginx-config-mod) (discontinued)
- [webserver-config: A Rust crate for generating configuration files for web servers.](https://git.codespace.cz/oohost/webserver-config)

Nginx 不肯加强对变量的支持，导致盛行使用第三方工具生成配置。

### Variables
[Alphabetical index of variables](https://nginx.org/en/docs/varindex.html)

[Is there a proper way to use nginx variables to make sections of the configuration shorter, using them as macros for making parts of configuration work as templates?](https://nginx.org/en/docs/faq/variables_in_config.html)
> Variables should not be used as template macros. Variables are evaluated in the run-time during the processing of each request, so they are rather costly compared to plain static configuration. Using variables to store static strings is also a bad idea. Instead, a macro expansion and "include" directives should be used to generate configs more easily and it can be done with the external tools, e.g. sed + make or any other common template mechanism.

[Using variables in Nginx location rules - Stack Overflow](https://stackoverflow.com/questions/15416957/using-variables-in-nginx-location-rules)

### Environment variables
- [`env`](https://nginx.org/en/docs/ngx_core_module.html#env)

- `envsubst`

  [Using Environment Variables in Nginx Config File | Baeldung on Linux](https://www.baeldung.com/linux/nginx-config-environment-variables)

  [XAMPPRocky/eve: A utility to easily search and replace with environment variables.](https://github.com/XAMPPRocky/eve) (discontinued)

- `set_by_lua`

  [Environment variables in nginx config - Kristian Glass - Do I Smell Burning?](https://blog.doismellburning.co.uk/environment-variables-in-nginx-config/)

- `perl_set`

- Docker: [Using environment variables in nginx configuration (new in 1.19)](https://github.com/docker-library/docs/tree/master/nginx#using-environment-variables-in-nginx-configuration-new-in-119)

[nginx: use environment variables - Stack Overflow](https://stackoverflow.com/questions/21866477/nginx-use-environment-variables)

### Templates
[Understanding Config Templates | NGINX Documentation](https://docs.nginx.com/nginx-management-suite/nim/about/templates/config-templates/)

## [ngx_core_module](https://nginx.org/en/docs/ngx_core_module.html)
- `daemon`

  [webserver - What is the difference between nginx daemon on/off option? - Stack Overflow](https://stackoverflow.com/questions/25970711/what-is-the-difference-between-nginx-daemon-on-off-option)

  `off` on Windows.

- [`include`](https://nginx.org/en/docs/ngx_core_module.html#include)

## HTTP
### [ngx_http_core_module](https://nginx.org/en/docs/http/ngx_http_core_module.html)
- Trailing slashes

  [proxy - using trailing slashes in nginx configuration - Server Fault](https://serverfault.com/questions/607615/using-trailing-slashes-in-nginx-configuration)

  [Nginx trailing slash in proxy pass url - Stack Overflow](https://stackoverflow.com/questions/22759345/nginx-trailing-slash-in-proxy-pass-url)
  > As stated in [nginx documentation](http://nginx.org/r/proxy_pass) if `proxy_pass` used without URI (i.e. without path after server:port) nginx will put URI from original request exactly as it was with all double slashes, `../` and so on.

- Exact matching: `location = /abc`
  
  [Nginx location matches - Stack Overflow](https://stackoverflow.com/questions/5239131/nginx-location-matches)

- [`root`](https://nginx.org/en/docs/http/ngx_http_core_module.html#root)

  A path to the file is constructed by merely adding a URI to the value of the `root` directive. If a URI has to be modified, the [alias](https://nginx.org/en/docs/http/ngx_http_core_module.html#alias) directive should be used.

  ```nginx
  location /i/ {
      # /i/top.gif → /data/w3/i/top.gif
      root /data/w3;

      # /i/top.gif → /data/w3/top.gif
      alias /data/w3/;
  }
  ```

- SPA
  ```nginx
  location / {
    try_files $uri $uri/ /index.html;
  }
  ```

- Host names
  - `$host`: In this order of precedence: host name from the request line, or host name from the `Host` request header field, or the server name matching a request.
    - No port number: `Host: 1.2.3.4:5678` → `1.2.3.4`
      - `$host:$server_post`
  
  - `$http_host`: The content of the HTTP `Host` header field, if it was present in the request.
    - [docker - How to configure nginx X-Forwarded-Port to be the originally request port - Stack Overflow](https://stackoverflow.com/questions/60616564/how-to-configure-nginx-x-forwarded-port-to-be-the-originally-request-port)
  
  - `$server_name`: The `server_name` of the virtual host which processed the request, as it was defined in the nginx configuration. If a `server` contains multiple `server_name`s, only the first one will be present in this variable.
  
  - `$hostname`: `/etc/hostname`

  [rewrite - What is the difference between Nginx variables $host, $http\_host, and $server\_name? - Server Fault](https://serverfault.com/questions/706438/what-is-the-difference-between-nginx-variables-host-http-host-and-server-na)

  [nginx: the difference between `$host`, `$http_host` & `$hostname` and priorities of `$host` - TheDotProduct](https://www.thedotproduct.org/posts/nginx-the-difference-between-$host-$http_host-$hostname-and-priorities-of-$host.html)

[NGINX as a file server](https://www.yanxurui.cc/posts/server/2017-03-21-NGINX-as-a-file-server/)

### [ngx_http_proxy_module](https://nginx.org/en/docs/http/ngx_http_proxy_module.html)
[NGINX Reverse Proxy | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/web-server/reverse-proxy/)

- `$remote_addr`

  ```nginx
  proxy_set_header X-Real-IP $remote_addr;
  ```

- `$proxy_add_x_forwarded_for`: `$http_x_forwarded_for,$remote_addr`

  The "X-Forwarded-For" client request header field with the `$remote_addr` variable appended to it, separated by a comma. If the "X-Forwarded-For" field is not present in the client request header, the `$proxy_add_x_forwarded_for` variable is equal to the `$remote_addr` variable.

- Connections

  [http - Why does nginx `proxy_pass` close my connection? - Stack Overflow](https://stackoverflow.com/questions/46771389/why-does-nginx-proxy-pass-close-my-connection)

[Nginx: reverse proxy passing client IP to the server - Server Fault](https://serverfault.com/questions/920030/nginx-reverse-proxy-passing-client-ip-to-the-server)

### [ngx_http_realip_module](https://nginx.org/en/docs/http/ngx_http_realip_module.html)
[http headers - NGinx `$proxy_add_x_forwarded_for` and `real_ip_header` - Stack Overflow](https://stackoverflow.com/questions/29279084/nginx-proxy-add-x-forwarded-for-and-real-ip-header)

## Lua
[Lua | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/dynamic-modules/lua/)

- [OpenResty: A dynamic web platform based on NGINX and LuaJIT](https://openresty.org/)
  - [lua-nginx-module: Embed the Power of Lua into NGINX HTTP servers](https://github.com/openresty/lua-nginx-module)

  [Pushing Nginx to its limit with Lua](https://blog.cloudflare.com/pushing-nginx-to-its-limit-with-lua)

## Logs
[NGINX Access Logs and Error Logs | DigitalOcean](https://www.digitalocean.com/community/tutorials/nginx-access-logs-error-logs)

[Debugging NGINX | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/monitoring/debugging/)
```nginx
error_log  logs/error.log  debug;
```
[linux - best way to debug nginx rewrite rules in config file? - Server Fault](https://serverfault.com/questions/333048/best-way-to-debug-nginx-rewrite-rules-in-config-file)

- [rhit: A nginx log explorer](https://github.com/Canop/rhit)
- [logutil: A Rust-based tool designed to analyze Nginx access logs](https://github.com/s00d/logutil)
- [ngxav-rs: A 100% Rust Rewrite of Nginx Log Stats, a full-featured NGINX log parser and searcher with 10+ Search Refiners](https://github.com/qpxdesign/ngxav-rs/)
- [access\_log\_parser: A library of Rust parsers for reading access logs in a strongly-typed way](https://github.com/dmikusa/access_log_parser)
- [pff: "Ban Not Fail" PoC](https://github.com/dmilith/pff)

## Security
- [ngx\_waf: Handy, High performance, ModSecurity compatible Nginx firewall module & 方便、高性能、兼容 ModSecurity 的 Nginx 防火墙模块](https://github.com/ADD-SP/ngx_waf)

### Rate limiting
- [ngx_http_core_module](https://nginx.org/en/docs/http/ngx_http_core_module.html)
  - `limit_rate`, `limit_except`
- [ngx_http_limit_conn_module](https://nginx.org/en/docs/http/ngx_http_limit_conn_module.html)
  - `limit_conn`, `limit_zone`
- [ngx_http_limit_req_module](https://nginx.org/en/docs/http/ngx_http_limit_req_module.html)
  - `limit_req`

  [Rate Limiting with NGINX -- NGINX Community Blog](https://blog.nginx.org/blog/rate-limiting-nginx)

[Limiting Access to Proxied HTTP Resources | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/security-controls/controlling-access-proxied-http/)

[How to Limit Network Bandwidth in NGINX Web Server](https://www.tecmint.com/nginx-bandwidth-limit/)

[Nginx - 限制并发、限制访问速率、限制流量 - hukey - 博客园](https://www.cnblogs.com/hukey/p/10498544.html#4.%20limit_rate%20%E6%A0%B9%E6%8D%AE%20ip%20%E9%99%90%E5%88%B6%E6%B5%81%E9%87%8F)

[Nginx 中的两种限流方式|nginx, limit\_req,limit\_conn,白名单|cyj](https://chenyongjun.vip/articles/81)

- [traffic-accounting-nginx-module: Monitor the incoming and outgoing traffic metrics in realtime for NGINX](https://github.com/Lax/traffic-accounting-nginx-module)
  - [dvershinin/traffic-accounting-nginx-module: Monitor the incoming and outgoing traffic metrics in realtime for NGINX](https://github.com/dvershinin/traffic-accounting-nginx-module/tree/master)
- [bigplum/Nginx-limit-traffic-rate-module: Limiting rate by given variables(like $request\_uri, $remote\_addr, etc..).](https://github.com/bigplum/Nginx-limit-traffic-rate-module) (discontinued)

  > Limit_traffic_rate module provides a method to limit the total download rate by client IP or download URL, even there are several connections.