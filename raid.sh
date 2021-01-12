#!/bin/bash

echo -e "[i] ${cyan}Updating system cache...${reset}"
	sudo apt update &> /dev/null

echo -e "[i] ${cyan}Installing mdadm...${reset}"
	sudo apt-get install mdadm -y

echo -e "[i] ${cyan}Setting up raid...${reset}"

	# Setup RAID-5 Volume
	sudo blkid
	sudo mdadm --create --verbose /dev/md0 --level=5 --raid-devices=4 /dev/sda1 /dev/sdb1 /dev/sdc1 /dev/sdd1 --spare-devices=0

	# Confirm RAID array
	sudo mdadm --detail /dev/md0
	
	# Save RAID array
	sudo -i
	sudo mdadm --detail --scan >> /etc/mdadm/mdadm.conf
	exit

	# Create File system
	sudo mkfs.ext4 -v -m .1 -b 4096 -E stride=32,stripe-width=64 /dev/md0
	sudo mkdir /mnt/nas
    sudo mount /dev/md0 /mnt/nas/

    # Copying mount service file >> /etc/systemd/system/
    sudo cp -r config_files/mnt-nas.mount /etc/systemd/system/
    sudo chown root:root /etc/systemd/system/mnt-nas.mount

# Set permissions
sudo chown -R pi:pi /mnt/nas/
sudo chmod -R 0755 /mnt/nas/
