#!/bin/bash

# Input variables
echo "[?] ${cyan}choose an IP address (example: 192.168.0.100)"
read -p "IP address: " ip_address
echo "[?] ${cyan}choose a gateway (example: 192.168.0.1)"
read -p "Gateway: " gateway
echo "[?] ${cyan}Choose the default and secondary DNS server (example: 1.1.1.1 1.0.0.1)"
read -p "DNS server 1: " DNS1
read -p "DNS server 2: " DNS2

# echo >> /etc/dhcpcd.conf
message info "Configuring static IP..."
        echo -e "[i]${cyan}The following settings will be changed:"
        echo "[i]${cyan} IP address:                $ip_address/24"
        echo "[i]${cyan} Default gateway:           $gateway"
        echo "[i]${cyan} Preferred DNS:             $DNS1 $DNS2"
        echo "[i]${cyan} IP addressing              static"
        echo "
        interface eth0
        static ip_address=$ip_address/24
        static routers=$gateway
        static domain_name_servers=$DNS1 $DNS2" >> /etc/dhcpcd.conf

# restart network settings
sudo ip link set eth0 down && sudo ip link set eth0 up
ip a
