# HTTP Libraries
## C++
- [Boost.Beast: HTTP and WebSocket built on Boost.Asio in C++11](https://github.com/boostorg/beast)
- [cpp-netlib: The C++ Network Library Project -- cross-platform, standards compliant networking library.](https://github.com/cpp-netlib/cpp-netlib)

## Python
### Clients
- [urllib.request: Extensible library for opening URLs](https://docs.python.org/3/library/urllib.request.html)

  > The `Requests` package is recommended for a higher-level HTTP client interface.

- [Requests: A simple, yet elegant, HTTP library.](https://github.com/psf/requests)

- [aiohttp: Asynchronous HTTP client/server framework for asyncio and Python](https://github.com/aio-libs/aiohttp)

  [The aiohttp Request Lifecycle](https://docs.aiohttp.org/en/latest/http_request_lifecycle.html)
  - `ClientSession` supports `base_url`, but only absolute URLs without path part are supported.
  - [Shouldn't `session.close()` be a sync function? - Issue #7118](https://github.com/aio-libs/aiohttp/issues/7118)

- [HTTPX: A next generation HTTP client for Python. 🦋](https://github.com/encode/httpx/)

[python - What are the differences between the urllib, urllib2, urllib3 and requests module? - Stack Overflow](https://stackoverflow.com/questions/2018026/what-are-the-differences-between-the-urllib-urllib2-urllib3-and-requests-modul)

[The best Python HTTP clients for 2022 | ScrapingBee](https://www.scrapingbee.com/blog/best-python-http-clients/#5-httpxhttpswwwpython-httpxorg)

[Comparing Python HTTP libraries - Request for Recommendations : Python](https://www.reddit.com/r/Python/comments/uehu09/comparing_python_http_libraries_request_for/)