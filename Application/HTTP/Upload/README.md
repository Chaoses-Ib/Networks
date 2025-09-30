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
    - The Server MUST acknowledge a successful upload creation with the `201 Created` status.
      - Clients that assert 2xx: tus-js-client
      - Clients that assert 201: Rust tus_async_client
    - Response's `Location` depends request's `Host`
  - Expiration (unfinished uploads only)
  - Checksum
    - tusd: Not supported

      [Compute the MD5 hash of the file for Azure Storage - Issue #1187 - tus/tusd](https://github.com/tus/tusd/issues/1187)

- Resuming
  - Variable content
    - If HEAD `offset == length`, skip, otherwise conitnue at `offset`: [tus-js-client](https://github.com/tus/tus-js-client/blob/d658d01bee3a716ad9546fabfde7963d73c7c7f2/lib/upload.ts#L748)
    - If HEAD `length != upload.length`, error, otherwise continue at `offset`: tus_async_client

    Better to use different ids, e.g. the same id with different suffixes.

- Parallel upload

  By default, every chunk will only start upload if the previous one has been completed.
  - Worse for high-latency and slow start connections

  Parallel uploads:
  - [Concatenation](https://tus.io/protocols/resumable-upload#concatenation) (parallel uploads)

    Concatenation will upload different chunks to different URLs parallelly, and then concatenate them on the server.
    - Doesn't support to specify upload URL anymore.

      `cannot use the uploadUrl option when parallelUploads is enabled`
    - Metadata

      > When parallel uploads are enabled via `parallelUploads`, tus-js-client creates multiple partial uploads. The values from `metadata` are not passed to these partial uploads but only passed to the final upload, which is the concatentation of the partial uploads. In contrast, the values from `metadataForPartialUploads` are only passed to the partial uploads and not the final upload.

      But can't specify different metadata for each chunk.
  - Why not just utilize offset to do parallel upload, like what parallel downloaders do?
  - Or just buffer the subsequent `PUT` on the server until the previous one is finished?

- Instant upload (秒传): try upload at hash + create at hash (by pre-create hook)

- Compression

  With instant upload:
  1. Get file info at hash, if not compelete:
  2. Compression
  3. Upload at hash with suffix (including level)
  4. Decompress at `post-finish`/`pre-finish`

Servers:
- Go: [tusd: Reference server implementation in Go of tus: the open protocol for resumable file uploads](https://github.com/tus/tusd)
  - 37 MiB
  - [Proxies](https://tus.github.io/tusd/getting-started/configuration/#proxies)
    - [nginx.conf](https://github.com/tus/tusd/blob/main/examples/nginx.conf)
    - `-behind-proxy` 不支持 `X-Forwarded-Port`
    - [Wrong URL when new upload is created - Issue #136](https://github.com/tus/tusd/issues/136)
      - [Add note about port of X-Forwarded-Host to nginx.conf example by Chaoses-Ib - Pull Request #1190](https://github.com/tus/tusd/pull/1190)

        `pre-create` and `post-create` hooks work fine, but other hooks will be redirected to 80/443.
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

        <details><del>

        This also causes the client to reupload the file even if the server returned the same ID.

        A workaround is to return [208 Already Reported](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Status/208) to the client and check manually. Unfortunately, some clients may require 201 to be returned.

        Another workaround is to modify `.info` file.
        </del></details>

        No, it's always 0 in `.info` file for `FileStore`. `writeInfo()` is only called by `NewUpload()` and `DeclareLength()`. The `Offset` is read from the size of the file when `GetUpload()`.

        It's `NewUpload()` that removes existing files. A solution is to try to upload before creating one.

  - Download
    - `-disable-download`
    - Only files with `.info` can be downloaded.
  - [Hooks](https://tus.github.io/tusd/advanced-topics/hooks/)
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
  - [lib/upload.ts](https://github.com/tus/tus-js-client/blob/d658d01bee3a716ad9546fabfde7963d73c7c7f2/lib/upload.ts)
- [tus-py-client: A Python client for the tus resumable upload protocol](https://github.com/tus/tus-py-client) (`tuspy`, `tusclient`, [Notebook](tus.ipynb))
  - requests / aiohttp
- Rust
  - [tus_client: A Rust native client library to interact with tus enabled endpoints](https://github.com/jonstodle/tus_client)
    - [tus_async_client](https://github.com/zryambus/tus_async_client)
      - All tests deleted
    - [tus_client_extra: A Rust native client library to interact with tus enabled endpoints - provides an extra output of HTTP headers](https://github.com/Bysness/tus_client_extra)
  - [tus: rust implenetation of https://tus.io](https://github.com/richo/tus)
  - [web\_sys\_resumable: Resumable uploads for `web_sys::file`](https://github.com/littlebenlittle/web_sys_resumable)
  - [tus-rust: Rust implementation of the tus resumable upload protocol. http://tus.io](https://github.com/rio/tus-rust)

## Others
- [Resumable.js: A JavaScript library for providing multiple simultaneous, stable, fault-tolerant and resumable/restartable uploads via the HTML5 File API.](https://github.com/23/resumable.js) (discontinued)
- [daffodil: 一个代码简单、易读、界面美观、支持多数据源动态切，换基于SpringBoot的后台管理系统的maven项目，采用技术SpringBoot、SpingDataJpa、Shiro、Redis、Flowable、thymeleaf、bootstrap、layer、fontawesome等。 - Gitee.com](https://gitee.com/mengtjq/daffodil)
  - daffodil-easyfile：文件上传（实现大文件分片上传、续传、秒传功能）

[post - resume uploads using HTTP? - Stack Overflow](https://stackoverflow.com/questions/1830130/resume-uploads-using-http)

[面试官：大文件上传如何做断点续传？-腾讯云开发者社区-腾讯云](https://cloud.tencent.com/developer/article/1813858)

[大文件上传服务器、支持超大文件HTTP断点续传实践总结 - 掘金](https://juejin.cn/post/7045142249969025054)

## Upload and download
- [Transloadit: File uploading & processing API](https://transloadit.com/) (paid)

  [Why Transloadit outperforms S3 for file uploads | Transloadit](https://transloadit.com/blog/2023/04/transloadit-vs-s3-for-uploads/)

  [Using postman to interface with the Transloadit API | Transloadit](https://transloadit.com/blog/2022/06/postman/)

- [Filestack: The Best File Uploader & Upload API](https://www.filestack.com/) (paid)
