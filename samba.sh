#!/bin/bash

echo -e "[i] ${cyan}Updating system cache...${reset}"
        sudo apt update &> /null/dev
        sudo apt upgrade -y &> /null/dev

echo -e "[i] ${cyan}Installing samba...${reset}"
        sudo apt-get install samba samba-common-bin -y

# Add user:pi and share password
sudo smbpasswd -a pi

# Creating backup of /etc/samba/smb.conf
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bak

# echo settings >> /etc/samba/smb.conf
sudo echo "
# NAS Share
[NAS]
path = /mnt
comment = RasPi NAS Share
valid users = pi
writable = yes
browsable = yes
create mask = 0777
directory mask = 0777" >> /etc/samba/smb.conf

# Restarting samba
sudo systemctl restart smbd
