# Multiple Access Protocols
We can classify just about any multiple access protocols as belonging to one of the pthree categories:
- Channel partitioning protocols（信道划分协议）
- Random access protocols（随机接入协议）
- Taking-turns protocols（轮流协议）


## Channel partitioning protocols
- Time-division multiplexing (TDM)  
  将 $R\ bps$ 划分为 $N$ 个 slot（时隙）。

  TDM 的缺陷是节点速率会被限制为 $\frac{R}{N}$（而不是理想的 $\frac{R}{M}$），并且延迟会增大。
- Frequency-division multiplexing (FDM)  
  将 $R\ bps$ 信道划分为不同的频段。

  FDM 的缺陷是节点速率也会被限制为 $\frac{R}{N}$。
- Code division multiple access (CDMA, 码分多址)  
  为每个节点分配一个不同的编码，并让节点在发送数据时带上编码。


## Random access protocols
当节点遇到碰撞时，随机地等待一段时间后重发。

随机接入协议可以实现“当只有一个节点活跃时，节点具有 $R\ bps$ 的吞吐量”，但无法实现“当有 $M$ 个节点活跃时，每个节点具有 $\frac{R}{M}\ bps$ 的吞吐量”。

### Slotted ALOHA
- 所有帧由 $L$ 比特组成
- 时间被划分为长度为 $\frac{L}{R}$ 秒（传输一帧）的时隙
- 节点是同步的，每个节点都知道时隙何时开始
- 节点只在时隙起点开始传输帧
- 如果在一个时隙中有两个或更多个帧碰撞，则所有节点在该时隙结束之前检测到该碰撞事件
- 检测到碰撞时，发送节点以概率 $p$ 在后续的每个时隙中重传该帧，直至传输无碰撞

时隙多路访问协议的效率定义为：当有大量的活跃节点且每个节点总有大量的帧要发送时，长期运行中成功时隙的份额。

时隙 ALOHA 的效率为
$$N\cdot p(1-p)^{N-1}$$
最大值为 $\frac{1}{e}\approx 0.37$。

### ALOHA
当一个帧被传递下来时，节点立即将该帧完整地传输进广播信道。如果发生碰撞，以概率 $p$ 决定重传还是等待一个帧传输时间，等待后再以 $p$ 决定，以此类推。

ALOHA 的效率为
$$N\cdot p(1-p)^{2(N-1)}$$
最大值为 $\frac{1}{2e}\approx 0.18$。

### Carrier Sense Multiple Access
CSMA，载波侦听多路访问。
- Carrier sensing（载波侦听）  
  节点在传输前先侦听信道，如果有其它帧正在传输就先等待它传输完毕。
- Collision detection（碰撞检测）  
  因为信号的传播需要时间，只有载波侦听不足以消除碰撞。碰撞检测是指节点在传输时一直侦听信道，如果有其它帧正在传输就停止传输，并在再次载波侦听前随机等待一段时间。

  → CSMA with Collision Detection (CSMA/CD)

CSMA/CD 的效率约为
$$\frac{1}{1+5\frac{d_{prop}}{d_{trans}}}$$
其中 $d_{prop}$ 表示信号在任意两个适配器之间传播所需的最大时间，$d_{trans}$ 表示传输一个最大长度的 Ethernet 帧的时间。$d_{prop}$ 越小，碰撞终止越快；$d_{trans}$ 越大，每帧占用信道时间越长，碰撞越少。


## Taking-turns protocols
为了克服随机接入协议的缺陷，。

### Polling protocol
轮询协议中指定了一个主节点，让它以循环的方式轮询（poll）每个节点，通知各个节点它能够传输的帧的最大数量。虽然轮询协议不会产生碰撞和空时隙，但会引入轮询时延，而且存在单点故障问题。

轮询协议包括 802.15 协议和 Bluetooth 协议。

### Token-passing protocol
令牌传递协议中，一个称为 token（令牌）的小的特殊帧会在节点之间以某种固定次序进行交换，每个节点只在有帧要发送时才持有令牌。


## Data-Over-Cable Service Interface Specifications
在一个电缆接入网中，几千个住宅 cable modem（电缆调制解调器）会与一个 cable modem termination system (CMTS, 电缆调试解调器端接系统)。DOCSIS 使用 FDM 划分下行（CMTS 到 cable modem）和上行（cable modem 到 CMTS）：
- 每个下行信道宽 6 Mhz，具有约 40 Mbps 的吞吐量
  
  只有 CMTS 会进行传输，因此不存在碰撞问题。
- 每个上行信道宽 6.4 Mhz，具有约 30 Mbps 的吞吐量
  
  为了解决碰撞问题，将上行信道划分为时间间隔，每个时间间隔包括一个微时隙序列。需要发送数据的 cable modem 会在一段特殊的微时隙间隔内向 CMTS 发送微时隙请求帧，由 CMTS 来准许各个 cable modem 在特定的微时隙中进行传输，从而避免碰撞。但是微时隙请求帧是可能发生碰撞的，cable modem 无法侦听信道，只能在没有收到微时隙分配响应时，使用二进制指数回退重新发送请求。

电缆接入网应用了 FDM、TDM、随机接入和集中分配时隙。