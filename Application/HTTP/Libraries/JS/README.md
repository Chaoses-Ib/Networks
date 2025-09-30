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

- URL
  - `baseURL`
    - `get('a', { baseURL: '' })`

    [javascript - Change the default base url for axios - Stack Overflow](https://stackoverflow.com/questions/47407564/change-the-default-base-url-for-axios)

- JSON
  
  [Why return the string and not the JS object if we know that the responseType is JSON? - Issue #6651 - axios/axios](https://github.com/axios/axios/issues/6651)

- [Progress capturing](https://github.com/axios/axios#-progress-capturing)
- [`byteOffset` and `byteLength` ignored on binary dataviews - Issue #4068](https://github.com/axios/axios/issues/4068)

  "We like and decide to keep this footgun."

  Workaround:
  - `originalArray.slice(a, b)`
  - `view.slice()`
  - `new Uint8Array(view)`

- [Interceptors](https://axios-http.com/docs/interceptors)

  [javascript - How to ignore interceptors in axios as a parameter? - Stack Overflow](https://stackoverflow.com/questions/63423209/how-to-ignore-interceptors-in-axios-as-a-parameter)

  [Can I skip axios interceptors.request ? - mswjs/msw - Discussion #1638](https://github.com/mswjs/msw/discussions/1638)
