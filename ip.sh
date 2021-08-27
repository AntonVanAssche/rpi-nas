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
