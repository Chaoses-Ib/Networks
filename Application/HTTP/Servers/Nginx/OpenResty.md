# [OpenResty](https://openresty.org/)
[GitHub](https://github.com/openresty/openresty)

> A dynamic web platform based on NGINX and LuaJIT

[Pushing Nginx to its limit with Lua](https://blog.cloudflare.com/pushing-nginx-to-its-limit-with-lua)

- [openresty/patches](https://github.com/openresty/openresty/tree/master/patches)
- [lua-nginx-module: Embed the Power of Lua into NGINX HTTP servers](https://github.com/openresty/lua-nginx-module)

  > This module is a core component of OpenResty. If you are using this module, then you are essentially using OpenResty :)

  - [Directives](https://github.com/openresty/lua-nginx-module#directives)
  - Inheritance

    [nested `access_by_lua` - OpenResty Forum](https://forum.openresty.us/d/6009-c81bb4e7e1c309a5c3d90aae86c4f756)
    > `*_by_lua` directives cannot be nested or inherited. The location blocks themselves can be nested, and Lua directive handlers can be placed within these blocks, but only the most significant handler definition "wins" and executes.
    > 
    > Trying to "inherit" Lua code definitions sounds like a nightmare anyway ;) The best thing to do if you want some sort of inheritance might be to define the parent/base code (e.g. code that should execute every time in a server{} block) in a Lua module somewhere, and have each child handler (e.g. Lua code that should only run in certain location {} blocks) call that module before executing its own logic. YMMV based on use case, design, etc.
  - Debugging
    
    [debugging - How to debug lua code inside nginx config? - Stack Overflow](https://stackoverflow.com/questions/26189429/how-to-debug-lua-code-inside-nginx-config)
- [openresty/echo-nginx-module: An Nginx module for bringing the power of "echo", "sleep", "time" and more to Nginx's config file](https://github.com/openresty/echo-nginx-module)
- [openresty/opm: OpenResty Package Manager](https://github.com/openresty/opm)

[w3cschool-OpenResty 最佳实践Library - hanease - 博客园](https://www.cnblogs.com/hanease/p/16061539.html)

## Windows
[openresty/doc/README-windows.md at master - openresty/openresty](https://github.com/openresty/openresty/blob/master/doc/README-windows.md)

- ~~[LomoX-Offical/nginx-openresty-windows: nginx for windows with openresty](https://github.com/LomoX-Offical/nginx-openresty-windows)~~
  - IOCP
- `scoop install openresty`
- 46.4 MiB, LZMA2: 8.45 MiB
  - nginx.exe: 37.3 MiB
- Has x64 build
  - Much faster HTTPS? Also because of patches?
- Built with MSYS2 instead of MSVC (cl) 
- OpenSSL 1.1.1 instead of 3.0.15
- `--with-cc-opt='-O2 ...'`, `--with-pcre-jit`, `--with-openssl-opt=-g --with-pcre-opt=-g --with-zlib-opt=-g`
- Not `--with-debug`, `--with-http_slice_mo`
- `--with-select_mod`
- No mail modules: `-without-mail_pop3_mod`, `--without-mail_imap_module`, `--without-mail_smtp_module`
- Additional modules

```sh
nginx version: openresty/1.27.1.2
built by gcc 7.3.0 (Rev1, Built by MSYS2 project) 
built with OpenSSL 1.1.1w  11 Sep 2023
TLS SNI support enabled
configure arguments: --prefix=. --with-cc-opt='-O2 -DFD_SETSIZE=1024' --add-module=../ngx_devel_kit-0.3.3 --add-module=../echo-nginx-module-0.63 --add-module=../xss-nginx-module-0.06 --add-module=../ngx_coolkit-0.2 --add-module=../set-misc-nginx-module-0.33 --add-module=../form-input-nginx-module-0.12 --add-module=../encrypted-session-nginx-module-0.09 --add-module=../srcache-nginx-module-0.33 --add-module=../ngx_lua-0.10.28 --add-module=../ngx_lua_upstream-0.07 --add-module=../headers-more-nginx-module-0.37 --add-module=../array-var-nginx-module-0.06 --add-module=../memc-nginx-module-0.20 --add-module=../redis2-nginx-module-0.15 --add-module=../redis-nginx-module-0.3.9 --add-module=../ngx_stream_lua-0.0.16 --with-cc=gcc --sbin-path=nginx.exe --with-pcre-jit --with-ipv6 --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_v2_module --without-mail_pop3_module --without-mail_imap_module --without-mail_smtp_module --with-http_stub_status_module --with-http_realip_module --with-http_addition_module --with-http_auth_request_module --with-http_secure_link_module --with-http_random_index_module --with-http_gzip_static_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gunzip_module --with-select_module --with-pcre=/home/agentzh/work/openresty-1.27.1.2/objs/lib/pcre2-10.44 --with-zlib=/home/agentzh/work/openresty-1.27.1.2/objs/lib/zlib-1.3.1 --with-openssl=/home/agentzh/work/openresty-1.27.1.2/objs/lib/openssl-1.1.1w --with-openssl-opt=-g --with-pcre-opt=-g --with-zlib-opt=-g --with-stream --with-http_ssl_module
```

## Nginx Plus
[Lua | NGINX Documentation](https://docs.nginx.com/nginx/admin-guide/dynamic-modules/lua/)
