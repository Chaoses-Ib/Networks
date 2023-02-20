# Secure Shell
[Wikipedia](https://en.wikipedia.org/wiki/Secure_Shell)

```sh
ssh remote_username@host
```

## Implementations
- [OpenSSH](http://www.openssh.com/) ([GitHub](https://github.com/openssh/openssh-portable))
  - [Windows for OpenSSH](https://github.com/PowerShell/openssh-portable)
- [PuTTY](https://www.chiark.greenend.org.uk/~sgtatham/putty/) ([GitHub](https://github.com/github/putty))

  PuTTY is a free and open-source terminal emulator, serial console and network file transfer application. It supports several network protocols, including SCP, SSH, Telnet, rlogin, and raw socket connection. It can also connect to a serial port. The name "PuTTY" has no official meaning.

- [Xshell](https://www.netsarang.com/en/xshell/)

[SSH implementation comparison](https://ssh-comparison.quendi.de/)

[Comparison of SSH servers - Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_SSH_servers)

[Comparison of SSH clients - Wikipedia](https://en.wikipedia.org/wiki/Comparison_of_SSH_clients)

## Host keys
To create SSH protocol version 2 keys, use the ssh-keygen program that comes with OpenSSH:
```sh
# ssh-keygen [-q] [-b bits] [-t dsa | ecdsa | ed25519 | rsa] [-N new_passphrase] [-C comment] [-f output_keyfile] [-m format]
ssh-keygen -t rsa -N '' -f /etc/ssh/ssh_host_rsa_key 
ssh-keygen -t dsa -N '' -f /etc/ssh/ssh_host_dsa_key
```

For the version 1 keys, use
```sh
ssh-keygen -t rsa1 -N '' -f /etc/ssh/ssh_host_key 
```

[How To Set up SSH Keys on a Linux / Unix System - nixCraft](https://www.cyberciti.biz/faq/how-to-set-up-ssh-keys-on-linux-unix/)

```sh
ssh-copy-id -i $HOME/.ssh/id_rsa.pub remote_username@host
```
