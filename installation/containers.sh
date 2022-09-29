#!/bin/sh
# Install and setup podman instead of docker
pacman -S podman
touch /etc/subuid /etc/subgid
chmod 644 /etc/subuid /etc/subgid
usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $USER

podman system migrate

# Podman supports docker-compose
pacman -S fuse-overlayfs slirp4netns podman-compose

pacman -S iptables-openrc
rc-update add iptables

# If errors: 
# mount -o remount,shared /

# modprobe ip_tables
# echo 'ip_tables' >> /etc/modules

