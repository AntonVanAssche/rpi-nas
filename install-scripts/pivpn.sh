#!/bin/bash

# Download pivpn installer into rpi-nas/pivpn/index.html
wget https://install.pivpn.io -P rpi-nas/pivpn/

# Execute installer
source $dir/pivpn/index.html
