# rpi-nas

This repository contains the scripts and configuration files to turn your Raspberry pi 4 into a NAS.

## Requirements

This are the requirements in order to use these scripts

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
$ .rpi-nas/setup.sh
```

## rpi-nas/setup.sh

This is the setup script that will turn your rpi in to a home NAS.

The following packages will be installed after running the script:
- [Grafana](https://github.com/grafana/grafana)
- [Prometheus](https://github.com/prometheus/prometheus)
- [Node-exporter](https://github.com/prometheus/node_exporter)
- [Apache](https://github.com/ceph/apache2)
- [Vim](https://github.com/vim/vim)
- [wget](https://github.com/jay/wget)
- [curl](https://github.com/curl/curl)
- [htop](https://github.com/hishamhm/htop)
- [SATA-hat software](https://github.com/akgnah/rockpi-sata)
- [Pihole](https://github.com/pi-hole/pi-hole)
- [Pivpn](https://github.com/pivpn/pivpn)

The following will be configured after running the script:
- Dotfiles
- Static IP
- Raid 5
- Samba share
- website
	
## Pictures

![enter image description here](https://cdn.shopify.com/s/files/1/0021/1497/7894/products/20200316_170115_grande.jpg?v=1600062159)

Source: https://shop.allnetchina.cn/products/quad-sata-hat-case-for-raspberry-pi-4

## Feedback

These scripts aren't perfect therefore suggestions/improvements are always [welcome](https://gitlab.com/sudo_TuX/rpi-nas/-/issues)!

## License

The files and scripts in this repository are licensed under the MIT License, which is a very permissive license allowing you to use, modify, copy, distribute, sell, give away, etc. the software. In other words, do what you want with it. The only requirement with the MIT License is that the license and copyright notice must be provided with the software.
