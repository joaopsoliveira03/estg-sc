#!/bin/bash

# Create the folder where the GlusterFS volume will be mounted
sudo mkdir -p /cluster

# Add the mount point to fstab in order to mount it automatically on boot
echo 'localhost:/storage /cluster glusterfs defaults,_netdev 0 0' | sudo tee -a /etc/fstab

# Mount the GlusterFS volume now to avoid rebooting the machine
sudo mount -a
