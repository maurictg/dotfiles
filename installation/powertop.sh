#!/bin/sh
pacman -S powertop

cat << EOF > /etc/init.d/powertop
#!/sbin/openrc-run
name="powertop auto tune"
description=""
start() { powertop --auto-tune; }
stop() {}
EOF


chmod +x /etc/init.d/powertop
rc-update add powertop