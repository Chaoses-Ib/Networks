# Upload
## Multipart forms
```http
POST /foo HTTP/1.1
Content-Length: 68137
Content-Type: multipart/form-data; boundary=ExampleBoundaryString

--ExampleBoundaryString
Content-Disposition: form-data; name="description"

Description input value
--ExampleBoundaryString
Content-Disposition: form-data; name="myFile"; filename="foo.txt"
Content-Type: text/plain

[content of the file foo.txt chosen by the user]
--ExampleBoundaryString--
```

[Uploading a file via HTTP - West Wind Web Connection](https://webconnection.west-wind.com/docs/_0rs0twgr6.htm)

[POST a File via HTTP Request | The Ultimate Guide | by API4AI | Medium](https://medium.com/@API4AI/post-a-file-via-http-request-the-ultimate-guide-b23fb70a3f73)

## Resumable uploads
[Resumable File Uploads - Issue #1626 - whatwg/fetch](https://github.com/whatwg/fetch/issues/1626)

## tus
[tus - resumable file uploads](https://tus.io/) ([GitHub](https://github.com/tus/tus-resumable-upload-protocol))
- [Resumable File Upload Demo | tus.io](https://tus.io/demo)
  - HTTP Traffic
  - `https://tusd.tusdemo.net/files/`

- File name

  [About the file name - Issue #44 - tus/tusd](https://github.com/tus/tusd/issues/44)
  > The reason why the tusd server generates random IDs for uploads instead of using the file's name is that the protocol does not force the client to tell the server the file name. This is a decision that has been made on purpose. However, we do understand that such information is sometimes crucial and therefore you are able to use the mechanics of meta data to pass it along. In this case the file name will be presented as meta data inside the `.info` object.

  [I want original file extension, which i have uploaded - Issue #174 - tus/tusd](https://github.com/tus/tusd/issues/174)

- [Protocol Extensions](https://tus.io/protocols/resumable-upload#protocol-extensions)
  - Creation
    - Response's `Location` depends request's `Host`
  - Expiration (unfinished uploads only)

Servers:
- Go: [tusd: Reference server implementation in Go of tus: the open protocol for resumable file uploads](https://github.com/tus/tusd)
  - 37 MiB
  - [Proxies](https://tus.github.io/tusd/getting-started/configuration/#proxies)
    - [nginx.conf](https://github.com/tus/tusd/blob/main/examples/nginx.conf)
    - `-behind-proxy` 不支持 `X-Forwarded-Port`
    - [Wrong URL when new upload is created - Issue #136](https://github.com/tus/tusd/issues/136)
      - [Add note about port of X-Forwarded-Host to nginx.conf example by Chaoses-Ib - Pull Request #1190](https://github.com/tus/tusd/pull/1190)
    - Caddy: [Tusd behind Caddy Webserver? - Issue #444](https://github.com/tus/tusd/issues/444)
  - [HTTP/2](https://tus.github.io/tusd/getting-started/configuration/#http2)
  - HTTP/3
    - [tus over QUIC - Issue #857](https://github.com/tus/tusd/issues/857)
      - > So I tested upload-speed with Safari and Chrome but it was almost the same speed.
  - [Storage backends](https://tus.github.io/tusd/storage-backends/overview/)
  - [FileInfo](https://pkg.go.dev/github.com/tus/tusd/pkg/handler#FileInfo)
    - [hook.proto](https://github.com/tus/tusd/blob/eff0a435fcbba04edede33a80f69811588aaa0f5/pkg/hooks/grpc/proto/hook.proto#L35)
    - `finishUploadIfComplete()`: `!info.SizeIsDeferred && info.Offset == info.Size`
      - But `Offset` becomes `0` after finish?
  - Download
    - `-disable-download`
    - Only files with `.info` can be downloaded.
  - Hooks
    - Files
    - HTTP
    - gRPC: Bad interface, all in one `InvokeHook`
    - Plugin
  - Security

    tusd 只内置了对 `-max-size` 的限制，涉及到具体用户的限制需要通过 `pre-create` hook 实现。对于总和型限制，需要记录每份上传的信息，此时通过 `FileInfoChanges.id` 指定创建 ID 更方便于建立关联。
    
    但 `pre-create` hook 只能限制新建 upload，无法限制 PATCH 已创建的 upload。`post-receive` hook 虽然可以实现限制只有特定用户才可以 PATCH upload，但是是定时触发的，难以统计上传流量。

    也就是说 tusd 可以限制只有特定用户可以创建和上传 upload，以及上传的总大小，但是无法限制上传流量。只能避免非法用户上传和合法用户占用存储空间，但无法避免合法用户占用上传带宽、流量和硬盘 IO，顶多只能通过限时来进行弥补。

    - [Deferred upload length can bypass upload size limit - Issue #1032 - tus/tusd](https://github.com/tus/tusd/issues/1032)
  
  - Windows 上可能因为操作 conhost 导致阻塞

  [tusd v2: better hooks, network resilience and IETF protocol | tus.io](https://tus.io/blog/2023/09/20/tusd-200)

- .NET: [tusdotnet: .NET server implementation of the Tus protocol for resumable file uploads. Read more at https://tus.io](https://github.com/tusdotnet/tusdotnet)

- Rust
  - tusd-types
  - Rocket: [Meteoritus: A tus server integration for Rocket framework](https://github.com/kallebysantos/meteoritus)
  - [rustus: TUS protocol implementation in Rust.](https://github.com/s3rius/rustus)
    - [Application examples? - Issue #139 - s3rius/rustus](https://github.com/s3rius/rustus/issues/139)
    - [Embedding in other programs - Issue #157 - s3rius/rustus](https://github.com/s3rius/rustus/issues/157)
    - [Implement expiration extension - Issue #13 - s3rius/rustus](https://github.com/s3rius/rustus/issues/13)

- JS: [tus-node-server: Node.js tus server, standalone or integrable in any framework, with disk, S3, and GGC stores.](https://github.com/tus/tus-node-server)

Clients:
- [tus-js-client: A pure JavaScript client for the tus resumable upload protocol](https://github.com/tus/tus-js-client)
- [tus-py-client: A Python client for the tus resumable upload protocol](https://github.com/tus/tus-py-client) (`tuspy`, `tusclient`, [Notebook](tus.ipynb))
  - requests / aiohttp

## Others
[Resumable.js: A JavaScript library for providing multiple simultaneous, stable, fault-tolerant and resumable/restartable uploads via the HTML5 File API.](https://github.com/23/resumable.js) (discontinued)

[post - resume uploads using HTTP? - Stack Overflow](https://stackoverflow.com/questions/1830130/resume-uploads-using-http)

[面试官：大文件上传如何做断点续传？-腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/article/1813858)

[大文件上传服务器、支持超大文件HTTP断点续传实践总结 - 掘金](https://juejin.cn/post/7045142249969025054)

## Upload and download
- [Transloadit: File uploading & processing API](https://transloadit.com/) (paid)

  [Why Transloadit outperforms S3 for file uploads | Transloadit](https://transloadit.com/blog/2023/04/transloadit-vs-s3-for-uploads/)

  [Using postman to interface with the Transloadit API | Transloadit](https://transloadit.com/blog/2022/06/postman/)

- [Filestack: The Best File Uploader & Upload API](https://www.filestack.com/) (paid)
