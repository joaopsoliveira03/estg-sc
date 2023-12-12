#!/bin/bash

# Install Docker Compose and MySQL Client for testing purposes
sudo apt install docker-compose mysql-client -y

# Enable and start Docker
sudo systemctl enable --now docker

# Pull the images for a faster deployment
sudo docker-compose --project-directory /vagrant/ pull
sudo docker pull ubuntu:latest
