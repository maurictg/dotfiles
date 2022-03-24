#!/bin/sh

# fonts, display engine (xorg), audio, screen
pacman -S ttf-hack ttf-fira-code noto-fonts arc-icon-theme xorg-server xorg-xinit light alsautils-openrc pulseaudio pulseaudio-alsa

# optional, other fonts (chinese, korean)
# pacman -S noto-fonts-cjk

# desktop
pacman -S awesome rofi pavucontrol gnome-screenshot thunar thunar-volman thunar-archive-plugin file-roller sshfs gnome-terminal

# other desktop apps
pacman -S firefox audacious filezilla transmission-qt xarchiver

# other things, like video codecs
pacman -S ffmpeg ffmpeg-compat-58