# rpi-nas

This repository contains the scripts and configuration files to turn your Raspberry pi 4 into a NAS.

## Requirements

The following hardware is required to use this scripts:
- Raspberry pi 4
- microSD cart
- Quad SATA kit
- 4x 2.5 inch hdd 

## Installation

**Note**: replace the git clone links with **yours**.

**Warning DO NOT run the `setup.sh` script if you do not fully understand what it does. Seriously, DON'T!**

```
$ git clone https://gitlab.com/sudo_TuX/rpi-nas
$ chmod +x rpi-nas/*.sh
$ ./rpi-nas/setup.sh
```

## Programs

| Name  | Usage |
| ------------- | ------------- |
| [Grafana](https://github.com/grafana/grafana) | Data visualization platform |
| [Prometheus](https://github.com/prometheus/prometheus) | Data scource for Grafana |
| [Node-exporter](https://github.com/prometheus/node_exporter) | Exporter for machine metrics |
| [Apache](https://github.com/ceph/apache2) |  Apache HTTP Server |
| [Vim](https://github.com/vim/vim) | Text editor |
| [SATA-hat software](https://github.com/akgnah/rockpi-sata) | Necessary software in order to use the SATA hat |
| [Pihole](https://github.com/pi-hole/pi-hole) | The Pi-hole® is a DNS sinkhole that protects your devices from unwanted content |
| [Pivpn](https://github.com/pivpn/pivpn) | Vpn for Raspberry Pi |

## Configurations

The following will be configured after running the script:
- Dotfiles
- Static IP
- Raid 5
- Samba share
- website

## Feedback

These scripts aren't perfect therefore suggestions/improvements are always [welcome](https://gitlab.com/sudo_TuX/rpi-nas/-/issues)!

## License

The files and scripts in this repository are licensed under the MIT License, which is a very permissive license allowing you to use, modify, copy, distribute, sell, give away, etc. the software. In other words, do what you want with it. The only requirement with the MIT License is that the license and copyright notice must be provided with the software.
