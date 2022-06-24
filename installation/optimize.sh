#!/bin/sh
echo "=== Running optimalization commands ==="

# Allow more threads in MAKE
echo 'MAKEFLAGS="-j\$(nproc)"' >> /etc/makepkg.conf

# Disable GPU
echo "blacklist nouveau" > /etc/modprobe.d/blacklist-nvidia-nouveau.conf
echo "options nouveau modeset=0" >> /etc/modprobe.d/blacklist-nvidia-nouveau.conf

# Make OpenRC parallel
sed -i 's/#rc_parallel="NO"/rc_parallel="YES"/' /etc/rc.conf

# PowerTop: optimize battery
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