#!/bin/bash
# REQUIRE: doas, git
echo "=== Setting up PacMan and yay ==="

pacman -Syyu

cat <<\EOF >> /etc/pacman.conf
[options]
ILoveCandy

# Universe (contains artix-archlinux-support)
[universe]
Server = https://universe.artixlinux.org/$arch
Server = https://mirror1.artixlinux.org/universe/$arch
Server = https://mirror.pascalpuffke.de/artix-universe/$arch
Server = https://artixlinux.qontinuum.space/artixlinux/universe/os/$arch
Server = https://mirror1.cl.netactuate.com/artix/universe/$arch
Server = https://ftp.crifo.com/artix-universe/

# Omniverse (prebuild AUR packages)
#[omniverse]
#Server = http://omniverse.artixlinux.org/$arch
EOF

pacman -Syyu
pacman -S artix-archlinux-support base-devel

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
pacman -R sudo
FROM=$(pwd)

# Install yay
# Temporary add user
useradd -m tempusr
cd /home/tempusr
runuser -u tempusr -- git clone https://aur.archlinux.org/yay.git
cd /home/tempusr/yay
runuser -u tempusr -- makepkg -si
userdel -r tempusr

cd $FROM

# set doas to yay i.o. sudo
yay --sudo doas --sudoflags -- --save


# if problems with keys: https://wiki.archlinux.org/title/Pacman/Package_signing#Resetting_all_the_keys