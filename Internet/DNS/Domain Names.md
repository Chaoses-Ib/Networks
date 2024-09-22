# Domain Names
## Registration
Registrars:
- [Cloudflare Registrar](https://www.cloudflare.com/products/registrar/)
- [NameSilo](https://www.namesilo.com/)
- [Name.com](https://www.name.com/)
- [Namecheap](https://www.namecheap.com/)
- [Dynadot](https://www.dynadot.com/)
- [GoDaddy](https://www.godaddy.com/)
- [Google Domains](https://domains.google/)
- [porkbun](https://porkbun.com/)
- [Z.com](https://web.z.com/domain/)
- China
  - [万网](https://wanwang.aliyun.com/)
  - [DNSPod](https://www.dnspod.cn/)
  - [西部数码](https://www.west.cn/services/domain/)
  - [新网](https://www.xinnet.com/domain/domain.html)
  - [爱名网](https://www.22.cn/)

Free[^free-iyideng]:
- [Freenom](https://www.freenom.com/)
  
  .tk, .ml, .ga, .cf, .gq
- [.me](https://nc.me/)
- [names.co.uk](https://www.names.co.uk/)
  
  .uk, .co.uk
- [.gw.to](http://gw.to/)
- [.pp.ua](http://pp.ua/)
- [.eu.org](https://nic.eu.org/)

Price comparison:
- [Compare Prices of All Top-Level Domains | TLD List](https://tld-list.com/)
- [Domain Availability and Price Comparison](https://www.domcomp.com/)

## Lookup
- [域名查询 (feifanju.com)](https://lab.feifanju.com/domain-query/)

## Transfers
> Your registrar _may_ deny a transfer request in the following limited circumstances:
> 
> - Evidence of fraud
> - Reasonable dispute over the identity of the person authorizing the transfer
> - Domain name is on hold due to payment owed for a previous registration period (including credit card charge-backs)
> - Express written objection from the domain name holder
> - Domain name is in "Lock" status (Registrars must provide a readily accessible and reasonable means for name holders to remove the lock status. Contact your registrar for assistance.)
> - Domain name is within 60 days of initial registration
> - Domain name is within 60 days of a previous transfer
> 
> Your registrar is required to specify a reason when denying your transfer request unless they are required. Contact either the current registrar or the registrar you wish to transfer to for information on the denial.
> 
> Your registrar _must_ deny a transfer request in the following limited circumstances:
> 
> - Domain name is the subject of a UDRP proceeding
> - Domain name is subject to a court order by a court of competent jurisdiction
> - Domain name is the subject of a TDRP proceeding
> - Domain name is the subject of a URS proceeding or URS suspension
> - Domain name is subject to 60-Day Change of Registrant lock
> 
> [^icann-faq]

## China
国内服务器会检测 HTTP 请求的 Host 和 HTTPS 请求的 SNI，根据备案服务号获取备案域名，不符合时拦截。Host 为 IP 时不受影响。

国内注册的域名需要实名认证才能解析，同时国内服务器需要备案才能使用，备案需要实名认证的域名。
- 国外注册域名的话就不能用国内服务器。
- 用国外服务器不需要备案，但国内注册域名的话还是需要实名认证。

[阿里云ICP备案流程概述\_备案(ICP Filing)-阿里云帮助中心](https://help.aliyun.com/zh/icp-filing/basic-icp-service/user-guide/icp-filing-application-overview)

[备案与DNS解析会有哪些问题\_云解析DNS(DNS)-阿里云帮助中心](https://help.aliyun.com/zh/dns/icp-and-dns)
- 域名解析与备案并无直接关联，也就是指即使网站未备案或者备案中，这并不影响域名解析的设置和解析的生效，但是网站未备案或者备案中，则会直接影响网站的访问与使用。

备案与服务商绑定，与 IP 只在经营性时绑定，换服务商要重新接入，同服务商换 IP 只有经营性时要改备案：
- [ICP备案服务器及接入信息变更检查\_备案(ICP Filing)-阿里云帮助中心](https://help.aliyun.com/zh/icp-filing/basic-icp-service/icp-filing-server-access-information-change-check)
  
  > 如果互联网信息服务已经取得ICP备案号，但您的服务器IP或者服务器提供商变更，您需根据以下项目进行检查。
  > - 互联网信息服务已通过阿里云ICP备案成功，现在要更换成阿里云的其他服务器，需根据以下场景进行操作。
  >   - 如果您的互联网信息服务不涉及经营性备案，则只需修改域名解析，将域名指向新服务器即可，无需重新ICP备案。
  >   - 如果您的互联网信息服务需要做经营性备案，且ICP备案所在省份要求备案报备IP需与域名实际指向的IP保持一致，则您需要在阿里云ICP代备案系统操作变更备案，更改ICP备案的IP。详细信息请参见[经营性备案的IP注意事项](https://help.aliyun.com/zh/icp-filing/basic-icp-service/business-for-the-record#section-3d7-7bf-sxl)。公安联网备案和经营性备案是否需要做变更操作来修改备案IP以及修改方法，需自行和当地相关部门咨询确认。
  > - 互联网信息服务已通过其他服务商备案成功并取得ICP备案号，现在互联网信息服务更换到阿里云服务器上（或子域名指向阿里云服务器），因ICP备案接入商有变更，所以需要在阿里云接入备案。详细信息请参见[接入备案流程](https://help.aliyun.com/zh/icp-filing/access-to-the-registration-process#task-1580330)。
  > - 如果您已经通过阿里云备案成功，现需要将服务商更换为其他服务商，您需要将ICP备案信息接入新的服务商，具体接入流程可咨询您的新服务商。

History:
- 2013-06 [注册域名是国内的好，还是国外的好啊 - V2EX](https://www.v2ex.com/t/70957)
- 2014-10 [就算我新手吧，请问大家域名不放国内，放国外的原因？ - V2EX](https://cn.v2ex.com/t/139120?p=1)
- 2018-01 [请教国外注册域名国内备案。 - V2EX](https://www.v2ex.com/t/419642)
  - 备案需要实名认证的域名，但国外没有实名认证。
- 2018-01 [国外域名怎么使用国内服务器，比如阿里云？ - V2EX](https://cn.v2ex.com/t/422870)
  - 部分域名无法转入国内进行实名认证。
- 2022-05 [已备​案的域名托管到cf 是不是容易被审查以及掉备​案？-美国VPS综合讨论-全球主机交流论坛](https://hostloc.com/thread-1021509-1-1.html)
  - > 按照北岸要求，www和@记录是必须解析到接入北岸的服务商的，你套cf就成国外ip了，如果北岸信息是你本人的，他们会联系你整改，而不会直接注销北岸。之前也在西部数码买了一个域名，但是在腾讯云北岸的，为了保留北岸，www和@特地挂了一个静态页到腾讯云对象存储。
  - > 您的域名：xxx.ltd，被工信部通报为境外IP：1.0.0.1;172.67.137.50;104.21.26.162，请在2021年5月18日之前完成整改，将域名指向为景安国内IP，如未在规定时间内完成整改，您的北岸将会被取消接入。
- 2022-10 [国外买的域名可以用国内 dns 吗？ - V2EX](https://fast.v2ex.com/t/891461)
- 2022-11 [关于国内域名和国外服务器 - V2EX](https://www.v2ex.com/t/894891)
  - 不备案无法使用国内服务器。
- 2022-12 [腾讯云域名不备案连 8000 端口都不能用了，其它端口等待验证 - V2EX](https://www.v2ex.com/t/904794)
- 2023-06 [关于购买域名 - V2EX](https://origin.v2ex.com/t/950703)
  - 国内注册的域名不实名认证无法解析。
  - 使用国外服务器不需要备案。
- 2023-06 [在DNSPOD备案过的域名可以托管到CF吗](https://www.nodeseek.com/post-8493-1)
  - > 昨天被联系过，备案的不允许用境外CDN
- 2023-09 [\[中国大陆地域\] 未备案的情况下, 能否使用服务器 IP 直接访问服务器资源?](https://www.nodeseek.com/post-24785-1)
- 2024-02 [国内域名已过备案可以托管到cf吗？ - 开发调优 - LINUX DO](https://linux.do/t/topic/12245)
- 2024-07 [请教，关于Cloudflare代理国内域名？ - 开发调优 - LINUX DO](https://linux.do/t/topic/131769)
  - > 备案域名的主域名及www域名应当直接解析内地服务器，不建议挂CF的CDN，因为影响备案审查
- 2024-07 [国内网站使用 CloudFlare 会掉备案吗？ - 明月登楼的博客](https://www.imydl.com/wzjs/18518.html)
  > 网站使用 CloudFlare 的是 CDN 服务，回源请求的服务器依旧是中国大陆的服务器和 IP，跟备案域名时绑定的是一致的。并且，国内服务器目前明月还没发现和听说哪家禁止 CloudFlare 节点 IP 回源请求的，实测的服务器有阿里云、腾讯云、五洛云等等。明月自己代维和托管的国内备案的域名、服务器都使用 CloudFlare 快一年了，从来没听说哪个备案掉了的，甚至有客户专门咨询过云服务器客服，得到的答案都是“不违规，不会影响备案状态”。

[^free-iyideng]: [2023年最好的免费域名注册平台网站大全（长期更新，建议收藏） - 一灯不是和尚](https://iyideng.net/welfare/best-free-domain-name-registration-platform.html)
[^icann-faq]: [FAQs for Registrants: Transferring Your Domain Name - ICANN](https://www.icann.org/resources/pages/name-holder-faqs-2017-10-10-en)