# Application Acceleration
[网络加速原理与方法：静态CDN、动态CDN、全站加速、GAAP、AIA、CLB跨地域部署_cdn动态加速和静态加速_邓大帅的博客 - CSDN博客](https://blog.csdn.net/deng_xj/article/details/109679797)

## Tools
- [nyanpass](https://nyanpass.pages.dev/)
  - Go + Gin + Gorm
  - TS + Vite + React + antd
  - [演示站](https://demo.nyafw.com/)
    - JSON at home
  - [Telegram](https://t.me/nyanpass_tz)

  > 套餐等级 Lv1  
  > 12USDT/月 120USDT/年。全站单向流量 < 10T/日(非硬性限制)，不含充值功能。
  > 
  > 套餐等级 Lv2  
  > 20USDT/月 200USDT/年。
  > 
  > 托管：开户/换域名/取回数据收10u。  
  > 自建：代搭10u，其他暂无。  
  > 过户：需要买卖双方联系作者。收取5u手续费。包含[授权码重置、售后群tg换绑、更改绑定域名]等操作。

  [有没有人合租ny转发面板啊](https://www.nodeseek.com/post-295580-1)

## Services
### China
- 腾讯云 [全球应用加速（Global Application Acceleration Platform，GAAP）](https://cloud.tencent.com/product/gaap)
- 阿里云 [IP应用加速](https://help.aliyun.com/document_detail/113219.html)
- 网宿 Application Accelerator（APPA）

  [网宿APPA升级 提升企业信息化效率-网宿科技](https://www.wangsu.com/news/content/NEWS/620)

- [Lala转发](https://ny.lala.gg/)
  - IEPL: BGP 6x, 电信 5x, 联通 4x, 移动 3.5x
  - 45元/1T/mo, 350元/5T/永久
  - [探针](https://ny.lala.gg/tz2.html)

  [lala的转发套餐用起来如何](https://www.nodeseek.com/post-214962-1)
  > 电信入口没udp，移动入口有udp

  > 电信效果非常好，全天都不Q。移动看地区和运营商，一半移动自己的不Q，跨网跨省的Q

- [Ocent TurboX](https://ocent.net/shop/turbox/)
  - 禁止 UDP
  - 最大连接数 500~2000
  - 深港 IEPL: 1.0x, 端内 2ms
    - 需要实名认证
  - 香港 CMI: 0.1xx
  - 台湾 HiNet
  
  > Ocent 是 AkileCloud 旗下子品牌，一家专注于全球大带宽解决方案的云服务商，经营范围除了AkileCloud 已有的香港、日本、美国、台湾和英国地区的VPS外，最近还新上了便宜深港专线NAT VPS套餐

  - 2024-06 [TurboX IEPL1.0x 香港CMI 0.1x の创始人版本 限量6元/3月](https://www.nodeseek.com/post-127081-1)
  - 2024-06 [Ocent：季付6元量转发 有深港IEPL、香港CMI、台湾Hinet节点，100G](https://www.nodeseek.com/post-127132-1)
  - 2024-07 [ocent-新上流量Turbox-流量转发-深港IEPL-移动CMI-跨境网络 - VPS 超市](https://www.bestcheapvps.org/posts/ocent/ocent-turbox-iplc-iepl-hongkong-cmi-forward/)
  - 2024-10 [OCent-深港IPLC专线-Turbox流量转发回归-200GB流量月付低至25CNY - VPS 超市](https://www.bestcheapvps.org/posts/ocent/ocent-flyback-shenzhen-nat-iplc-turbox-forword-ssh/)
  - 2025-01 [\[40已收\]收个TurboX创始人版](https://www.nodeseek.com/post-233391-1)
    - > 可用性不高 速度也一般
  - 2025-01 [Ocent：TurboX，流量转发服务，有深港IEPL（电信、移动）、香港CMI、台湾Hinet节点，100GB月流量，100Mbps-1Gbps端口，季付20元-主机百科](https://zhujiwiki.com/38163/)
  - 2025-01 [Ocent 便宜深港流量转发服务Turbox增加电信入口，100G/100M/￥20一个季度起，最高1G带宽 | VPS收割者](https://www.idcoffer.com/archives/14762)

- [哪吒转发](https://tunnel.nezha.tech)
  - IP 限制 10，连接数 100
  - [探针](https://tunnel.nezha.tech/tz2.html)

- [NNR](https://nnr.moe/)
  - 25元/1T/3mo
  - 每规则最多 2~5 IP

- [GoRelay](https://gorelay.net/)
  - 接入限制 2~10 IP
  - [节点状态](https://gorelay.net/tz.html)

  [买了个gorelay转发，好后悔](https://www.nodeseek.com/post-191854-1)

  [【不收了】gorelay转发](https://www.nodeseek.com/post-289777-1)
  > 这个一坨，我都不想用 之前直接抽奖送了

- [zhuanfa.de](https://zhuanfa.de/)
  - IPv6 入口

  [国内G口 免费转发](https://www.nodeseek.com/post-287210-1)

[请推荐个人用的 IPLC - V2EX](https://v2ex.com/t/858588)

[现在还有什么好用的转发吗？](https://www.nodeseek.com/post-296290-1)

[求推荐个流量转发](https://www.nodeseek.com/post-290203-1)

[各位鸡友，电信环境下，有什么个人使用的好的中转方案？请推荐](https://www.nodeseek.com/post-1040-1)

#### HTTP
- [GG](https://ny.bijia.me/)
  - 不开放注册

[转发可以用在网站上吗？](https://www.nodeseek.com/post-24724-1)
> 不能，大部分转发都严管这一块，默认禁TLS443等，转发web网站如同直接炸车，很容易被通报

[【已收】收个转发，无敏感内容但需要支持http，推流](https://www.nodeseek.com/post-120414-1)
