#!/bin/bash

# Backup the original sources.list
sudo cp /etc/apt/sources.list /etc/apt/sources.list.backup

# Add deb-src entries
sudo sed -i '/^deb /s/^deb /deb-src /' /etc/apt/sources.list

# Update the package lists
sudo apt-get update

# Download the source code of libgmp-dev
apt-get source libgmp-dev