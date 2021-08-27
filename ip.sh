#!/bin/bash

message quest "IP address (example: 192.168.0.100): "
read -p " " IP

message quest "Subnet prefix (example: 24): "
read -p " " SUBNET

message quest "Gateway (example: 192.168.0.1): "
read -p " " GATEWAY

echo "
interface eth0
static ip_address=$IP/$SUBNET
static routers=$GATEWAY
static domain_name_servers=1.1.1.1 1.0.0.1
" | sudo tee -a /etc/dhcpcd.conf

message info "Restarting dhcpcd..."
sudo systemctl restart dhcpcd

message info "Setting up firewall..."
sudo apt install ufw -y
sudo ufw allow 22/tcp
sudo ufw allow 53/tcp
sudo ufw allow 80/tcp
sudo ufw allow 139/tcp
sudo ufw allow 445/tcp
sudo ufw allow 1194/tcp
sudo ufw allow 3000/tcp
sudo ufw allow 8080/tcp
sudo ufw allow 8096/tcp
sudo ufw allow 9090/tcp
sudo ufw allow 9100/tcp
sudo ufw allow 51820/tcp

sudo ufw allow 53/udp
sudo ufw allow 137/udp
sudo ufw allow 138/udp
sudo ufw allow 1194/udp
sudo ufw allow 51820/udp

sudo ufw enable
