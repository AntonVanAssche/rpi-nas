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
- Grafana with prometheus and node-exporter
- Apache
- Vim

The following will be configured after running the script:
- Dotfiles
- Static IP
- Raid 5
			
## Pictures
![enter image description here](https://cdn.shopify.com/s/files/1/0021/1497/7894/products/20200316_170115_grande.jpg?v=1600062159)
Source: https://shop.allnetchina.cn/products/quad-sata-hat-case-for-raspberry-pi-4
