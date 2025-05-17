# [BitTorrent](http://www.bittorrent.org/)
[Wikipedia](https://en.wikipedia.org/wiki/BitTorrent)

> BitTorrent is a popular P2P protocol for file distribution. In BitTorrent lingo, the collection of all peers participating in the distribution of a particular file is called a **torrent**. Peers in a torrent download equal-size **chunks** of the file from one another, with a typical chunk size of 256 KBytes.[^topdown]

## Trackers
> Each torrent has an infrastructure node called a **tracker**. When a peer joins a torrent, it registers itself with the tracker and periodically informs the tracker that it is still in the torrent. In this manner, the tracker keeps track of the peers that are participating in the torrent. A given torrent may have fewer than ten or more than a thousand peers participating at any instant of time.[^topdown]

- [ngosang/trackerslist: Updated list of public BitTorrent trackers](https://github.com/ngosang/trackerslist)
- [XIU2/TrackersListCollection: 🎈 Updated daily! A list of popular BitTorrent Trackers!](https://github.com/XIU2/TrackersListCollection)

## Clients
- [BitComet](https://bitcomet.com/)
  - [Changelog](https://bitcomet.com/en/changelog)
  - Scoop
    ```pwsh
    scoop bucket add xrgzs_sdoog https://github.com/xrgzs/sdoog
    scoop install xrgzs_sdoog/bitcomet
    ```
    蓝奏云、更新及时

  [彗星論壇](https://www.cometbbs.com/)

[Comparison of BitTorrent clients - Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_BitTorrent_clients)

## [→NAT](../../Internet/NAT.md#bt)

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

[MihomoRules/Source/Addition/DirectProcess.yaml at 919ff01d1e5af2a79c2f749e4311a32695778cc4 - Ckrvxr/MihomoRules](https://github.com/Ckrvxr/MihomoRules/blob/919ff01d1e5af2a79c2f749e4311a32695778cc4/Source/Addition/DirectProcess.yaml#L52C22-L99C28)

[clash 开了代理，怎么写规则，避免 pt 走代理？ - V2EX](https://www.v2ex.com/t/757230)

[如何优雅的让 BT， PT 不走代理 - V2EX](https://v2ex.com/t/917601)
- [OpenClash BT/PT 直连的几种方式 -- Poly Space](https://www.p-chao.com/2024-02-15/openclash-bt-pt-%E7%9B%B4%E8%BF%9E%E7%9A%84%E5%87%A0%E7%A7%8D%E6%96%B9%E5%BC%8F/)


[^topdown]: Computer Networking：A Top-Down Approach