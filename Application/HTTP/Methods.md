# Request Methods
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods)

Discussions:
- 2022-02 ["一把梭：REST API 全用 POST" | 酷 壳 - CoolShell](https://coolshell.cn/articles/22173.html)

  > 全部使用POST确实可以减少沟通，因为只要在生成文档的时候统一插入一条提示说使用POST就可以了。从而避免无谓的争议。
  > 
  > 你提到为不同的API赋予动词，这个对CRUD来说比较容易，但对一些复杂的业务接口来说就没那么轻松了。而且，跟使用 GET/POST/PUT/DELETE 等HTTP方法相比，我也没看出使用 POST GetXXX/CreateXXX/UpdateXXX/DeleteXXX 有什么大问题。
  > 
  > 你提到了规范性问题。其实，所谓的 REST 风格不过是一种松散的约定，几乎没有强制约束力。我还没见过因为只用 POST 方法就导致系统之间无法对接的情况。就目前而言，有约束力的可能就是 HTTP 协议了。只要支持 HTTP 协议，系统的互通互联就不会有太大的问题。你提到说只用 POST 方法就不规范，甚至是对自己的职业的不敬，确实不敢苟同。
  > 
  > 不过，能过这几年的实践，也发现纯用 POST 的一些问题，借贵宝地分享给大家。
  > 
  > 第一，CDN 节点基本上不会缓存 POST 调用结果，哪怕是查询接口也没法缓存。这一点大家可以见仁见智。有的人觉得动态接口不应该缓存，保证时效；有的人觉得可以缓存一段时间，减少请求量。
  > 
  > 第二，出错之后网关不会重试。大家通常在接口外面加一层网关，网关大都基于 Nginx 之类的 HTTP 代理服务器。但这类网关在遇到 Upstream 的报错的时候通常只会针对 GET 请求做重试。这里也就牵扯出接口幂等的问题。纯用POST方法无法简单识别接口是否幂等。
  > 
  > 其他感觉都还好。如果可以重来，我觉得只使用 GET 和 POST 两种方法，用来区分是否幂等就足够了。

  > 我个人认为关于基于 HTTP API 设计问题的动词分歧主要在于：1）一种将 HTTP 作为一种“文件”资源访问控制协议，所以搭配动词更合适；2）将 HTTP 作为一种 RPC 的载体，这时候全 POST 也无可厚非。不过单就“纯正”而言，我更倾向第一种，毕竟 HTTP 名字前面就是 Hyper Text （资源）

  > 说说我自己的切身体会吧，坐标国内某互联网大厂。
  > （评论是午休草草写的，大小写和术语不规范请见谅）
  > 
  > 使用 restful 一定程度上会增加沟通成本。
  > 不知道耗子叔跟前端打交道多不多，不同的开发同学有不同的审美&性格，如果一方不想遵守 restful 风格，另一方想遵守这个风格，那么就需要 battle。而且同事是在不断变化的，总有新人来，每次都重新 battle 不仅影响心情，也会影响开发效率，而且可能制造潜在的矛盾。
  > 每个人对自己的技术要求或者代码审美是不一样的，没必要因为一个技术观念的不合就去说服对方（可以延拓到非技术领域），或者因此去 judge 对方没有程序员的职业道德。
  > restful 不适合 realworld
  > realworld 是十分复杂的，restful 提供的原语并不能 cover 真实世界的复杂需求，看了评论区有些小伙伴举的例子问 XXX 该怎么用 restful 风格解决，答案往往需要一些设计 或 workaround，门槛比较高。原因并不在于客观世界的复杂，而在于 restful 并不是一个好的解决方案。
  > 这里举一个特别简单的例子，如何用 delete 方法删除「一批」资源（批量删除）：
  > 首先标准中没有提到HTTP 的 DELETE 方法是否可以有 body，所以这里你不能使用 json body 的方式提供这一批资源的 ID
  > 因此你需要先用 POST 方法创建一个「删除一批资源的资源」
  > 
  > POST /createBatchDelete
  > {“ids”: [1,2,3]}
  > 
  > 得到一个 batchDeleteId
  > 3. 调用 DELETE 方法进行批量删除
  > DELETE /deleteBatch?deleteId={batchDeleteId}
  > 
  > 可以看到，一个简单的批量删除需求，使用 RESTful 风格设计 API 是十分荒谬的，不仅后端变复杂，前端也会变得更复杂。

  > 如果前端系统把调用后端接口视作 RPC，把 HTTP 视为 RPC 的管道，只用 POST 可以减少很多开发工作量，也不会产生什么问题。RESTful 的 API 我个人的看法是在 URL 路径参数比较少的时候干净漂亮，参数超过 3 个后路径和参数揉在一起表达力比较弱。同时表达“刷新”、“推送”这些动作时 URL 可以表达，但表达力弱。如果只用 POST，开发者在调用接口时脑内只需要维护(接口地址,接口参数)这个二元组，如果用了其它动词，脑内需要维护(动词,接口地址,接口参数) 这个三元组，而且动词和接口地址的关系不是强相关的，记起来是有一定负担的（或者需要现查阅）我开发中一个感受是经常需要确认某个接口是不是 GET 接口，GET 接口除了带来开发的中断外并没有带来太多好处（个人感受）。现在 web 世界中，网页越来越少，web 应用越来越多，我觉得类似 RPC 的场景会越来越多。楼主说不建议 HTTP 状态码都返回 200，实际上如果 HTTP 状态码都返回 200，把 404、500 这些状态码放在 payload 的 code 上呢？这样只是前端透明地“套”了一层，前端接收时增加了数行代码，似乎唯一的缺点是让“开发者工具”里只一眼看不到真正的状态码

  > RESTFul接口是适合对资源进行操作。  
  > 业务上，第一种情况，如果对外接口大都是对资源进行增删改查等操作，适合用RESTFul，当然也就比较适合使用文章中说的那些原则。  
  > 第二种情况，如果对外接口大都是复杂的业务操作，并不是对资源的增删改查，那么不适合RESTFul接口，换句话说，就是不适合生硬的套用RESTFul接口的那套原则。
  > 
  > 另外，如果是把HTTP协议作为低层的承载协议，那就不要跟业务扯上很多关系了。HTTP就负责HTTP层面的事儿。那么很多时候，PUT、DELETE等动词就是用不上的。这时候POST一把梭哈也没什么不可以。典型的例如SOAP RPC。

  > `所有接口都是 post 请求`不是不遵循ESTful 规范, 而是选择了 rpcstyle, 这是 trade off, 看中的是 rpcstyle 描述接口可以像 function 一样被不同语言调用, 获得结果, 产生副作用. 不应该仅仅只是基于`共识`这种莫须有的理由而去选择 RESTful.

  > “幂等”的问题不应该依赖客户端，这问题应该在服务端就解决掉。全部POST其实没什么不好，后续需要更换成websocket、gRPC等等更省心了

  > 国内的环境还真不好说，之前有个客户用的联通的云服务器，那个服务器的外层网关直接把PUT、DELETE请求都屏蔽了，请求根本进不去，问云平台运维人员，全都大眼瞪小眼，问就是不知道，不清楚，跟问墙壁一样，有什么办法？连夜把请求都改成POST才算结束。

  > 参数写在url上一时爽，安全扫描就会哭

- 2021-09 [如何看待：不遵循 restful\_api 设计，所有的 api 使用 POST 提交 - V2EX](https://www.v2ex.com/t/595188)

  > GET, PUT, DELETE 等会对参数转义，调试麻烦，而且浏览器对字符长度限制也比较大，  
  > GraphQL 就是只用 HTTP POST 了，参数内用 query 和 mutation 标识，多简单~

- 2021-11 [被客户告知 HTTP 的 PUT 请求不安全，甩锅给我们要求整改 - V2EX](https://global.v2ex.com/t/816040)

  > 其实你们现在给 js 做下 ajax function 或者 fetch 的猴子补丁， 把 method=put/delete/update 的都给劫持成 post+method 字段， 原生 form 就通过事件委托劫持， 后端那边做个中间件， 检测到这个字段就把 method 改了， 业务层不用变， 花不了多少时间的

- 2023-07 [安全 QA 说只允许 POST/GET 请求，其它的都不安全？ - V2EX](https://www.v2ex.com/t/959602)

  > 只有我觉得 restful 规范不行嘛，在协议上用一堆方法，不够麻烦的，get/post 一把梭多好

  > 应该是合规侧有强制要求，因为除 GET 、POST 之外的方法都存在一定安全隐患，例如 OPTIONS 可以查询支持的方法，比方说支持 PUT ，但是 apache 存在有关 PUT 方法上传 webshell 或任意文件的漏洞（像是 CVE-2017-12615 诸如此类的漏洞），所以安全 QA 才会有这样的要求。

  > 不遵從 RESTful 的人通常是實戰派的，比如你這次遇到的安全審計，你噴甲方或安全公司也沒用，他們也不會放你過。反而 RESTful 是從一篇博士論文出來的，學院派氣息濃厚。

  > 我们集团很多项目都是 POST 梭哈的，HTTP Status 除了 200 401 500 其他都不用，公司项目能跑就行。见过项目用 RESTful ，经过多年迭代已经变成 POST 梭哈的形状了，有些接口命名很痛苦，比如消息撤回，驳回通过，审批通过这种。

  ```nginx
  if ($uri ~* "/(GET|POST|PUT|DELETE)/$") {
  set $param_method $1;
  }

  add_header X-HTTP-Method-Override $param_method;
  ```

- [http中的put、delete等请求为什么不安全？ - 知乎](https://www.zhihu.com/question/38770182)

  > 这个是历史问题。开启了WebDAV 的 IIS 允许匿名访问者直接通过 PUT 往服务器上上传文件，曾经导致了很多严重的漏洞，具体可以搜下 IIS put 。此外 apache 默认允许 trace， 又导致了一批XSS。这些历史问题给运维造成很不好的印象，所以干脆把除必须的http头外都禁掉了事。

  > 以前只用 GET 和 POST 是因为一些地方运营商屏蔽其他 method

## `OPTIONS`
[MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Methods/OPTIONS)

[→Cross-Origin Resource Sharing (CORS)](README.md#cross-origin-resource-sharing-cors)

## REST
- [Is using a verb in URL fundamentally incompatible with REST? - Stack Overflow](https://stackoverflow.com/questions/19646989/is-using-a-verb-in-url-fundamentally-incompatible-with-rest)
- [Architect forcing me to add verbs in rest api : r/developersIndia](https://www.reddit.com/r/developersIndia/comments/18v3mqj/architect_forcing_me_to_add_verbs_in_rest_api/)
- [Does no one define clean REST API in practice? : r/ExperiencedDevs](https://www.reddit.com/r/ExperiencedDevs/comments/pkonde/does_no_one_define_clean_rest_api_in_practice/)

  > Because reality is messy. REST is a good idea for purely data based abstractions and CRUD. No system is ever that simple. HTTP verbs are never enough to express the subtleties of actions one wants to take on an object. And still you might need to expose an endpoint for something as arbitrary as rebooting the server running your service.

- [REST vs RPC APIs - Which is better? : r/programming](https://www.reddit.com/r/programming/comments/17us0bd/rest_vs_rpc_apis_which_is_better/)

  > The verbs denote safety and idempotency and *not* CRUD operations.