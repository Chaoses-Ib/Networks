# Internet Service Providers
![](images/ISP.png)[^topdown]
- Points of presence: A PoP is simply a group of one or more routers (at the same location) in the provider’s network where customer ISPs can connect into the provider ISP.
- Multi-homing: Connecting to two or more provider ISPs.
- Peering: A pair of nearby ISPs directly connect their networks together.
- Internet exchange point: A meeting point where multiple ISPs can peer together.

[^topdown]: *Computer Networking: A Top-Down Approach*

## ISPs in different regions
### Mainland China
[^china-sjlleo]
- China Telecom (CT, 中国电信)
  - CTGNet (AS23764)
    - CTGNet Global Internet Access (CTGNet GIA)
  - ChinaNet Next Carrying Network (CN2, AS4809)
    - CN2 Global Internet Access (CN2 GIA)
    - CN2 Global Transfer (CN2 GT)
  - China Telecom Backbone (163 骨干网, AS4134)
- China Unicom (CU, 中国联通)
  - China Unicom Global (CUG, AS10099)
  - China Unicom Industrial Internet Backbone (A网, AS9929)
  - China Unicom Backbone (169 骨干网, AS4837)
- China Mobile (CM, 中国移动)
  - China Mobile International (CMI, AS58453)
    - China Mobile Commercial Broadband (CMCB)
  - China Mobile (AS9808)
- China Education and Research Network (CERNET, 教育网, AS4538)
- China Science and Technology Network (CSTNET, 科技网, AS7497)

Quality: CN2 GIA > CUII Backbone (AS9929) > CU Backbone (AS4837) > CN2 GT > CT Backbone (AS4134) [^china-quality]

[^china-quality]: [CN2 GIA＞AS9929＞CN2 GT＞AS4837,这个排名靠谱吗 - 全球主机交流论坛](https://hostloc.com/thread-953685-1-1.html)

### Hong Kong, China
- CMI (AS58453)
- CUG (AS10099)
- NTT
- HKT (香港电讯)
- HKBN (香港频宽)
- PCCW
- Telstra
- CHT

Quality[^china-sjlleo]:
- CT Backbone (AS4134): CUG > CMI > Telstra > others
- CU Backbone (AS4837): CUG > CMI > PCCW > CHT > HKBN/WTT > HKT > others
- CMI (AS58453): CMI > CUG > SingTel > HKIX > NTT > HKBN/WTT > others

### Taiwan, China
- Chunghwa Telecom (CHT)

### Japan
- NTT
- BBTEC (SoftBank)
- IIJ
- KDDI

## Servers
Name | 混合拨号
--- | ---
[91VPS](https://www.91vps.com/) | ✔️
[纵横数据 动态拨号VPS服务器](https://www.zndata.com/dtvps/103.html) | ✔️
[拨号云 动态拨号VPS](https://www.bohaovps.com/product/bohaovps.html) | ✔️
[蚂蚁VPS](https://www.mayivps.com/) | ✔️
[米安网络](https://www.miandns.com/) | ✔️
[飞网](https://www.fwvps.com/) | ✔️

或者任何按量计费的 VPS、IP（弹性公网IP）：
- 天翼云
  
  一个服务器只能绑20条线

  [24年7月最新IP搭建教程，配合一键脚本，5分钟轻松学会，300MB独享网速 - 哔哩哔哩](https://www.bilibili.com/video/BV1Zm421V7Ve)

- 阿里云


[^china-sjlleo]: [sjlleo/local-ISPs-to-CN: Network connectivity between your local ISPs and China / 您的本地运营商和中国的网络互联情况](https://github.com/sjlleo/local-ISPs-to-CN/blob/main/report_zh_CN.md) ([国内至国际骨干Tier1 ISPs线路整理（2022年更新篇） - 知乎](https://zhuanlan.zhihu.com/p/451683996))