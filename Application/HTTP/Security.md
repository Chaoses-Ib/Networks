# HTTP Security
## [→Authentication](https://github.com/Chaoses-Ib/InformationSecurity/tree/main/Access%20Control/Authentication/Tokens#http-basic-authentication)

## Cookies
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies)

```http
Set-Cookie: <cookie-name>=<cookie-value>
```
e.g.
```http
HTTP/2.0 200 OK
Content-Type: text/html
Set-Cookie: yummy_cookie=choco
Set-Cookie: tasty_cookie=strawberry

[page content]
```
```http
GET /sample_page.html HTTP/2.0
Host: www.example.org
Cookie: yummy_cookie=choco; tasty_cookie=strawberry
```

Cookies are mainly used for three purposes:
- **Session management**: User sign-in status, shopping cart contents, game scores, or any other user session-related details that the server needs to remember.
- **Personalization**: User preferences such as display language and UI theme.
- **Tracking**: Recording and analyzing user behavior.

Cookies vs local storage:
- Local storage 没法实现禁止 JS 访问、失效、静态资源鉴权、跨域这些，虽然不用处理 cookies 跨端口的坑了

- Cookies can be `HttpOnly` and `Secure`

- Cookies can be used on requests issued by browsers instead of JS
  - 图片鉴权

