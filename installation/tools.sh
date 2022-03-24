#!/bin/sh
pacman -S neovim p7zip zip unzip unrar tar dnssec-tools fuse-openrc gvfs gvfs-smb sshfs cups-openrc mtools

yay -S brother-hl3140cw

# aliases
echo "alias todo=\"grep -nirH 'todo' ./\"" >> ~/home/$username/.bashrc
