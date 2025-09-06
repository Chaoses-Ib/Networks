# ~~[Clash](https://github.com/Dreamacro/clash)~~
[Documentation](https://dreamacro.github.io/clash/)

[深入理解Clash配置文件 -- 月下博客](https://ssrvps.org/archives/9988)

[Clash 的一些高级用法 | 米白云使用教程](https://docs.mebi.me/docs/advanced-usage-for-clash)

[zuluion/Clash-Template-Config: 自用Clash配置文件模板](https://github.com/zuluion/Clash-Template-Config)

[MisakaNo の 小破站 / clash-meta - GitLab](https://gitlab.com/Misaka-blog/clash-meta)

## Protocols
Outbound:
- [HTTP](https://github.com/MetaCubeX/mihomo/blob/Alpha/adapter/outbound/http.go)
  - 支持指定 `headers`，但不支持 path？
  - 不支持传递 real IP

[\[Feature\] Support Proxy Protocol - Issue #1107 - MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo/issues/1107)

## Relay
- `dialer-proxy`

  If `B.dialer-proxy: A`, Clash → A → B.

  [dialer-proxy - Clash.Rev Docs](https://merlinkodo.github.io/Clash-Rev-Doc/config/proxies/dialer-proxy/)
- `type: relay` (deprecated)
  
  [链式代理 - 虚空终端 Docs](https://wiki.metacubex.one/config/proxy-groups/relay/)

  [链式代理优化代理速度 | tanglu's blog](https://blog.tanglu.me/chains-proxies/)

## Tunnels
[流量隧道 - 虚空终端 Docs](https://wiki.metacubex.one/config/tunnels/)

```yaml
tunnels:
- tcp/udp,127.0.0.1:6553,8.8.8.8:53,proxy
# or:
- network: [tcp, udp]
  address: 127.0.0.1:6553
  target: 8.8.8.8:53
  proxy: proxy
```
- `target` can't be 127.0.0.1, but the IP of the host if you want to access it?

## Proxy groups
`url-test`:
- [→Captive portal detection](../Captive%20Portal.md#detection)

## Proxy providers
- `proxy-providers`
- path 相同时 providers 可能会互相覆盖
- ~~Clash Meta For Android 旧版本需要手动指定 path ([#124](https://github.com/MetaCubeX/ClashMetaForAndroid/issues/124))~~

```yaml
# Mihomo 格式的节点或支持 *ray 的分享格式
proxy-providers:
  provider1:
    type: http # http 的 path 可空置，默认储存路径为 homedir 的 proxies 文件夹，文件名为 url 的 md5
    url: "url"
    interval: 3600
    path: ./provider1.yaml # 默认只允许存储在 mihomo 的 Home Dir，如果想存储到任意位置，添加环境变量 SKIP_SAFE_PATH_CHECK=1
    proxy: DIRECT
    header:
      User-Agent:
      - "Clash/v1.18.0"
      - "mihomo/1.18.3"
      # Accept:
      # - 'application/vnd.github.v3.raw'
      # Authorization:
      # - 'token 1231231'
    health-check:
      enable: true
      interval: 600
      # lazy: true
      url: https://cp.cloudflare.com/generate_204
      # expected-status: 204 # 当健康检查返回状态码与期望值不符时，认为节点不可用
    override: # 覆写节点加载时的一些配置项
      skip-cert-verify: true
      udp: true
      # down: "50 Mbps"
      # up: "10 Mbps"
      # dialer-proxy: proxy
      # interface-name: tailscale0
      # routing-mark: 233
      # ip-version: ipv4-prefer
      # additional-prefix: "[provider1]"
      # additional-suffix: "test"
  test:
    type: file
    path: /test.yaml
    health-check:
      enable: true
      interval: 36000
      url: https://cp.cloudflare.com/generate_204
```

## ~~[Premium](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features)~~
Premium core is proprietary. It has the following additional features:
- gvisor/system stack TUN device on macOS, Linux and Windows ([ref](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features#tun-device))
- Policy routing with [Scripts](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features#script)
- Load your rules with [Rule Providers](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features#rule-providers)
- Monitor Clash usage with a built-in profiling engine. ([Dreamacro/clash-tracing](https://github.com/Dreamacro/clash-tracing))

## Rules
[路由规则 - 虚空终端 Docs](https://wiki.metacubex.one/config/rules/)

- `IP`

  e.g. `IP-CIDR,1.1.1.1/32,DIRECT`

  [IP规则 - Clash.Rev Docs](https://merlinkodo.github.io/Clash-Rev-Doc/config/rules/ipcidr/)

- `PROCESS-NAME`
  - 大小写不敏感，但是是完整匹配，需要包含扩展名
    - [\[Feature\] 支持 域名关键字 通配 和 程序关键字 通配 - Issue #846 - MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo/issues/846)
  - ~~[\[Bug\] 太多的 process not found - Issue #613 - MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo/issues/613)~~
  - 对 SOCKS 端口连接同样有效，可通过 `IN-TYPE` 过滤，例如 `AND,((RULE-SET,BT),(NOT,((IN-TYPE,SOCKS/HTTP)))),BT`。

### [Rule Providers](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features#rule-providers)
[如何优雅地为 Clash 添加自定义代理规则？这是你要看的最后一篇教程 - V2EX](https://v2ex.com/t/949462)

Rule sets:
- [ACL4SSR: SSR去广告规则/GFWList规则/Clash规则碎片](https://github.com/ACL4SSR/ACL4SSR/tree/master)
- [Loyalsoldier/clash-rules](https://github.com/Loyalsoldier/clash-rules)
- [blackmatrix7/ios_rule_script/rule/Clash](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash)
- [FantasticMao 的 Clash 规则集](https://github.com/fantasticmao/clash-rules)
- [maskedeken/clash-rules](https://github.com/maskedeken/clash-rules)

[本文主要是教你怎么定制一下自己的ACL或者clash规则](https://gist.github.com/Teraflopst/d53f1dbc3dcc350154c1beba03290a4b)

## Subscription user info
- `Subscription-Userinfo`

  [Quantumult/Extra Server Subscription Feature](https://github.com/crossutility/Quantumult/blob/master/extra-subscription-feature.md)

- `# upload=455727941; download=6174315083; total=1073741824000; expire=1671815872;`

  [URL Scheme | Clash for Windows 代理工具使用说明](https://docs.gtk.pw/contents/urlscheme.html)

  [URL Schemes - Clash Verge Rev Docs](https://clash-verge-rev.github.io/guide/url_schemes.html)

- 剩余流量不是通过解析节点名称实现的，例如 `剩余流量：100.00 GB`。

订阅转换时将使用最后一个有效订阅的 `Subscription-Userinfo`。可以使用一些无效订阅来覆盖流量信息，例如：
- 11.6KB/0B: `https://sublink.naiko.org/link/DJeNAh4ufS4LzbFY?clash=1`
- 0B/200GB: `https://4gehpe.doggygo.top:8443/api/v1/client/55bcd67be9d0b1ac5cae7e2df09b3ca6`

[Notebook](Clash.ipynb)

## [Clash.Meta](https://github.com/MetaCubeX/mihomo/tree/Alpha)
- [使用预编译二进制](https://wiki.metacubex.one/startup/)
  - `scoop install mihomo`
  - Linux
    ```sh
    wget http://github.com/MetaCubeX/mihomo/releases/download/Prerelease-Alpha/mihomo-linux-amd64-alpha-84cd0ef.gz
    gunzip mihomo-linux-amd64-alpha-84cd0ef.gz
    mv mihomo-linux-amd64-alpha-84cd0ef m
    dd if=/dev/zero bs=1 count=1 >> m
    chmod +x m
    ./m -d cm -f config.yaml
    ```
- Configuration directory (`-d`) defaults to `~/.config/mihomo`

[Clash.Meta Docs](https://wiki.metacubex.one/)

[配置详解](https://wiki.metacubex.one/config/)
- [完整实例](https://github.com/MetaCubeX/mihomo/blob/Meta/docs/config.yaml)

[配置示例](https://wiki.metacubex.one/example/)

### GUIs
[支持 Clash.Meta 的工具](https://wiki.metacubex.one/client/)

[三方工具/客户端 - 虚空终端 Docs](https://wiki.metacubex.one/startup/client/client/)

Desktop:
- ~~[Clash Verge: A Clash GUI based on tauri. Supports Windows, macOS and Linux.](https://github.com/zzzgydi/clash-verge)~~
  - 内存占用约 40 MiB。
  
  Forks:
  - [Clash Verge Rev: Continuation of Clash Verge - A Clash Meta GUI based on Tauri (Windows, MacOS, Linux)](https://github.com/clash-verge-rev/clash-verge-rev)
    - Tauri v2
    - 轻量模式: 655 MiB, 0.95% CPU → 153 MiB, 0.11% CPU
      - 激活: 设置、托盘、热键、首页、自动（最少 1min，默认不开启）
        - [\[Feature\] 轻量模式加入托盘点击右键的上拉框 - Issue #2789](https://github.com/clash-verge-rev/clash-verge-rev/issues/2789)
        - [\[Feature\] 增加一个轻量模式的快捷键 - Issue #2808](https://github.com/clash-verge-rev/clash-verge-rev/issues/2808)
    - 网络
      - IP 信息、解锁测试
      - 流量统计
    - WebDAV 备份
    - [希望可以在全局配置中添加 `prepend-rules` 规则 - Issue #1437](https://github.com/clash-verge-rev/clash-verge-rev/issues/1437)
    - Logs 位于 `%APPDATA%\io.github.clash-verge-rev.clash-verge-rev\logs`，**不会**自动清理，会增大空间占用以及隐私泄露风险。可以调高 Log Level 来避免快速占用大量空间，或者直接调整为 Silent。
    - [clash-verge-rev/UPDATELOG.md](https://github.com/clash-verge-rev/clash-verge-rev/blob/dev/UPDATELOG.md)
  
  - [Clash Nyanpasu: Clash Nyanpasu! (∠・ω< )⌒☆​](https://github.com/keiko233/clash-nyanpasu)
    - Tauri v2, egui
  
- ~~[Clash for Windows](https://github.com/Fndroid/clash_for_windows_pkg)~~
  - 内存占用约 240 MiB。

Android:
- ~~[Clash for Android](https://github.com/Kr328/ClashForAndroid)~~
  - https://www.dropbox.com/scl/fi/ucgg9oom1a5bq24yzzykm/cfa-2.5.12-premium-universal-release.apk?rlkey=5h0hpluuyfxt0atnu0emcoql5&dl=0

- [Clash Meta for Android](https://github.com/MetaCubeX/ClashMetaForAndroid)
  - F-Droid
  - https://t.me/coobackup/67
  - https://alist.ips.ga/clients
  - https://clashxhub.com/apps/cmfa-2.10.1-meta-universal-release.apk
    - 未被微信屏蔽
  - https://dl.haojichang.com/apps/ClashMetaForAndroid/
    - https://dl.haojichang.com/apps/ClashMetaForAndroid/cmfa-2.10.0-meta-arm64-v8a-release.apk

- [FlClash: A multi-platform proxy client based on ClashMeta,simple and easy to use, open-source and ad-free.](https://github.com/chen08209/FlClash)
  - Flutter

## [ClashRS](https://github.com/Watfaq/clash-rs)
- Windows: 21.6 MiB
  - `--no-default-features`: 14.5 MiB
    ```rust
    File  .text     Size Crate
    13.2%  19.8%   1.9MiB clash_lib
    10.1%  15.2%   1.5MiB std
    6.1%   9.2% 904.4KiB tokio
    3.0%   4.5% 442.7KiB h2
    2.7%   4.0% 394.0KiB axum
    2.6%   3.9% 389.4KiB rustls
    2.0%   3.0% 295.7KiB tracing
    1.8%   2.7% 269.1KiB regex_automata
    1.5%   2.2% 216.8KiB quinn_proto
    1.3%   2.0% 194.8KiB clap_builder
    1.3%   2.0% 194.3KiB regex_syntax
    1.2%   1.8% 175.0KiB serde_yaml
    1.1%   1.7% 167.9KiB hyper
    1.1%   1.6% 157.3KiB hickory_proto
    1.1%   1.6% 156.3KiB hyper_util
    1.0%   1.5% 145.1KiB hickory_server
    0.9%   1.3% 131.3KiB aho_corasick
    0.9%   1.3% 127.7KiB hashbrown
    0.7%   1.1% 105.3KiB futures_util
    0.6%   0.9%  86.4KiB quinn
    11.5%  17.3%   1.7MiB And 174 more crates. Use -n N to show more.
    66.5% 100.0%   9.6MiB .text section size, the file size is 14.5MiB
    ```

- [known transports/protocols (unimplemented) - Issue #190 - Watfaq/clash-rs](https://github.com/Watfaq/clash-rs/issues/190)
- [disable hysteria brutal algo? - Issue #716 - Watfaq/clash-rs](https://github.com/Watfaq/clash-rs/issues/716)
