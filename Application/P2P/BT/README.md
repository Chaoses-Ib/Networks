# [BitTorrent](http://www.bittorrent.org/)
[Wikipedia](https://en.wikipedia.org/wiki/BitTorrent)

> BitTorrent is a popular P2P protocol for file distribution. In BitTorrent lingo, the collection of all peers participating in the distribution of a particular file is called a **torrent**. Peers in a torrent download equal-size **chunks** of the file from one another, with a typical chunk size of 256 KBytes.[^topdown]

[BitTorrent - 游戏和谐 Wiki](https://ggame.gledos.science/technology/BitTorrent.html)

[Torrent 和 下载 | Xyx Blog](https://xueyexiao.github.io/torrent/)

## Trackers
> Each torrent has an infrastructure node called a **tracker**. When a peer joins a torrent, it registers itself with the tracker and periodically informs the tracker that it is still in the torrent. In this manner, the tracker keeps track of the peers that are participating in the torrent. A given torrent may have fewer than ten or more than a thousand peers participating at any instant of time.[^topdown]

- [ngosang/trackerslist: Updated list of public BitTorrent trackers](https://github.com/ngosang/trackerslist)
- [XIU2/TrackersListCollection: 🎈 Updated daily! A list of popular BitTorrent Trackers!](https://github.com/XIU2/TrackersListCollection)
  - `https://trackerslist.com/best.txt`

[Tracker 和 qBitorrent Enhanced说明 | EdNovas的小站](https://ednovas.xyz/2021/01/27/tracker/#%E4%BB%80%E4%B9%88%E6%98%AFTracker)

- [Always announce to all trackers in a tier](https://www.libtorrent.org/reference-Settings.html#announce_to_all_trackers)

  [qBittorrent 默认只连接一个tracker服务器，如何设置高级选项设置连接所有的 - 聊天灌水 - ZMX - IT技术交流论坛 - 无限Perfect，追求梦想 - itzmx.com](https://bbs.itzmx.com/thread-96710-1-1.html)

[BT的tracker怎么都是未联系不工作 - 聊天灌水 - ZMX - IT技术交流论坛 - 无限Perfect，追求梦想 - itzmx.com](https://bbs.itzmx.com/thread-103006-1-1.html)

[PBH-BTN/PeerBanHelper: Automatically block unwanted, leeches and abnormal BT peers with support for customized and cloud rules.| BT 反吸血工具 - 自动封禁不受欢迎、吸血和异常的 BT 客户端，并支持自定义规则。支持 qB/qBEE/Deluge/BiglyBT/BitComet](https://github.com/PBH-BTN/PeerBanHelper)

[Resurrecting a dead torrent tracker and finding 3M peers | Hacker News](https://news.ycombinator.com/item?id=44301686)

## Clients
- [qBittorrent](#qbittorrent)
- [Transmission](https://transmissionbt.com/) ([GitHub](https://github.com/transmission/transmission), inactive)
  - No RSS
  - Android
- Deluge ([GitHub](https://github.com/deluge-torrent/deluge))
  - Python
- Vuze
  - BiglyBT ([GitHub](https://github.com/BiglySoftware/BiglyBT))
    - Java, Android
    - I2P support
- FrostWire ([GitHub](https://github.com/frostwire/frostwire))
  - Java, Android
- [Tribler: Privacy using our Tor-inspired onion routing](https://www.tribler.org/) ([Wikipedia](https://en.wikipedia.org/wiki/Tribler), [GitHub](https://github.com/Tribler/tribler))
  - Python
- [Motrix: A full-featured download manager.](https://github.com/agalwood/Motrix) (discontinued)
  - JS
- [rqbit: A bittorrent client in Rust](https://github.com/ikatson/rqbit) (inactive)
  - Rust

Close source:
- [BitComet](https://bitcomet.com/)
  - [Changelog](https://bitcomet.com/en/changelog)
  - Scoop
    ```pwsh
    scoop bucket add xrgzs_sdoog https://github.com/xrgzs/sdoog
    scoop install xrgzs_sdoog/bitcomet
    ```
    蓝奏云、更新及时
  - [BitComet Members](https://members.bitcomet.com/)
  - 内嵌了 WebView2
    - 无法根据进程名分流，可能会导致被 ISP 识别、封锁

  [彗星論壇](https://www.cometbbs.com/)
- μTorrent
- BitTorrent
- BitLord
- Tixati
- 迅雷

[Comparison of BitTorrent clients - Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_BitTorrent_clients)

[Best torrenting client? : r/torrents](https://www.reddit.com/r/torrents/comments/txwv6w/best_torrenting_client/)

[What is the best Torrent Client right now? : r/torrents](https://www.reddit.com/r/torrents/comments/1al1plh/what_is_the_best_torrent_client_right_now/)
> Your list has some terrible software... namely uTorrent and BitTorrent (very shady past with coin miners and agressive ads, you can look it up). BitLord and BitComet are leecher clients that don't encourage sharing; Tixati is good but won't be of any use unless you only use public trackers since it's banned almost everywhere because of spoofing and reporting incorrect stats; Vuze/BiglyBT will eat more RAM than the size of your torrents comibned; never heard of WizTorrent and Bitport so idk anything about them. In the end it all depends on what's on your trackers's whitelist, so make sure to check that.
>
> Despite its flaws, I guess QbT is the best we have right now and afaik isn't banned anywhere. It has the most important features every torrenter needs like selective downloads, torrent exportation, labeling and automatic transferring via categories and is open source.

[Which torrent client should I use for Windows : r/torrents](https://www.reddit.com/r/torrents/comments/1gmiqr3/which_torrent_client_should_i_use_for_windows/)

[What is the best android torrent client : r/qBittorrent](https://www.reddit.com/r/qBittorrent/comments/1epunwk/what_is_the_best_android_torrent_client/)

[Comparison of torrent clients for advanced features : r/torrents](https://www.reddit.com/r/torrents/comments/zx4y8d/comparison_of_torrent_clients_for_advanced/)

### [qBittorrent](https://www.qbittorrent.org/)
[GitHub](https://github.com/qbittorrent/qBittorrent)

- `scoop install qbittorrent`
- [c0re100/qBittorrent-Enhanced-Edition: \[Unofficial\] qBittorrent Enhanced, based on qBittorrent](https://github.com/c0re100/qBittorrent-Enhanced-Edition)
  - `scoop install qbittorrent-enhanced`
  - [支持多个Tracker源 / Support multiple tracker lists - Issue #673](https://github.com/c0re100/qBittorrent-Enhanced-Edition/issues/673)
  - [这项目开发者存在严重的偏见 - Discussion #593](https://github.com/c0re100/qBittorrent-Enhanced-Edition/discussions/593)

  [I just stumbled across qBittorrent Enhanced Edition. : r/qBittorrent](https://www.reddit.com/r/qBittorrent/comments/1g0mktf/i_just_stumbled_across_qbittorrent_enhanced/)

  [qbittorrent和qbittorrent ee那个更好用点？ - 知乎](https://www.zhihu.com/question/440051854)
- High memory usage (compared to BitComet without WebView2)
- Downloads
  - Relative path (against Default Save Path)
- Search plugins ([GitHub](https://github.com/qbittorrent/search-plugins))
  - [Unofficial search plugins - qbittorrent/search-plugins Wiki](https://github.com/qbittorrent/search-plugins/wiki/Unofficial-search-plugins)

[生产力篇 | qbittorrent深入浅出：从零到生产力 - scio - 见证学习与成长](https://blog.scio.icu/index.php/archives/12/)

#### RSS
[\[教程\]如何使用qBittorrent/BitComet实现新番RSS订阅和自动下载 - 哔哩哔哩](https://www.bilibili.com/opus/816601646661369861)

- [AutoBangumi: 全自动追番工具](https://github.com/EstrellaXD/Auto_Bangumi)
- [Nriver/qb-rss-manager: qBittorrent rss订阅规则管理, 支持Docker环境, 群晖, Windows桌面, Linux桌面的qb. 推荐直接使用懒人包体验完整功能.](https://github.com/Nriver/qb-rss-manager)
- [Yu15693/qb-rss-tool: 用于辅助qbittorrent的RSS自动下载功能的轻量级工具](https://github.com/Yu15693/qb-rss-tool)

Path:
- [Autocreate Folders bases in RSS name by each RSS - Issue #18981 - qbittorrent/qBittorrent](https://github.com/qbittorrent/qBittorrent/issues/18981)
- [RSS : Allow regex captures to be used in output folder - Issue #9713 - qbittorrent/qBittorrent](https://github.com/qbittorrent/qBittorrent/issues/9713)
- [Provide option to use RSS feed folder in download rules - Issue #19298 - qbittorrent/qBittorrent](https://github.com/qbittorrent/qBittorrent/issues/19298)

[Is there a way to save to season-specific folders with the RSS downloader? : r/qBittorrent](https://www.reddit.com/r/qBittorrent/comments/fqk562/is_there_a_way_to_save_to_seasonspecific_folders/?show=original)

## [→NAT](../../../Internet/NAT.md#bt)

## Websites
- [1377x](https://1337x.to/)
- [RARBG](https://rarbgprx.org/torrents.php)
- [The Pirate Bay](https://thepiratebay.org)

  [Wikipedia](https://en.wikipedia.org/wiki/The_Pirate_Bay)
- [RuTracker.org](https://rutracker.org)
- [YTS.mx](https://yts.mx/)

  Movies.
- [Nyaa](https://nyaa.si/)

  CJK content, especially manga and anime.
- [動漫花園](https://www.dmhy.org/)
- [Library Genesis](https://libgen.fun/)

  Books.

[Comparison of BitTorrent sites](https://en.wikipedia.org/wiki/Comparison_of_BitTorrent_sites)

[Top 10 Most Popular Torrent Sites](https://torrentfreak.com/top-torrent-sites/)

[Unofficial search plugins - qbittorrent/search-plugins Wiki](https://github.com/qbittorrent/search-plugins/wiki/Unofficial-search-plugins)

## Routing
### Clash
```yaml
- PROCESS-NAME,BitComet.exe,BT
- PROCESS-NAME,qbittorrent.exe,BT
- PROCESS-NAME,Transmission.exe,BT
- PROCESS-NAME,transmission.exe,BT
- PROCESS-NAME,transmission-daemon.exe,BT
- PROCESS-NAME,transmission-qt.exe,BT
- PROCESS-NAME,uTorrent.exe,BT
- PROCESS-NAME,Folx.exe,BT
- PROCESS-NAME,WebTorrent.exe,BT
- PROCESS-NAME,WebTorrent Helper.exe,BT

# Maybe also HTTP:
- PROCESS-NAME,aria2c.exe,BT
- PROCESS-NAME,fdm.exe,BT
- PROCESS-NAME,Thunder.exe,BT
- PROCESS-NAME,NetTransport.exe,BT
```

只通过进程名 route 会同时影响 RSS、搜索，可通过 `IN-TYPE` 分流：
```yaml
rules:
- AND,((RULE-SET,BT),(NOT,((IN-TYPE,SOCKS/HTTP)))),BT

rule-providers:
  BT:
    type: inline
    behavior: classical
    payload:
    - 'PROCESS-NAME,BitComet.exe'
    # Use proxy for RSS and general purposes
    - 'PROCESS-NAME,qbittorrent.exe'
    - 'PROCESS-NAME,Transmission.exe'
    - 'PROCESS-NAME,transmission.exe'
    - 'PROCESS-NAME,transmission-daemon.exe'
    - 'PROCESS-NAME,transmission-qt.exe'
    - 'PROCESS-NAME,uTorrent.exe'
    - 'PROCESS-NAME,Folx.exe'
    - 'PROCESS-NAME,WebTorrent.exe'
    - 'PROCESS-NAME,WebTorrent Helper.exe'
```

[MihomoRules/Source/Addition/DirectProcess.yaml at 919ff01d1e5af2a79c2f749e4311a32695778cc4 - Ckrvxr/MihomoRules](https://github.com/Ckrvxr/MihomoRules/blob/919ff01d1e5af2a79c2f749e4311a32695778cc4/Source/Addition/DirectProcess.yaml#L52C22-L99C28)

[clash 开了代理，怎么写规则，避免 pt 走代理？ - V2EX](https://www.v2ex.com/t/757230)

[如何优雅的让 BT， PT 不走代理 - V2EX](https://v2ex.com/t/917601)
- [OpenClash BT/PT 直连的几种方式 -- Poly Space](https://www.p-chao.com/2024-02-15/openclash-bt-pt-%E7%9B%B4%E8%BF%9E%E7%9A%84%E5%87%A0%E7%A7%8D%E6%96%B9%E5%BC%8F/)


[^topdown]: Computer Networking：A Top-Down Approach