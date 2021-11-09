#!/bin/sh
pacman -S opendoas
echo "permit persist :wheel" > /etc/doas.conf

sed -i 's/#rc_parallel="NO"/rc_parallel="YES"/' /etc/rc.conf

chgrp video /sys/class/backlight/*/brightness
chmod 664 /sys/class/backlight/*/brightness