- Cookies cannot be bound to a port, while local storage must be bound to a port.
  - `token{port}`
  
  [security - Are HTTP cookies port specific? - Stack Overflow](https://stackoverflow.com/questions/1612177/are-http-cookies-port-specific)

  [Cookies, Ports and Subdomains | Node Security](https://node-security.com/posts/cookies-ports-and-subdomains/)

  [Cannot run two applications on localhost (with different ports) in same browser - Issue #17593 - vaadin/flow](https://github.com/vaadin/flow/issues/17593)

  [google chrome - How to keep logged in on both web:ports? - Super User](https://superuser.com/questions/1684899/how-to-keep-logged-in-on-both-webports)

  [469287 - Cookies security problem: same domain but different ports](https://bugzilla.mozilla.org/show_bug.cgi?id=469287)

  [Cookies are not set when port differs on the same domain - Issue #199 - JakeChampion/fetch](https://github.com/JakeChampion/fetch/issues/199)

- Local storage cannot cross origin

  [javascript - Use localStorage across subdomains - Stack Overflow](https://stackoverflow.com/questions/4026479/use-localstorage-across-subdomains)

  [javascript - How to share localstorage among different subdomains? - Stack Overflow](https://stackoverflow.com/questions/59997063/how-to-share-localstorage-among-different-subdomains)

- Local storage can only be deleted by JS
  - Or [`sessionStorage`](https://developer.mozilla.org/en-US/docs/Web/API/Window/sessionStorage)

    > Opening a page in a new tab or window creates a new session with the value of the top-level browsing context, which differs from how session cookies work.

    [javascript - browser sessionStorage. share between tabs? - Stack Overflow](https://stackoverflow.com/questions/20325763/browser-sessionstorage-share-between-tabs)

[Cookies vs local storage - what to use when?](https://punits.dev/jargon-free-intros/cookies-vs-local-storage/) ([r/webdev](https://www.reddit.com/r/webdev/comments/12ipjr5/cookies_vs_local_storage_what_to_use_when/))

[html - Local Storage vs Cookies - Stack Overflow](https://stackoverflow.com/questions/3220660/local-storage-vs-cookies)

Discussions:
- 2020-07 [现在还有用 cookies 吗 - V2EX](https://v2ex.com/t/692155)
- 2023-11 [Are cookies really safer than local/session storage? : r/webdev](https://www.reddit.com/r/webdev/comments/17shju0/are_cookies_really_safer_than_localsession_storage/)

### Sites
- Site: protocol + effective top-level domain
  - `Strict`: Must be the same site
  - `Lax`: `GET` + user interaction
  - `None`

    [Get Ready for New `SameSite=None; Secure` Cookie Settings  |  Google Search Central Blog  |  Google for Developers](https://developers.google.com/search/blog/2020/01/get-ready-for-new-samesitenone-secure)
    - HTTPS

  [Bypassing SameSite cookie restrictions | Web Security Academy](https://portswigger.net/web-security/csrf/bypassing-samesite-restrictions)

- [`XMLHttpRequest.withCredentials`](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/withCredentials)

  `withCredentials` indicates whether or not cross-site `Access-Control` requests should be made using credentials. `false` by default.
  - This never affects same-origin requests.

  Does `withCredentials` affect cross-origin requests or just cross-site requests?
  - [XMLHttpRequest withCredentials option has an impact on same-site/cross-origin requests - Issue #20441 - mdn/content](https://github.com/mdn/content/issues/20441)
    - [fix: update XmlHttpRequest withCredentials documentation by AtofStryker - Pull Request #20486 - mdn/content](https://github.com/mdn/content/pull/20486)
  - [cookies - why is XMLHttpRequest.withCredentials necessary even for same site Ajax requests - Stack Overflow](https://stackoverflow.com/questions/40725317/why-is-xmlhttprequest-withcredentials-necessary-even-for-same-site-ajax-requests)

  [javascript - Cookies are not included when using withCredentials in XMLHttpRequest - Stack Overflow](https://stackoverflow.com/questions/57289396/cookies-are-not-included-when-using-withcredentials-in-xmlhttprequest)

  [674397 - XMLHttpRequest does not send Cookie: header even when withCredentials = true \[CORS\]](https://bugzilla.mozilla.org/show_bug.cgi?id=674397)

  [Cross-origin XMLHTTPRequest.withCredentials = false without CORS?](https://groups.google.com/a/chromium.org/g/chromium-discuss/c/uT3lYl7CAC0)

- Axios: [`withCredentials`](https://axios-http.com/docs/req_config)

  [Make Axios send cookies in its requests automatically - Stack Overflow](https://stackoverflow.com/questions/43002444/make-axios-send-cookies-in-its-requests-automatically)

  [Cookie not set when localhost web app accesses remote API - Stack Overflow](https://stackoverflow.com/questions/56372570/cookie-not-set-when-localhost-web-app-accesses-remote-api)

  [Can not send cookie back from client, tried many ways - Issue #4907 - axios/axios](https://github.com/axios/axios/issues/4907)

[Ajax Battle: XMLHttpRequest vs. the Fetch API | Hacker News](https://news.ycombinator.com/item?id=31084264)

See also [CORS](#cross-origin-resource-sharing-cors).

### Domains
- `Domain`
- `HostOnly`

[Transform P3 P4 P5 vulnerabilities to P1 | Centre d'expertises en cybersécurité](https://www.acceis.fr/transform-p3-p4-p5-vulnerabilities-to-p1/)

### Libraries
- [cookie-rs: HTTP cookie parsing and cookie jar management for Rust.](https://github.com/rwf2/cookie-rs)
  - [`split_parse()`](https://docs.rs/cookie/latest/cookie/struct.Cookie.html#method.split_parse)
  - [axum\_extra::extract::cookie - Rust](https://docs.rs/axum-extra/latest/axum_extra/extract/cookie/index.html)
    - [`from_headers()`](https://docs.rs/axum-extra/latest/axum_extra/extract/cookie/struct.CookieJar.html#method.from_headers)
- [biscotti: A Rust library for managing HTTP cookies.](https://github.com/LukeMathWalker/biscotti)

  [biscotti, a new crate for HTTP cookies | Luca Palmieri](https://www.lpalmieri.com/posts/biscotti-http-cookies-in-rust/) ([r/rust](https://www.reddit.com/r/rust/comments/1bb7vtm/biscotti_a_new_crate_for_http_cookies/))
- [cookie\_store: An implementation of RFC6265](https://github.com/pfernie/cookie_store)

### Web browsers
`HttpOnly`:
- Server redirection
  - Tight coupling with routing
  - Not pure static anymore

- Request
  - Block page rendering

- Set another cookie
  - By client
    - Tight coupling with cookie expiration config
  - By server

  Same site different port problem

- Try to override cookie

Discussions:
- [Check if httponly cookie exists in Javascript - Stack Overflow](https://stackoverflow.com/questions/9353630/check-if-httponly-cookie-exists-in-javascript)
- [How to check for user authentication when using httponly session-cookies : r/vuejs](https://www.reddit.com/r/vuejs/comments/w3j3me/how_to_check_for_user_authentication_when_using/)

[Clearing all cookies with JavaScript - Stack Overflow](https://stackoverflow.com/questions/179355/clearing-all-cookies-with-javascript)

Browsers:
- Edge: `edge://settings/siteData`

某些网站的 cookies 可高达几百 MB。

## Cross-Origin Resource Sharing (CORS)
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS)

- Origin: protocol + domain + port
- Site: protocol + effective top-level domain

[小 Tips：Chrome 91 版本 Cookie Same-Site 前端本地开发解决方案 - Issue #11 - jecyu/naluduo233.github.io](https://github.com/jecyu/naluduo233.github.io/issues/11)

Headers:
- [Access-Control-Allow-Origin](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Origin)

  > For requests *without credentials*, the literal value "`*`" can be specified as a wildcard; the value tells browsers to allow requesting code from any origin to access the resource. Attempting to use the wildcard with credentials [results in an error](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors/CORSNotSupportingCredentials).

- [Access-Control-Allow-Headers](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Access-Control-Allow-Headers)

  > The value "`*`" only counts as a special wildcard value for requests without credentials (requests without HTTP cookies or HTTP authentication information). In requests with credentials, it is treated as the literal header name "`*`" without special semantics. Note that the [`Authorization`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Authorization) header can't be wildcarded and always needs to be listed explicitly.

Proxies:
- Vite: [`server.proxy`](https://vitejs.dev/config/server-options#server-proxy)
- Nginx
  ```nginx
  proxy_hide_header 'Access-Control-Allow-Origin';
  if ($http_origin ~* (https?://localhost(:[0-9]+)?)) {
      add_header 'Access-Control-Allow-Origin' $http_origin;
      add_header 'Access-Control-Allow-Methods' 'GET,POST,OPTIONS,PUT,DELETE,PATCH';
      add_header 'Access-Control-Allow-Headers' 'Authorization,Accept,Origin,DNT,X-CustomHeader,Keep-Alive,User-Agent,X-Requested-With,If-Modified-Since,Cache-Control,Content-Type,Content-Range,Range';
      add_header 'Access-Control-Allow-Credentials' 'true';
  }
  ```
  [How to enable CORS in Nginx proxy server? - Stack Overflow](https://stackoverflow.com/questions/45986631/how-to-enable-cors-in-nginx-proxy-server)

axum: [tower\_http::cors](https://docs.rs/tower-http/0.5.2/tower_http/cors/index.html)
- ~~[Support for CORS preflight requests - Issue #106 - tokio-rs/axum](https://github.com/tokio-rs/axum/issues/106)~~
- [Axum router rejecting CORS OPTIONS preflight with 405 even with CorsLayer - Stack Overflow](https://stackoverflow.com/questions/73498537/axum-router-rejecting-cors-options-preflight-with-405-even-with-corslayer)

[有 CORS 还需要 CSRF token 吗？ - V2EX](https://www.v2ex.com/t/1054508)