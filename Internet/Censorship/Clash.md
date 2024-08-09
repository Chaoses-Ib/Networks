# ~~[Clash](https://github.com/Dreamacro/clash)~~
[Documentation](https://dreamacro.github.io/clash/)

[深入理解Clash配置文件 -- 月下博客](https://ssrvps.org/archives/9988)

[zuluion/Clash-Template-Config: 自用Clash配置文件模板](https://github.com/zuluion/Clash-Template-Config)

## Proxy groups
`url-test`:
- [→Captive portal detection](../Captive%20Portal.md#detection)

## ~~[Premium](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features)~~
Premium core is proprietary. It has the following additional features:
- gvisor/system stack TUN device on macOS, Linux and Windows ([ref](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features#tun-device))
- Policy routing with [Scripts](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features#script)
- Load your rules with [Rule Providers](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features#rule-providers)
- Monitor Clash usage with a built-in profiling engine. ([Dreamacro/clash-tracing](https://github.com/Dreamacro/clash-tracing))

### [Rule Providers](https://github.com/Dreamacro/clash/wiki/Clash-Premium-Features#rule-providers)
[如何优雅地为 Clash 添加自定义代理规则？这是你要看的最后一篇教程 - V2EX](https://v2ex.com/t/949462)

Rule sets:
- [ACL4SSR: SSR去广告规则/GFWList规则/Clash规则碎片](https://github.com/ACL4SSR/ACL4SSR/tree/master)
- [Loyalsoldier/clash-rules](https://github.com/Loyalsoldier/clash-rules)
- [blackmatrix7/ios_rule_script/rule/Clash](https://github.com/blackmatrix7/ios_rule_script/tree/master/rule/Clash)
- [FantasticMao 的 Clash 规则集](https://github.com/fantasticmao/clash-rules)

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
[Clash.Meta Docs](https://wiki.metacubex.one/)

[配置详解](https://wiki.metacubex.one/config/)

[配置示例](https://wiki.metacubex.one/example/)

### GUIs
[支持 Clash.Meta 的工具](https://wiki.metacubex.one/client/)

Desktop:
- ~~[Clash Verge: A Clash GUI based on tauri. Supports Windows, macOS and Linux.](https://github.com/zzzgydi/clash-verge)~~
  - 内存占用约 40 MiB。
  
  Forks:
  - [Clash Verge Rev: Continuation of Clash Verge - A Clash Meta GUI based on Tauri (Windows, MacOS, Linux)](https://github.com/clash-verge-rev/clash-verge-rev)
    - Logs 位于 `%APPDATA%\io.github.clash-verge-rev.clash-verge-rev\logs`，**不会**自动清理，会增大空间占用以及隐私泄露风险。可以调高 Log Level 来避免快速占用大量空间，或者直接调整为 Silent。
  - [Clash Nyanpasu: Clash Nyanpasu! (∠・ω< )⌒☆​](https://github.com/keiko233/clash-nyanpasu)
- ~~[Clash for Windows](https://github.com/Fndroid/clash_for_windows_pkg)~~
  - 内存占用约 240 MiB。

Android:
- ~~[Clash for Android](https://github.com/Kr328/ClashForAndroid)~~
  - https://www.dropbox.com/scl/fi/ucgg9oom1a5bq24yzzykm/cfa-2.5.12-premium-universal-release.apk?rlkey=5h0hpluuyfxt0atnu0emcoql5&dl=0

- [Clash Meta for Android](https://github.com/MetaCubeX/ClashMetaForAndroid)
  - https://t.me/coobackup/67
  - https://alist.ips.ga/clients
  - https://clashxhub.com/apps/cmfa-2.10.1-meta-universal-release.apk
    - 未被微信屏蔽
  - https://dl.haojichang.com/apps/ClashMetaForAndroid/
    - https://dl.haojichang.com/apps/ClashMetaForAndroid/cmfa-2.10.0-meta-arm64-v8a-release.apk