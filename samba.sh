#!/bin/bash

echo -e "[i] ${cyan}Updating system cache...${reset}"
        sudo apt update &> /dev/null
        sudo apt upgrade -y &> /dev/null

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
path = /mnt/nas/
comment = RasPi NAS Share
valid users = pi
writable = yes
browsable = yes
create mask = 0644
directory mask = 0755" >> /etc/samba/smb.conf

# Restarting samba
sudo systemctl restart smbd
