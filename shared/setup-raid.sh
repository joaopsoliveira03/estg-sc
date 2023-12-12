#!/bin/bash

# Install mdadm
sudo apt install mdadm -y

# Create the RAID 1
sudo mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sdb /dev/sdc -R

# Create the filesystem and mount it
sudo mkfs.ext4 /dev/md0
sudo mkdir /raid1
sudo mount /dev/md0 /raid1
echo '/dev/md127 /raid1 ext4 defaults 0 0' | sudo tee -a /etc/fstab
