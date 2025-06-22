# CrowdSec
[GitHub](https://github.com/crowdsecurity/crowdsec)

> The open-source and participative security solution offering crowdsourced protection against malicious IPs and access to the most advanced real-world CTI.

Fail2Ban + WAF/IPS + cloud

- OS: [Linux](https://doc.crowdsec.net/u/getting_started/installation/linux), [Windows](https://docs.crowdsec.net/docs/getting_started/install_windows/), macOS
- Linux
  - `systemctl restart crowdsec.service`
  - `/var/log/crowdsec.log`
- Windows
  - `C:\ProgramData\CrowdSec\log\crowdsec.log`
  - [crowdsecurity/cs-windows-firewall-bouncer: Crowdsec bouncer for the Windows Firewall](https://github.com/crowdsecurity/cs-windows-firewall-bouncer)
    - .NET
  - `Restart-Service crowdsec`
- [Network Management | CrowdSec](https://docs.crowdsec.net/docs/configuration/network_management/)
  - 8080, 6060
    
    [\[Security Engine\] How to change the default port? -- Crowdsec](https://support.crowdsec.net/hc/en-gb/articles/10831013001234--Security-Engine-How-to-change-the-default-port)

    [Change 8080 port - Issue #552 - crowdsecurity/crowdsec](https://github.com/crowdsecurity/crowdsec/issues/552)
- `cscli metrics`

[Crowdsec Tour | CrowdSec](https://docs.crowdsec.net/docs/getting_started/crowdsec_tour)
- [Troubleshoot | CrowdSec](https://docs.crowdsec.net/u/getting_started/post_installation/troubleshoot)

[CrowdSec Pricing Plans](https://www.crowdsec.net/pricing):
- Free/Community

  Many limits, but still has all the features of Fail2Ban?
- Enterprise: $29/mo

[Crowdsec: A Fail2Ban alternative written in Go | Hacker News](https://news.ycombinator.com/item?id=24826792)

2022-01 [should i replace fail2ban with crowdsec? : r/selfhosted](https://www.reddit.com/r/selfhosted/comments/sesz1b/should_i_replace_fail2ban_with_crowdsec/)
> In essence they both work somewhat the same way: both tools read log and detect attacks and subsequently blocks/mitigate those attacks. There are major differences though:
> - By default CrowdSec shares information about the logs it sees with the community. It does so in an anonymous way (it literally only collects the ip of the offender, a timestamp and which type of attack it detected). This means that other CrowdSec users in a similar environment by default will block those ips that attacks you (and vice versa).
> 
> - CrowdSec is able to detect way more advanced attacks such as slow brute-force, distributed brute force attacks and various layer 7 attacks such as xss, sqli, various resource abuse attacks, bot scraping and much more.
> 
> - CrowdSec is able to block traffic at multiple layers (think OSI). It is able to block at layer 3 using host firewall or at layer 7 directly within various applications such as nginx, wordpress, any python flask application, in traefik and many, many more. It can also block in Cloudflare. Some months ago we wrote an article on how to protect a [WooCommerce site that uses Cloudflare (free tier) against L7 DDoS](https://crowdsec.net/blog/how-to-beat-application-ddos/). It does so very effectively as you can see. In principle you could do the same (I think, I haven't tried). An interesting thing to note is that it doesn't block the attackers per se; it forces them through a CAPTCHA meaning that human users would never be cut off.

[Crowdsec or fail2ban? : r/selfhosted](https://www.reddit.com/r/selfhosted/comments/1j1phvh/crowdsec_or_fail2ban/)

[Crowdsec or fail2ban? --- LowEndTalk](https://lowendtalk.com/discussion/185498/crowdsec-or-fail2ban)
> crowdsec use a lot more cpu and slow down my high traffic workloads

[CrowdSec Needed? : r/selfhosted](https://www.reddit.com/r/selfhosted/comments/16ivy91/crowdsec_needed/)

## Console
[CrowdSec Console | CrowdSec](https://doc.crowdsec.net/u/getting_started/post_installation/console)

Pricing:
- Free
  - Instances unlimited
- Enterprise
  - Instances unlimited
    - Abuse?
  - Auto-enrollment of instances

## Security Engine
[Concepts | CrowdSec](https://docs.crowdsec.net/docs/concepts/)
The Security Engine runtime revolves around a few simple concepts:
- It reads logs (defined via [datasources](https://docs.crowdsec.net/docs/data_sources/intro) configuration)
- Those logs are parsed via [parsers](https://docs.crowdsec.net/docs/parsers/intro) and eventually [enriched](https://docs.crowdsec.net/docs/parsers/enricher)
- Those normalized logs are matched against the [scenarios](https://docs.crowdsec.net/docs/scenarios/intro) that the user has deployed
- When a scenario is "triggered", CrowdSec generates an [alert](https://docs.crowdsec.net/docs/concepts#alerts) and eventually one or more associated [decisions](https://docs.crowdsec.net/docs/concepts#decisions):
    - The alert is here mostly for traceability and will stay even after the decision expires
    - The decision, on the other hand, is short-lived and tells *what* action should be taken against the offending IP/range/user...
- This information (the signal, the associated decisions) is then sent to [Local API](https://docs.crowdsec.net/docs/local_api/intro) and stored in the database

Applications:
- Nginx
  - [nginx-logs Log parser](https://app.crowdsec.net/hub/author/crowdsecurity/log-parsers/nginx-logs)
  - [nginx-req-limit-exceeded Scenario](https://app.crowdsec.net/hub/author/crowdsecurity/scenarios/nginx-req-limit-exceeded)

    > IP is banned if it violates nginx's user set request limit more than 5 times in a minute.

### Installation
How to auto add new datasources/parsers/scenarios like in a fresh installation?
- [wizard.sh](https://github.com/crowdsecurity/crowdsec/blob/master/wizard.sh)

  [Manual installation | CrowdSec](https://docs.crowdsec.net/u/user_guides/building/)
- Reinstall: `apt remove --purge` + `apt install`

  The instance need to be enrolled again.

### Collections
- `cscli collections list`

### Datasources
`/etc/crowdsec/acquis.yaml`:
```yaml
#Generated acquisition file - wizard.sh (service: nginx) / files : /var/log/nginx/access.log
filenames:
  - /var/log/nginx/access.log
labels:
  type: nginx
---
#Generated acquisition file - wizard.sh (service: ssh) / files : 
journalctl_filter:
 - _SYSTEMD_UNIT=ssh.service
labels:
  type: syslog
---
```
[Adding a new Acquisition | CrowdSec](https://docs.crowdsec.net/u/getting_started/post_installation/acquisition_new/)

- [File(s) | CrowdSec](https://docs.crowdsec.net/docs/data_sources/file)

  > By default, if a glob pattern does not match any files in an existing directory, this directory will not be watched for new files (ie, `/var/log/nginx/*.log` does not match, but `/var/log/nginx/` exists). You can override this behaviour with the `force_inotify` parameter, which will put a watch on the directory.

  [Not a standard directory for logs - crowdsec - CrowdSec](https://discourse.crowdsec.net/t/not-a-standard-directory-for-logs/152/8)

`cscli metrics`

### Decisions
- Blocklists
  - [Community Blocklist](https://docs.crowdsec.net/docs/next/central_api/community_blocklist/)
    - 15876, IPv6: 35704
  - [Free proxies list | Blocklist](https://app.crowdsec.net/blocklists/65a567bdec04bcd4f51670bd)
    - 5943
  - Firehol
    - [Firehol cruzit.com list | Blocklist](https://app.crowdsec.net/blocklists/65a56c0b0469607d9badb812)
      - 13252
    - [Firehol voipbl.org list | Blocklist](https://app.crowdsec.net/blocklists/65a56c290469607d9badb815)
      - [VoIP Blacklist](https://voipbl.org/)
    - [Firehol greensnow.co list | Blocklist](https://app.crowdsec.net/blocklists/65a56c520469607d9badb817)
      - 100% already reported
  - [OTX Web Scanners List | Blocklist](https://app.crowdsec.net/blocklists/65a56c010469607d9badb80f)
    - 78% already reported
  - [IP Lookup](https://app.crowdsec.net/cti)
    - 30 queries max per week
  - Free plan can only access to third-party blocklists up to 3
  - Allowlists are paid
  - Cannot create custom thrid-party blocklists?
- CAPI Decisions Management is paid.

## Remediation Components (bouncers)
[Introduction | CrowdSec](https://docs.crowdsec.net/u/bouncers/intro)

- `cscli bouncers list`

[Remediation Components for Threat Response | CrowdSec Hub](https://app.crowdsec.net/hub/remediation-components):
- [crowdsecurity/cs-firewall-bouncer: Crowdsec bouncer written in golang for firewalls](https://github.com/crowdsecurity/cs-firewall-bouncer)
  - [Manual installation](https://doc.crowdsec.net/u/bouncers/firewall/#manual-installation)
    - `cscli bouncers add crowdsec-firewall-bouncer`
    - `sudo systemctl enable --now crowdsec-firewall-bouncer`
    - `cscli bouncer inspect crowdsec-firewall-bouncer`
  - `/var/log/crowdsec-firewall-bouncer.log`
  
  iptables:
  ```sh
  -P INPUT ACCEPT
  -P FORWARD ACCEPT
  -P OUTPUT ACCEPT
  -N CROWDSEC_CHAIN
  -A INPUT -j CROWDSEC_CHAIN
  -A CROWDSEC_CHAIN -m set --match-set crowdsec-blacklists-1 src -m comment --comment "CrowdSec: lists:free_proxies" -j DROP
  -A CROWDSEC_CHAIN -m set --match-set crowdsec-blacklists-0 src -m comment --comment "CrowdSec: CAPI" -j DROP
  ```

- [crowdsecurity/cs-windows-firewall-bouncer: Crowdsec bouncer for the Windows Firewall](https://github.com/crowdsecurity/cs-windows-firewall-bouncer)
  - .NET

- [Nginx](https://docs.crowdsec.net/u/bouncers/nginx/)
  - [crowdsecurity/cs-nginx-bouncer: CrowdSec bouncer for Nginx](https://github.com/crowdsecurity/cs-nginx-bouncer)
  - [crowdsecurity/cs-openresty-bouncer: CrowdSec bouncer for OpenResty](https://github.com/crowdsecurity/cs-openresty-bouncer)

- Caddy: [hslatman/caddy-crowdsec-bouncer: A Caddy module that blocks malicious traffic based on decisions made by CrowdSec.](https://github.com/hslatman/caddy-crowdsec-bouncer)

## CDN
- [cdn-whitelist Postoverflow](https://app.crowdsec.net/hub/author/crowdsecurity/postoverflows/cdn-whitelist)
- How to use real IP from CDN?
  - First, all datasources must be configured to output the real IP.
  - Second, all bouncers must block requests according to the real IP.
