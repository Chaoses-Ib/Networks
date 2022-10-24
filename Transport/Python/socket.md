# [socket](https://docs.python.org/3/library/socket.html)
## send
### send() 和 sendall() 的区别是什么？
`send()` 相比 `sendall()` 更加原始，它不保证数据全部被发送，而 `sendall()` 能够保证。[^sendall]

[^sendall]: [What is the difference between socket.send() and socket.sendall()? - Stack Overflow](https://stackoverflow.com/questions/34252273/what-is-the-difference-between-socket-send-and-socket-sendall)

## recv
### ConnectionAbortedError
`ConnectionAbortedError: [WinError 10053] 你的主机中的软件中止了一个已建立的连接。`
为什么 server 断开连接时 client 会异常，而 client 断开时 server 却不会异常？

### Timeout
- socket.settimeout()
  
  socket.timeout
- select.select()