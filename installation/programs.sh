#!/bin/sh
echo "Installing basic programs"

# Install programs
pacman -S firefox audacious filezilla transmission-qt xarchiver neovim sqlitebrowser neofetch htop

# Net tools (nslookup, netstat --inet -ap)
pacman -S net-tools

# Archiving tools (zip, rar, tar, 7z)
pacman -S p7zip zip unzip unrar tar