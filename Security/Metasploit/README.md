# [Metasploit](https://www.metasploit.com/)
## Editions
- [Metasploit Framework](https://github.com/rapid7/metasploit-framework)

  [Documentation](https://docs.metasploit.com/)
- Metasploit Pro
  
  [Documentation](https://docs.rapid7.com/metasploit/)

[Comparison](https://www.rapid7.com/products/metasploit/download/editions/)

## UI
- TUI
  - Framework: `/opt/metasploit/app/msfconsole`
  - [Pro Console](https://docs.rapid7.com/metasploit/about-the-pro-console): `/opt/metasploit/msfpro`
- CLI
  - `/opt/metasploit/app/msfconsole -[xr]`
  - msfcli [(deprecated)](https://www.rapid7.com/blog/post/2015/07/10/msfcli-is-no-longer-available-in-metasploit/)
- [Web](https://docs.rapid7.com/metasploit/metasploit-web-interface-overview): https://localhost:3790/

## Service
Installing Metasploit as a service adds an init script that calls `ctlscript.sh`, which enables you to start, stop, and restart the Metasploit service.

ctlscript.sh:
```sh
usage: /opt/metasploit/ctlscript.sh help
       /opt/metasploit/ctlscript.sh (start|stop|restart|status)
       /opt/metasploit/ctlscript.sh (start|stop|restart|status) postgresql
       /opt/metasploit/ctlscript.sh (start|stop|restart|status) prosvc
       /opt/metasploit/ctlscript.sh (start|stop|restart|status) metasploit
       /opt/metasploit/ctlscript.sh (start|stop|restart|status) worker

help       - this screen
start      - start the service(s)
stop       - stop  the service(s)
restart    - restart or start the service(s)
status     - show the status of the service(s)
```

Manually start PostgreSQL:
```sh
sudo /opt/metasploit/ctlscript.sh start postgresql
```

## Metasploitable
Metasploitable is a vulnerable virtual machine intentionally designed for testing common vulnerabilities.

- [Metasploitable3](https://github.com/rapid7/metasploitable3)

  [Metasploitable3: An Intentionally Vulnerable Machine for Exploit Testing | Rapid7 Blog](https://www.rapid7.com/blog/post/2016/11/15/test-your-might-with-the-shiny-new-metasploitable3/)

  [Vulnerabilities](https://github.com/rapid7/metasploitable3/wiki/Vulnerabilities)

  Images:
  - [metasploitable3-ub1404upgraded download | SourceForge.net](https://sourceforge.net/projects/metasploitable3-ub1404upgraded/)
  - [brimstone/metasploitable3](https://github.com/brimstone/metasploitable3/releases)
- [Metasploitable 2](https://docs.rapid7.com/metasploit/metasploitable-2/)

  [Metasploitable 2 Exploitability Guide](https://docs.rapid7.com/metasploit/metasploitable-2-exploitability-guide)
  - [Metasploitable - charlesreid1](https://charlesreid1.com/wiki/Metasploitable)
  - [Metasploitable 2 - A Walkthrough of The Most Interesting Vulnerabilities](https://www.hackingloops.com/metasploitable-2/)
  - [Metasploitable 2: Port 80. Welcome back to part IV in the… | by Miguel Sampaio da Veiga | Hacker Toolbelt | Medium](https://medium.com/hacker-toolbelt/metasploitable-2-iv-port-80-5b90a0a22cb6)

  Docker images:
  - [tleemcjr/metasploitable2](https://hub.docker.com/r/tleemcjr/metasploitable2)
