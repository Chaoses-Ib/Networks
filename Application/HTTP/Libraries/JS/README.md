# JS
- [Axios](#axios)

## [Axios](https://github.com/axios/axios)
> Promise based HTTP client for the browser and node.js

- Features
  - Make [XMLHttpRequests](https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest) from the browser
  - Make [http](https://nodejs.org/api/http.html) requests from node.js
  - Supports the [Promise](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) API
  - Intercept request and response
  - Transform request and response data
  - Cancel requests
  - Automatic transforms for [JSON](https://www.json.org/json-en.html) data
  - Automatic data object serialization to `multipart/form-data` and `x-www-form-urlencoded` body encodings
  - Client side support for protecting against [XSRF](https://en.wikipedia.org/wiki/Cross-site_request_forgery)
- [Progress capturing](https://github.com/axios/axios#-progress-capturing)
- [`byteOffset` and `byteLength` ignored on binary dataviews - Issue #4068](https://github.com/axios/axios/issues/4068)

  "We like and decide to keep this footgun."

  Workaround:
  - `originalArray.slice(a, b)`
  - `view.slice()`
  - `new Uint8Array(view)`
