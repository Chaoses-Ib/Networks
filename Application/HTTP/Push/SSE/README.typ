#import "@local/ib:0.1.0": *
#show: ib
#title[Server-sent Events (SSE)]
= Clients
== Rust
- [ ] reqwest

  #a[SSE support - Issue \#1224][https://github.com/seanmonstar/reqwest/issues/1224]
  - #a[Support for EventSource - Issue \#2677][https://github.com/seanmonstar/reqwest/issues/2677]

- #a[eventsource-stream: A basic building block for building an Eventsource from a Stream of bytes array like objects][https://github.com/jpopesculian/eventsource-stream]
  (discontinued)
  - #a[reqwest-eventsource: Helper to build an Eventsource using reqwest][https://github.com/jpopesculian/reqwest-eventsource]
    (discontinued)
    - #a[aha-reqwest-eventsource][https://github.com/xgpxg/reqwest-eventsource]
      : `reqwest` v0.13

- #a[viniciusgerevini/sse-client: EventSource implementation in Rust to handle streams of Server-Sent Events][https://github.com/viniciusgerevini/sse-client]
- #a[vvvinceocam/reqwest-sse][https://github.com/vvvinceocam/reqwest-sse]
