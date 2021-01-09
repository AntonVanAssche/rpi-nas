#!/bin/bash

# Input variables
echo "[?] ${cyan}choose an IP address (example: 192.168.0.100)${reset}"
read -p "IP address: " ip_address
echo "[?] ${cyan}choose a gateway (example: 192.168.0.1)${reset}"
read -p "Gateway: " gateway
echo "[?] ${cyan}Choose the default and secondary DNS server (example: 1.1.1.1 1.0.0.1)${reset}"
read -p "DNS server 1: " DNS1
read -p "DNS server 2: " DNS2

# echo >> /etc/dhcpcd.conf
echo -e "[i] ${cyan}Configuring static IP. ${reset}"
        echo -e "[i]${cyan}The following settings will be changed: ${reset}"
        echo "[i]${cyan} IP address:                $ip_address/24 ${reset}"
        echo "[i]${cyan} Default gateway:           $gateway ${reset}"
        echo "[i]${cyan} Preferred DNS:             $DNS1 $DNS2 ${reset}"
        echo "[i]${cyan} IP addressing              static ${reset}"
        echo "
        interface eth0
        static ip_address=$ip_address/24
        static routers=$gateway
        static domain_name_servers=$DNS1 $DNS2" >> /etc/dhcpcd.conf

# restart network settings
sudo ip link set eth0 down && sudo ip link set eth0 up
ip a
