# Congestion Control
[Network congestion - Wikipedia](https://en.wikipedia.org/wiki/Network_congestion)

拥塞网络的代价[^topdown]：
- 当分组的到达速率接近链路容量时，分组会经历巨大的排队延迟
- 发送方必须执行重传以补偿因缓存溢出而丢弃的分组
- 发送方在遇到大时延时所进行的不必要重传会引起路由器转发不必要的分组副本
- 当一个分组沿一条路径被丢弃时，每个上游路由器用于转发该分组到丢弃该分组而使用的传输容量被浪费掉了

## 拥塞控制方法
[^topdown]
- End-to-end congestion control（端到端拥塞控制）  
  端系统通过对网络的观察来推断拥塞。

  - [TCP](TCP/Congestion%20Control.md)
  - [QUIC](QUIC/Congestion.md)
- Network-assisted congestion control（网络辅助的拥塞控制）  
  路由器向发送方提供拥塞状态反馈。

[^topdown]: Computer Networking：A Top-Down Approach