#!/bin/sh

# fix make config
echo 'MAKEFLAGS=\"-j\$(nproc)\"' >> /etc/makepkg.conf

# Disable GPU
echo "blacklist nouveau" > /etc/modprobe.d/blacklist-nvidia-nouveau.conf
echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf

# arduino: pacman -S arduino