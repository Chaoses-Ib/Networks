# Hostnames
[Wikipedia](https://en.wikipedia.org/wiki/Hostname)

## Linux
- `/etc/hostname`
  - CLI: `hostname`
- `/etc/machine-info`
  - CLI: `hostnamectl --pretty`

[linux - How to get the computer name (not its hostname)? - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/254599/how-to-get-the-computer-name-not-its-hostname)

## Windows
[ComputerName | Microsoft Learn](https://learn.microsoft.com/en-us/windows-hardware/customize/desktop/unattend/microsoft-windows-shell-setup-computername)
> In Windows 10, users can no longer enter a computer name during OOBE as the name is auto-generated. To set a default computer name pre-OOBE, OEMs can configure `ComputerName` in the `Unattend.xml` file and specify a name for the computer. After OOBE, end users can change this default computer name after OOBE by changing it in the **System Properties** page.

Default:
- Windows 7+: `DESKTOP-XXXXXXX`

  [windows 10 - How are Dell's default computer names (DESKTOP-XXXXXX) generated? - Super User](https://superuser.com/questions/1224430/how-are-dells-default-computer-names-desktop-xxxxxx-generated)

[Computer Names - Win32 apps | Microsoft Learn](https://learn.microsoft.com/en-us/windows/win32/sysinfo/computer-names)

API:
- [GetComputerNameW](https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-getcomputernamew)
- [GetComputerNameExW](https://learn.microsoft.com/en-us/windows/win32/api/sysinfoapi/nf-sysinfoapi-getcomputernameexw)

[active directory - Are computer names guaranteed to be unique within a domain? - Server Fault](https://serverfault.com/questions/335908/are-computer-names-guaranteed-to-be-unique-within-a-domain)