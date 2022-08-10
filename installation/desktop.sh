#!/bin/sh
# REQUIRE: create_user, pacman
#
# Install desktop environment (Sway), graphical backends and audio/video backends
#

echo "=== Install graphical environment ==="

# Setup graphical and wayland environment
pacman -S wayland xorg-xwayland wlroots wl-clipboard

# Install sway, dependencies and tools
pacman -S sway swaybg swaylock waybar wofi foot ttf-font-awesome noto-fonts ttf-hack materia-gtk-theme grim slurp

echo "=== Install AV backends ==="

# Install audio and video backends
pacman -S pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber light xdg-desktop-portal-wlr

echo "=== Install tools ==="

# Install other desktop tools
pacman -S nm-connection-editor pavucontrol thunar thunar-volman thunar-archive-plugin polkit-gnome
# TODO: install wdisplays via yay

echo "=== Post-install GUI ==="

# Post-install video
chgrp video /sys/class/backlight/*/brightness
chmod 664 /sys/class/backlight/*/brightness
usermod -a -G video $USER

# Set environment for wayland
echo "export _JAVA_AWT_WM_NONREPARENTING=1" >> /etc/profile
echo "export GTK_THEME=Materia:dark" >> /etc/profile
echo "export MOZ_ENABLE_WAYLAND=1" >> /etc/profile
echo "export XDG_SESSION_TYPE=wayland" >> /etc/profile

# Set wallpaper
cp /home/$USER/.config/wallpaper.jpg /usr/share/backgrounds/wallpaper.jpg