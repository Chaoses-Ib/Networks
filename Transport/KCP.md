# KCP
[GitHub](https://github.com/skywind3000/kcp)

> KCP是一个快速可靠协议，能以比 TCP 浪费 10%-20% 的带宽的代价，换取平均延迟降低 30%-40%，且最大延迟降低三倍的传输效果。纯算法实现，并不负责底层协议（如UDP）的收发，需要使用者自己定义下层数据包的发送方式，以 callback的方式提供给 KCP。 连时钟都需要外部传递进来，内部不会有任何一次系统调用。
> 
> 整个协议只有 ikcp.h, ikcp.c两个源文件，可以方便的集成到用户自己的协议栈中。也许你实现了一个P2P，或者某个基于 UDP的协议，而缺乏一套完善的ARQ可靠协议实现，那么简单的拷贝这两个文件到现有项目中，稍微编写两行代码，即可使用。

- RTO x2 / x1.5
- 选择性重传
- 快速重传
- 延迟ACK / 非延迟ACK
- ACK+UNA
- 非退让流控

> 中国的网络情况比较特殊，会存在有些网络 UDP连接不上的情况，因此都是先连接 TCP，然后试图 UDP，UDP不通的情况下，退回 TCP也能正常游戏，一旦 TCP断开，则认为 UDP也断开了。

[kcptun 转发tcp包原理上是否真的能提速？ - Issue #659 - xtaci/kcptun](https://github.com/xtaci/kcptun/issues/659)

Used by many games and tunnels.
- [《原神》也在使用 KCP 加速游戏消息 - Skywind Inside](https://skywind.me/blog/archives/2706)

## Libraries
C++:
- [skywind3000/kcp: :zap: KCP - A Fast and Reliable ARQ Protocol](https://github.com/skywind3000/kcp)
- Boost.Asio
  - [asio\_kcp: combine kcp with boost::asio. - kcp: a Fast and Reliable udp protocal.](https://github.com/libinzhangyuan/asio_kcp) (discontinued)

    > 使用 KCP的完整 UDP网络库，完整实现了基于 UDP的链接状态管理，会话控制，KCP协议调度等
  - [sniper00/asio-kcp: Use kcp with asio and modern C++, support `async_accept`, `async_connect`, `async_read`, `async_read_some` and can use with asio coroutine.](https://github.com/sniper00/asio-kcp)

    > c++的asio/kcp支持，支持asio协程等现代c++异步模型
- [yasio: A multi-platform support c++11 library with focus on asio (asynchronous socket I/O) for any client applications.](https://github.com/simdsoft/yasio)

  > 一个跨平台专注于任意客户端程序的异步socket库, 易于使用，相同的API操作KCP/TCP/UDP, 性能测试结果: [benchmark-pump](https://github.com/yasio/yasio/blob/master/benchmark.md).
- [Unit-X/kcp-cpp: C++ Wrapper around KCP](https://github.com/Unit-X/kcp-cpp)

  > KCP 的多平台（Windows、MacOS、Linux）C++ 实现作为应用程序中的简单库。包含适用于所有平台的套接字处理和辅助函数。

Rust:
- [Matrix-Zhang/kcp: Reliable-UDP Library for Rust](https://github.com/Matrix-Zhang/kcp)
  - [tokio\_kcp: A Kcp implementation for tokio](https://github.com/Matrix-Zhang/tokio_kcp)

  [探秘KCP：Rust版可靠UDP库的奇妙之旅-CSDN博客](https://blog.csdn.net/gitblog_00091/article/details/139434136)
- [b23r0/kcp-rust-native: KCP bindings for Rust](https://github.com/b23r0/kcp-rust-native)
- [Ekho: An ICMP-based Proxy](https://github.com/ma-chengyuan/ekho)

  [Rust 实现带 BBR 的高效魔改 KCP](https://danglingpointer.fun/posts/KCP)
- [en/kcp-rs: A KCP implementation in Rust](https://github.com/en/kcp-rs) (discontinued)

Go:
- [xtaci/smux: A Stream Multiplexing Library for golang with least memory usage(like TDMA)](https://github.com/xtaci/smux)

## Tools
- [kcptun: A Quantum-Safe Secure Tunnel based on QPP, KCP, FEC, and N:M multiplexing.](https://github.com/xtaci/kcptun)
  - `scoop install kcptun`
  - `./client_darwin_amd64 -r "KCP_SERVER_IP:4000" -l ":8388" -mode fast3 -nocomp -autoexpire 900 -sockbuf 16777217 -dscp 46`
  - `./server_linux_amd64 -t "TARGET_IP:8388" -l ":4000" -mode fast3 -nocomp -sockbuf 16777217 -dscp 46`
  - `--crypt none`
  - UDP
    - [Please add udp transparent packages such as dns udp packages - Issue #917 - xtaci/kcptun](https://github.com/xtaci/kcptun/issues/917)
    - [希望能增加监听UDP的功能 - Issue #942 - xtaci/kcptun](https://github.com/xtaci/kcptun/issues/942)
  - [kcp服务端如何接收用户访问的真实Ip - Issue #922](https://github.com/xtaci/kcptun/issues/922)
- [xkcptun: xkcptun is kcp tunnel for OpenWRT&LEDE, implemented in c language](https://github.com/liudf0716/xkcptun)
- [dog-tunnel: p2p tunnel,(udp mode work with kcp,https://github.com/skywind3000/kcp)](https://github.com/vzex/dog-tunnel) (discontinued)
- frp
- [gost](https://v2.gost.run/kcp/)
- V2Ray
- ~~Clash~~
  - [希望增加对kcp的支持 - Issue #184 - MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo/issues/184)
  - [\[Feature\] Support for Xray's KCP(mKCP) - Issue #1399 - MetaCubeX/mihomo](https://github.com/MetaCubeX/mihomo/issues/1399)

    > Hysteria or Hysteria2 might be a better choice than KCP and mKCP
