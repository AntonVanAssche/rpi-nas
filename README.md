# rpi-nas

<img src="https://cdn.shopify.com/s/files/1/0021/1497/7894/products/2020428_6_1024x1024.jpg?v=1600062159" alt="img" align="right" width="250px">

This repository contains the scripts and configuration files that I use to turn my Raspberry pi 4 into a NAS using the [Raspberry Pi - Quad NAS Kit, 4x SATA](https://www.reichelt.com/be/en/raspberry-pi-quad-nas-kit-4x-sata-rpi-nas-4xsata-k-p293032.html?CCOUNTRY=661&LANGUAGE=nl&GROUPID=9003&START=0&OFFSET=16&SID=92452fc2f43d5523472d37acf8f97abee48297c96771af5666fa3&LANGUAGE=EN&&r=1).

## Requirements

The following hardware is **required** to use these scripts:

-   Raspberry pi 4
-   microSD card
-   Quad SATA kit
-   4x 2.5 inch hdd

## Installation

**Warning DO NOT run the `install.sh` script if you do not fully understand what it does. Seriously, DON'T!**

You will have to run the `install.sh` twice. The first time it will install all the necessary packages after that it will ask to reboot the system. When the system is back online run the `install.sh` for the second time, the script should automatically detect if it's running for the second time and will configure the network setting and much more.

```
$ git clone https://github.com/AntonVanAssche/rpi-nas.git
$ chmod +x rpi-nas/*.sh
$ ./rpi-nas/install.sh
```

## Programs

| Name                                                         | Usage                                           |
| ------------------------------------------------------------ | ----------------------------------------------- |
| [Grafana](https://github.com/grafana/grafana)                | Data visualization platform                     |
| [Prometheus](https://github.com/prometheus/prometheus)       | Data scource for Grafana                        |
| [Node-exporter](https://github.com/prometheus/node_exporter) | Exporter for machine metrics                    |
| [Samba](https://github.com/samba-team/samba)                 | File sharing software using the SMB-protocol    |
| [Vim](https://github.com/vim/vim)                            | Text editor                                     |
| [SATA-hat software](https://github.com/akgnah/rockpi-sata)   | Necessary software in order to use the SATA hat |
| [Pihole](https://github.com/pi-hole/pi-hole)                 | DNS level ad blocking software                  |
| [Pivpn](https://github.com/pivpn/pivpn)                      | VPN for Raspberry Pi                            |

## Configurations

The following will be configured after running these scripts:

-   [Static IP](./install-scripts/ip.sh)
-   [Firewall](./install-scripts/ip.sh)
-   [Raid 5](./install-scripts/raid.sh)
-   [Samba share](./install-scripts/samba.sh)

## Feedback

These scripts aren't perfect therefore suggestions/improvements are always [welcome](https://github.com/AntonVanAssche/rpi-nas/issues)!

## License

The files and scripts in this repository are licensed under the MIT License, which is a very permissive license allowing you to use, modify, copy, distribute, sell, give away, etc. the software. In other words, do what you want with it. The only requirement with the MIT License is that the license and copyright notice must be provided with the software.
