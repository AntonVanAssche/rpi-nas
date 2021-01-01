#!/bin/bash

echo -e "[i] ${cyan}Updating system cache...${reset}"
	sudo apt update &> /null/dev

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
	sudo mount /dev/md0 /mnt/nas/

	# Backup /etc/fstab
	sudo cp /etc/fstab /etc/fstab.bak

# Mount disks on boot
echo -e "[?] ${cyan}What is the UUID of the RAID partition? (example: 394fd8f2-7b2a-474f-8e58-48b81a6ca8fb)${reset}"
read -p "UUID: " UUID
	sudo echo "UUID=$UUID /mnt/nas ext4 defaults 0 0"  >> /etc/fstab

# Set permissions
sudo chown -R pi:pi /mnt
sudo chmod -R 0777 /mnt