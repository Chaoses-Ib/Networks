#import "@local/ib:0.1.0": *
#title[HTTP Cache]
#a-badge[https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/Caching]

#a[HTTP Caching Tests][https://cache-tests.fyi/]
#a-badge[https://github.com/http-tests/cache-tests]

Caching is hard.

= Heuristic caching
#q[
HTTP is designed to cache as much as possible, so even if no `Cache-Control` is given, responses will get stored and reused if certain conditions are met.
This is called *heuristic caching*.]

#q[
The freshness lifetime is calculated based on several headers.
- If a `Cache-control: max-age=N` header is specified, then the freshness lifetime is equal to `N`.
- If this header is not present, which is very often the case, it is checked if an `Expires` header is present.
  If an `Expires` header exists, then its value minus the value of the `Date` header determines the freshness lifetime.
- Finally, if neither header is present, look for a `Last-Modified` header.
  If this header is present, then the cache's freshness lifetime is equal to the value of the `Date` header minus the value of the `Last-modified` header divided by 10.
]
#footnote[#a[caching - What's default value of cache-control? - Stack Overflow][https://stackoverflow.com/questions/14496694/whats-default-value-of-cache-control]]

#q[Heuristic caching is a workaround that came before `Cache-Control` support became widely adopted, and basically all responses should explicitly specify a `Cache-Control` header.]

Use `Cache-Control: no-cache` (or `max-age=0`) to disable heuristic caching.

= `Cache-Control` header
#a-badge[https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control]

- `Cache-Control: no-cache` to cache but revalidate every time.

  However, some proxy servers will not cache at all with it,
  including Nginx, Caddy, HAProxy, Fastly, ATS, Varnish.
  For those `Cache-Control: max-age=1` (after 1s) can be used as a workaround.
  - For Nginx, `X-Accel-Expires: @1` (Unix epoch +1s) can also be used.

  /*
  However, `max-age=1` may instead make browsers not revalidate but just refresh the content, unlike `max-age=0`.
  - Adding `must-revalidate` may fix them, although this is not what it's intended for.
  */

  #q[It is often stated that the combination of `max-age=0` and `must-revalidate` has the same meaning as `no-cache`.]
  #footnote[#a[caching - Difference between `no-cache` and `must-revalidate` for Cache-Control? - Stack Overflow][https://stackoverflow.com/questions/18148884/difference-between-no-cache-and-must-revalidate-for-cache-control]]

- `private` for allowing private cache only, like content varying on `Cookie`.
- `public` (or `s-maxage`, `must-revalidate`) for allowing shared cache even with `Authorization`.

#a[This browser tweak saved 60% of requests to Facebook - Engineering at Meta][https://engineering.fb.com/2017/01/26/web/this-browser-tweak-saved-60-of-requests-to-facebook/]
- Chrome _used_ to revalidate content cached by `Cache-control` when refreshing.

  Firefox still does so unless `Cache-Control: immutable`,
  #footnote[#a[caching - Cache-control Immutable Header - Stack Overflow][https://stackoverflow.com/questions/61050144/cache-control-immutable-header]]
  which is only supported by Firefox on desktop and Safari.

= Revalidation
#a-badge[https://developer.mozilla.org/en-US/docs/Web/HTTP/Guides/Caching#validation]

#q[
Stale responses are not immediately discarded. HTTP has a mechanism to transform a stale response into a fresh one by asking the origin server.
This is called *validation*, or sometimes, *revalidation*.

Validation is done by using a *conditional request* that includes an `If-None-Match` (`ETag`)
or `If-Modified-Since` (`Last-Modified`) request header.
]

#q[RFC9110 prefers that servers send both `ETag` and `Last-Modified` for a `200` response if possible.
During cache revalidation, if both `If-Modified-Since` and `If-None-Match` are present, then `If-None-Match` takes precedence for the validator.
If you are only considering caching, you may think that `Last-Modified` is unnecessary.
However, `Last-Modified` is not just useful for caching; it is a standard HTTP header that is also used by content-management (CMS) systems to display the last-modified time, by crawlers to adjust crawl frequency, and for other various purposes.
So considering the overall HTTP ecosystem, it is better to provide both `ETag` and `Last-Modified`.]

= Web browsers
#a[Caching Demystified: Inspect, Clear, and Disable Caches  |  Blog  |  Chrome for Developers][https://developer.chrome.com/blog/devtools-tips-36]
- DevTools#footnote[Edge v146.0.3856.109]
  may show "Disable cache" unchecked but actually disable the cache... A check-and-uncheck can fix it.
- Overriding headers may change cache behavior in an unexpected way.
