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

[h5bp/server-configs-nginx: Nginx HTTP server boilerplate configs](https://github.com/h5bp/server-configs-nginx)

[Migrating from IIS to Nginx | Murray's Blog](https://blog.ligos.net/2019-03-09/Migrating-From-IIS-to-Nginx.html)

## Build
[Building nginx from Sources](https://nginx.org/en/docs/configure.html)
- `This module is not built by default.` *27

  Even `ngx_http_ssl_module`...

[ci-self-hosted/.github/workflows/nginx-buildbot.yml at main - nginx/ci-self-hosted](https://github.com/nginx/ci-self-hosted/blob/main/.github/workflows/nginx-buildbot.yml)
- Self-host, many local dependencies, unreproducible
  - `shell: C:\Tools\msys64\msys2_shell.cmd -defterm -no-start -where . -full-path -shell bash.exe -Eeo pipefail -x '{0}'`
  - `mkdir C:/TEMP/`: `mkdir: cannot create directory 'C:/TEMP/': File exists`
  - `auto/configure: No such file or directory`
  - ...

[linux - Cross compiling nginx-1.0.11 - Stack Overflow](https://stackoverflow.com/questions/8922311/cross-compiling-nginx-1-0-11)

[nginxinc/docker-nginx: Official NGINX Dockerfiles](https://github.com/nginxinc/docker-nginx)

[jirutka/nginx-binaries: Nginx and njs binaries for Linux (x86\_64, aarch64, ppc64le), macOS and Windows. Linux binaries are static so works on every Linux.](https://github.com/jirutka/nginx-binaries)
- Windows: myfreeer/nginx-build-msys2

Windows:
```sh
nginx version: nginx/1.27.2
built by cl 16.00.30319.01 for 80x86
built with OpenSSL 3.0.15 3 Sep 2024
TLS SNI support enabled
configure arguments: --with-cc=cl --builddir=objs.msvc8 --with-debug --prefix= --conf-path=conf/nginx.conf --pid-path=logs/nginx.pid --http-log-path=logs/access.log --error-log-path=logs/error.log --sbin-path=nginx.exe --http-client-body-temp-path=temp/client_body_temp --http-proxy-temp-path=temp/proxy_temp --http-fastcgi-temp-path=temp/fastcgi_temp --http-scgi-temp-path=temp/scgi_temp --http-uwsgi-temp-path=temp/uwsgi_temp --with-cc-opt=-DFD_SETSIZE=1024 --with-pcre=objs.msvc8/lib/pcre2-10.39 --with-zlib=objs.msvc8/lib/zlib-1.3.1 --with-http_v2_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_stub_status_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_auth_request_module --with-http_random_index_module --with-http_secure_link_module --with-http_slice_module --with-mail --with-stream --with-stream_realip_module --with-stream_ssl_preread_module --with-openssl=objs.msvc8/lib/openssl-3.0.15 --with-openssl-opt='no-asm no-tests -D_WIN32_WINNT=0x0501' --with-http_ssl_module --with-mail_ssl_module --with-stream_ssl_module
```
- [Building nginx on the Win32 platform with Visual C](https://nginx.org/en/docs/howto_build_on_win32.html)
- [Building nginx with addtional modules on Windows](https://gist.github.com/sweetlilmre/43b0c05e17f9fb0aacab0381d1db0fe7)
- [myfreeer/nginx-build-msys2](https://github.com/myfreeer/nginx-build-msys2)
  - AppVeyor
- `nginx windows pcre zlib openssl configure language:yaml`

## Distributions
- Ubuntu
  ```sh
  nginx version: nginx/1.18.0 (Ubuntu)
  built with OpenSSL 3.0.2 15 Mar 2022
  TLS SNI support enabled
  configure arguments: --with-cc-opt='-g -O2 -ffile-prefix-map=/build/nginx-dSlJVq/nginx-1.18.0=. -flto=auto -ffat-lto-objects -flto=auto -ffat-lto-objects -fstack-protector-strong -Wformat -Werror=format-security -fPIC -Wdate-time -D_FORTIFY_SOURCE=2' --with-ld-opt='-Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects -flto=auto -Wl,-z,relro -Wl,-z,now -fPIC' --prefix=/usr/share/nginx --conf-path=/etc/nginx/nginx.conf --http-log-path=/var/log/nginx/access.log --error-log-path=/var/log/nginx/error.log --lock-path=/var/lock/nginx.lock --pid-path=/run/nginx.pid --modules-path=/usr/lib/nginx/modules --http-client-body-temp-path=/var/lib/nginx/body --http-fastcgi-temp-path=/var/lib/nginx/fastcgi --http-proxy-temp-path=/var/lib/nginx/proxy --http-scgi-temp-path=/var/lib/nginx/scgi --http-uwsgi-temp-path=/var/lib/nginx/uwsgi --with-compat --with-debug --with-pcre-jit --with-http_ssl_module --with-http_stub_status_module --with-http_realip_module --with-http_auth_request_module --with-http_v2_module --with-http_dav_module --with-http_slice_module --with-threads --add-dynamic-module=/build/nginx-dSlJVq/nginx-1.18.0/debian/modules/http-geoip2 --with-http_addition_module --with-http_gunzip_module --with-http_gzip_static_module --with-http_sub_module
  ```
  - Default paths require root permissions
    - `--conf-path=/etc/nginx/nginx.conf`
    - `--prefix=/usr/share/nginx`
    - `--modules-path=/usr/lib/nginx/modules`
    - `--http-log-path=/var/log/nginx/access.log`
    - `--error-log-path=/var/log/nginx/error.log`
    - `--lock-path=/var/lock/nginx.lock`
    - `--pid-path=/run/nginx.pid`
    - `--http-client-body-temp-path=/var/lib/nginx/body`
    - `--http-fastcgi-temp-path=/var/lib/nginx/fastcgi`
    - `--http-proxy-temp-path=/var/lib/nginx/proxy`
    - `--http-scgi-temp-path=/var/lib/nginx/scgi`
    - `--http-uwsgi-temp-path=/var/lib/nginx/uwsgi`

- [The Tengine Web Server](https://tengine.taobao.org/)
  - HTTP/3: [→ngx\_http\_xquic\_module](../../HTTP3.md#nginx)
  - XUDP: [mod_xudp](https://tengine.taobao.org/document_cn/xudp_cn.html)
  - 异步打印日志及自动回滚: [ngx_log_pipe](https://tengine.taobao.org/document_cn/ngx_log_pipe_cn.html)
  - [本地DNS缓存](https://tengine.taobao.org/document_cn/core_cn.html)
  - [ngx\_http\_limit\_req\_module](https://tengine.taobao.org/document_cn/http_limit_req_cn.html)
  - Tengine-Ingress: 配置动态无损生效
  - 部分文档只有中文
  - 阿里云 CDN

  [编译和安装](https://tengine.taobao.org/document_cn/install_cn.html)

- [nginx-rtmp-module: NGINX-based Media Streaming Server](https://github.com/arut/nginx-rtmp-module)
  - GitHub CI/CD: [elijahr2411/nginx-rtmp-module](https://github.com/elijahr2411/nginx-rtmp-module)

- [Zestginx: A modern, performant, and secure NGINX distribution packed with features.](https://github.com/ZestProjects/zestginx) (discontinued)

  > Some, but not all, of Zestginx's improvements over NGINX include:
  > 
  > - Dynamic Record Sizing for SSL/TLS.
  > - HTTP/2 HPACK Compression
  > - HTTP/3 support via Quiche.
  > - IO\_Uring as the AIO backend.
  > - OCSP support for BoringSSL.
  > - Quiet handshake rejection for SNI mismatches.
  > 
  > As well as the above, Zestginx's prebuilds come with a few other changes such as:
  > 
  > - Brotli compression support for NGINX.
  > - Cloudflare's Zlib for faster GZip.
  > - PCRE JIT for improved RegEx performance.
  > - ZStandard compression support for NGINX.
  > 
  > Zestginx's wiki also contains suggestions for your NGINX configuration.

## Windows
[nginx for Windows](https://nginx.org/en/docs/windows.html)

- > Only the `select()` and `poll()` (1.15.9) connection processing methods are currently used, so high performance and scalability should not be expected.
  - [hello, nginx for windows problem with multithreading : r/nginx](https://www.reddit.com/r/nginx/comments/1adqgmw/hello_nginx_for_windows_problem_with/)
- > The UDP proxy functionality is not supported.

  [dns - Error `nginx: [emerg] invalid parameter "udp" in /etc/nginx/sites-enabled/proxy` - Stack Overflow](https://stackoverflow.com/questions/74786396/error-nginx-emerg-invalid-parameter-udp-in-etc-nginx-sites-enabled-proxy)
- > nginx/Windows uses the directory where it has been run as the prefix for relative paths in the configuration.

[Installing Nginx on Windows --- A Step-by-Step Guide | by Chandramathi Muthuraj | Medium](https://medium.com/@chandramuthuraj/installing-nginx-on-windows-a-step-by-step-guide-6750575c63e2)

`scoop install nginx`

4.5 MiB.
- LZMA2: 1.26 MiB

Distributions:
- Kitty: [nginx for Windows](http://nginx-win.ecsds.eu/)
- Kevin Worthington: [Nginx for Windows - 32-bit and 64-bit - free, easy-to-use setup packages](https://kevinworthington.com/nginx-for-windows/)

Services:
- [winginx: Nginx installer and service behaviour for windows.](https://github.com/InvGate/winginx)
- [xiangyuecn/Nginx-Windows-Service-Manager: Nginx Windows服务安装和管理器](https://github.com/xiangyuecn/Nginx-Windows-Service-Manager)

## CLI
[Command-line parameters](https://nginx.org/en/docs/switches.html)

[Controlling NGINX Processes at Runtime | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/basic-functionality/runtime-control/)

[Controlling nginx](https://nginx.org/en/docs/control.html)

On Windows, Nginx can start multiple instances, but `quit` can only quit the last instance.

[nginx-ext: Rest Api to manage Nginx Remotly with configuration consistency check](https://github.com/MyJetTools/nginx-ext)

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
  - [ilya-epifanov/nginx-config](https://github.com/ilya-epifanov/nginx-config)
  - [nginx-config-mod: A command-line utility and a rust library to validate and make certain tweaks/rewrites of nginx configs](https://github.com/tailhook/nginx-config-mod) (discontinued)
- [rust-nginx-config-parser: Config parser for the nginx config format written in Rust](https://github.com/daniel1302/rust-nginx-config-parser)
- [webserver-config: A Rust crate for generating configuration files for web servers.](https://git.codespace.cz/oohost/webserver-config)
- [etcd-nginx: Reads values from Etcd and generates nginx conf files.](https://github.com/tolerable-tech/etcd-nginx)

Nginx 不肯加强对变量的支持，导致盛行使用第三方工具生成配置。

Ubuntu:
```nginx
user www-data;
worker_processes auto;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;

events {
        worker_connections 768;
        # multi_accept on;
}

http {

        ##
        # Basic Settings
        ##

        sendfile on;
        tcp_nopush on;
        types_hash_max_size 2048;
        # server_tokens off;

        # server_names_hash_bucket_size 64;
        # server_name_in_redirect off;

        include /etc/nginx/mime.types;
        default_type application/octet-stream;

        ##
        # SSL Settings
        ##

        ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3; # Dropping SSLv3, ref: POODLE
        ssl_prefer_server_ciphers on;

        ##
        # Logging Settings
        ##

        access_log /var/log/nginx/access.log;
        error_log /var/log/nginx/error.log;

        ##
        # Gzip Settings
        ##

        gzip on;

        # gzip_vary on;
        # gzip_proxied any;
        # gzip_comp_level 6;
        # gzip_buffers 16 8k;
        # gzip_http_version 1.1;
        # gzip_types text/plain text/css application/json application/javascript text/xml application/xml application/xml+rss text/javascript;

        ##
        # Virtual Host Configs
        ##

        include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/sites-enabled/*;
}


#mail {
#       # See sample authentication script at:
#       # http://wiki.nginx.org/ImapAuthenticateWithApachePhpScript
#
#       # auth_http localhost/auth.php;
#       # pop3_capabilities "TOP" "USER";
#       # imap_capabilities "IMAP4rev1" "UIDPLUS";
#
#       server {
#               listen     localhost:110;
#               protocol   pop3;
#               proxy      on;
#       }
#
#       server {
#               listen     localhost:143;
#               protocol   imap;
#               proxy      on;
#       }
#}
```

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

### Inheritance
[Understanding the Nginx Configuration Inheritance Model](https://blog.martinfjordvald.com/understanding-the-nginx-configuration-inheritance-model/)
> The behaviour of an array directive is that if you define multiple directives in the same context you will add to the values, but if you define multiple directives in different contexts then the lower context will replace the higher context ones. This means that you need to sometimes double define a value if you want it present in multiple context.

> Action directives are where it starts to get interesting. They are confined to one context and will never inherit downwards, they can however be specified in multiple contexts and in some cases will be executed for each context. The rewrite directive is an action directive that is allowed in server and location context where both contexts might be executed.
>
> Naturally, it’s not quite that simple. Within locations there are three possible contexts, a nested location, an if and limit_except. The behaviour of a directive is actually entirely up to the module that defines it. All the normal and array directives will inherit properly if they are allowed in that context. For action directives the story is a bit different. Generally they will not inherit into a nested location but it ultimately depends on how the module wants it to be and it can differ on a directive by directive basis. The nginx documentation is not of use here either so you’ll have to just try it and see if nginx complains.

> The `try_files` directive is mostly like every other action directive mentioned above, the difference is that if placed in server context nginx actually creates a pseudo-location that is the least specific location possible. That means if a request matches a defined location the `try_files` directive will not be executed. This means that if you have location / defined then you have a location that matches every possible request and as such `try_files` will never actually execution. Therefore always place `try_files` in location context instead of server context if at all possible.

- Nested locations

  [Nested locations in nginx - Stack Overflow](https://stackoverflow.com/questions/34839823/nested-locations-in-nginx)
  > The inner URLs are not relative to the outer URLs

  [Nested Nginx location (prefix blocks in regex blocks) not working - Server Fault](https://serverfault.com/questions/496371/nested-nginx-location-prefix-blocks-in-regex-blocks-not-working)

  [proxy\_pass & nested locations block : r/nginx](https://www.reddit.com/r/nginx/comments/7qck7g/proxy_pass_nested_locations_block/)

  [configuration - Nginx Nested Location Priority - Stack Overflow](https://stackoverflow.com/questions/74140437/nginx-nested-location-priority)

## [ngx_core_module](https://nginx.org/en/docs/ngx_core_module.html)
- `daemon`

  [webserver - What is the difference between nginx daemon on/off option? - Stack Overflow](https://stackoverflow.com/questions/25970711/what-is-the-difference-between-nginx-daemon-on-off-option)

  `off` on Windows.

- [`include`](https://nginx.org/en/docs/ngx_core_module.html#include)

## HTTP
### [ngx_http_core_module](https://nginx.org/en/docs/http/ngx_http_core_module.html)
- [`location`](https://nginx.org/en/docs/http/ngx_http_core_module.html#location)
  - Regex or prefix (default)
  - Exact matching: `=`

    e.g. `location = /abc`
  
    [Nginx location matches - Stack Overflow](https://stackoverflow.com/questions/5239131/nginx-location-matches)
  - Regex: `~` (partial match)
  - Regex i: `~*`
  - Prefix (block regex): `^~`

  > The matching is performed against a normalized URI, after decoding the text encoded in the "`%XX`" form, resolving references to relative path components "`.`" and "`..`", and possible [compression](https://nginx.org/en/docs/http/ngx_http_core_module.html#merge_slashes) of two or more adjacent slashes into a single slash.

  [Guide on how to use regex in Nginx location block section? - Stack Overflow](https://stackoverflow.com/questions/59846238/guide-on-how-to-use-regex-in-nginx-location-block-section)

- Trailing slashes

  > If a location is defined by a prefix string that ends with the slash character, and requests are processed by one of [proxy\_pass](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass), [fastcgi\_pass](https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_pass), [uwsgi\_pass](https://nginx.org/en/docs/http/ngx_http_uwsgi_module.html#uwsgi_pass), [scgi\_pass](https://nginx.org/en/docs/http/ngx_http_scgi_module.html#scgi_pass), [memcached\_pass](https://nginx.org/en/docs/http/ngx_http_memcached_module.html#memcached_pass), or [grpc\_pass](https://nginx.org/en/docs/http/ngx_http_grpc_module.html#grpc_pass), then the special processing is performed. In response to a request with URI equal to this string, but without the trailing slash, a permanent redirect with the code 301 will be returned to the requested URI with the slash appended. If this is not desired, an exact match of the URI and location could be defined like this:
  ```nginx
  location /user/ {
      proxy_pass http://user.example.com;
  }

  location = /user {
      proxy_pass http://login.example.com;
  }
  ```

  [proxy - using trailing slashes in nginx configuration - Server Fault](https://serverfault.com/questions/607615/using-trailing-slashes-in-nginx-configuration)

  [Nginx trailing slash in proxy pass url - Stack Overflow](https://stackoverflow.com/questions/22759345/nginx-trailing-slash-in-proxy-pass-url)
  > As stated in [nginx documentation](http://nginx.org/r/proxy_pass) if `proxy_pass` used without URI (i.e. without path after server:port) nginx will put URI from original request exactly as it was with all double slashes, `../` and so on.

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

- [`try_files`](https://nginx.org/en/docs/http/ngx_http_core_module.html#try_files)

  > If none of the files were found, an internal redirect to the `uri` specified in the last parameter is made.

  SPA:
  ```nginx
  location / {
    try_files $uri $uri/ /index.html;
  }
  ```
  
  Mixed-page app: `/sub/index.html $uri`

  [Nginx "invalid number of arguments in `try_files` directive..." for PHP security - Stack Overflow](https://stackoverflow.com/questions/17349616/nginx-invalid-number-of-arguments-in-try-files-directive-for-php-security)

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

  [reverse proxy - How can I get nginx not to override x-forwarded-for when proxying? - Server Fault](https://serverfault.com/questions/1090749/how-can-i-get-nginx-not-to-override-x-forwarded-for-when-proxying)

- Connections

  [http - Why does nginx `proxy_pass` close my connection? - Stack Overflow](https://stackoverflow.com/questions/46771389/why-does-nginx-proxy-pass-close-my-connection)

- Buffering
  - [`proxy_buffering off;`](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_buffering)
  - `X-Accel-Buffering: no`

    Although this looks good for decoupling, things become shitty when multiple reverse proxying are present. Would you rather pass `X-Accel-Buffering` to every proxy and cost some traffic, or just set `proxy_buffering off;` for every endpoint in the config?

    - `proxy_pass_header X-Accel-Buffering;`

      [How to turn off buffering on Nginx Server for Server sent event - Stack Overflow](https://stackoverflow.com/questions/61029079/how-to-turn-off-buffering-on-nginx-server-for-server-sent-event)

    [SSE response taking a long time - IE, what am I doing wrong? - tokio-rs/axum - Discussion #2694](https://github.com/tokio-rs/axum/discussions/2694)

- Headers
  - [`proxy_pass_request_headers`](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass_request_headers)
    - Default `on`

    [Forward request headers from nginx proxy server - Stack Overflow](https://stackoverflow.com/questions/19751313/forward-request-headers-from-nginx-proxy-server)
  - [`proxy_pass_header`](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_pass_header)
  - [`proxy_set_header`](https://nginx.org/en/docs/http/ngx_http_proxy_module.html#proxy_set_header)
  - [`add_header`](https://nginx.org/en/docs/http/ngx_http_headers_module.html)
  - How to pass or set a header, or, set the default value for a header?
    - Different locations, e.g. `/intra/`
    - Inheritance?

      [Adding and using header (HTTP) in nginx - Stack Overflow](https://stackoverflow.com/questions/11973047/adding-and-using-header-http-in-nginx)

[Nginx: reverse proxy passing client IP to the server - Server Fault](https://serverfault.com/questions/920030/nginx-reverse-proxy-passing-client-ip-to-the-server)

### [ngx_http_realip_module](https://nginx.org/en/docs/http/ngx_http_realip_module.html)
> This module is not built by default, it should be enabled with the `--with-http_realip_module` configuration parameter.

```nginx
set_real_ip_from  192.168.1.0/24;
set_real_ip_from  192.168.2.1;
set_real_ip_from  2001:0db8::/32;
real_ip_header    X-Forwarded-For;
real_ip_recursive on;
```

- `set_real_ip_from address | CIDR | unix:;` 

- `geo` also has a `proxy` parameter

[http headers - NGinx `$proxy_add_x_forwarded_for` and `real_ip_header` - Stack Overflow](https://stackoverflow.com/questions/29279084/nginx-proxy-add-x-forwarded-for-and-real-ip-header)

### [ngx_http_geo_module](https://nginx.org/en/docs/http/ngx_http_geo_module.html)
> The `ngx_http_geo_module` module creates variables with values depending on the client IP address.

### [→HTTP/2](../../HTTP2.md#nginx)

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
- [`user`](https://nginx.org/en/docs/ngx_core_module.html#user)

  Default: `user nobody nobody;`

  [linux - Nginx displaying failed (13: Permission denied) when trying to access new site - Server Fault](https://serverfault.com/questions/947301/nginx-displaying-failed-13-permission-denied-when-trying-to-access-new-site)

- `Server: nginx/1.27.0`
- [ngx\_waf: Handy, High performance, ModSecurity compatible Nginx firewall module & 方便、高性能、兼容 ModSecurity 的 Nginx 防火墙模块](https://github.com/ADD-SP/ngx_waf)

### Auth
- [→HTTP Basic Authentication](https://github.com/Chaoses-Ib/InformationSecurity/blob/main/Access%20Control/Authentication/Tokens/Basic.md#servers)
- [`ngx_http_auth_request_module`](https://nginx.org/en/docs/http/ngx_http_auth_request_module.html)
  - 2xx
  - 401/403
  ```nginx
  location = /auth {
      proxy_pass http://127.0.0.1:8080;
      proxy_pass_request_body off;
      proxy_set_header Content-Length "";
      proxy_set_header X-Original-URI $request_uri;

      proxy_set_header X-Real-IP $remote_addr;
  }

  location /private/ {
      auth_request /auth;
      ...
  }
  ```
  [I wish there were better authentication options with Nginx. The ngx\_http\_auth\_re... | Hacker News](https://news.ycombinator.com/item?id=7641148)

  [`ngx_http_auth_request_module`: log](https://mdounin.ru/hg/ngx_http_auth_request_module/)

  ~~[authentication - nginx `auth_request` with cookie - Stack Overflow](https://stackoverflow.com/questions/55751365/nginx-auth-request-with-cookie)~~
- [spnego-http-auth-nginx-module: SPNEGO HTTP Authentication Module for nginx](https://github.com/stnoonan/spnego-http-auth-nginx-module)
- njs
- lua
- TLS

  [Client-Side Certificate Authentication with nginx | fardog.io](https://fardog.io/blog/2017/12/30/client-side-certificate-authentication-with-nginx/)
- Cookies

  [Cookie-based authentication with nginx](https://gist.github.com/rnorth/2031652)
- [JWT](https://github.com/Chaoses-Ib/InformationSecurity/blob/main/Access%20Control/Authentication/Tokens/JSON%20Web.md) (Plus)

[ways of authentication with Nginx - Stack Overflow](https://stackoverflow.com/questions/72434853/ways-of-authentication-with-nginx)

### HTTPS
[Module ngx\_http\_ssl\_module](https://nginx.org/en/docs/http/ngx_http_ssl_module.html)

[Configuring HTTPS servers](https://nginx.org/en/docs/http/configuring_https_servers.html)

```nginx
worker_processes auto;

http {
    server {
        server_name         www.example.com;

        listen       80;
        listen       443 ssl;

        keepalive_timeout   70;

        ssl_certificate      www.example.com.crt.pem;
        ssl_certificate_key  www.example.com.key.pem;

        # ssl_protocols TLSv1 TLSv1.1 TLSv1.2 TLSv1.3;
        # ssl_ciphers  HIGH:!aNULL:!MD5;
        # ssl_prefer_server_ciphers  off;

        # Default: none
        ssl_session_cache    shared:SSL:10m;
        # Default: 5m
        ssl_session_timeout  10m;
    }
}
```

[nginx HTTPS serving with same config as HTTP - Server Fault](https://serverfault.com/questions/10854/nginx-https-serving-with-same-config-as-http)

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