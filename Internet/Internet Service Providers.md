# Internet Service Providers
![](images/ISP.png)[^topdown]
- Points of presence: A PoP is simply a group of one or more routers (at the same location) in the provider’s network where customer ISPs can connect into the provider ISP.
- Multi-homing: Connecting to two or more provider ISPs.
- Peering: A pair of nearby ISPs directly connect their networks together.
- Internet exchange point: A meeting point where multiple ISPs can peer together.

[^topdown]: *Computer Networking: A Top-Down Approach*

## ISPs in different regions
### Mainland China
[^china-sjlleo-2][^china-sjlleo][^china-deepdarkfantastic]
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

[^china-deepdarkfantastic]: [国内主流网络运营商国际连接线路简谈 - 知乎](https://zhuanlan.zhihu.com/p/64467370)

### Hong Kong, China
- CMI (AS58453)
- CUG (AS10099)
- NTT
- HKT (香港电讯)
- HKBN (香港频宽)
- PCCW
- Telstra
- CHT

Quality[^china-sjlleo-2]:
- China Telecom Backbone (AS4134): CUG > CMI > Telstra > others
- China Unicom Backbone (AS4837): CUG > CMI > PCCW > CHT > HKBN/WTT > HKT > others
- CMI (AS58453): CMI > CUG > SingTel > HKIX > NTT > HKBN/WTT > others

### Taiwan, China
- Chunghwa Telecom (CHT)

### Japan
- NTT
- BBTEC (SoftBank)
- IIJ
- KDDI

[^china-sjlleo-2]: [国内至国际骨干Tier1 ISPs线路整理（2022年更新篇） - 知乎](https://zhuanlan.zhihu.com/p/451683996)
[^china-sjlleo]: [细数国内到国际的各种线路（VPS国际线路大全） - 知乎](https://zhuanlan.zhihu.com/p/161029409)