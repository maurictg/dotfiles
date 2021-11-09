#!/bin/bash
pacman -Syyu
pacman -S artix-archlinux-support

sed '/[options]/a ILoveCandy' /etc/pacman.conf | tee /etc/pacman.conf

cat <<\EOF >> /etc/pacman.conf
# Arch repos
[extra]
Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

[multilib]
Include = /etc/pacman.d/mirrorlist-arch
EOF

pacman -Syyu
pacman -S doas fakeroot

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -r yay

# set doas to yay i.o. sudo
yay --sudo doas --sudoflags -- --save