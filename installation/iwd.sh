pacman -S iwd-openrc networkmanager-openrc

cat <<\EOF > /etc/NetworkManager/NetworkManager.conf
# setup IWD
[device]
wifi.backend=iwd
EOF

rc-update add iwd
rc-update add NetworkManager
pacman -Rcns wpa_supplicant-openrc

mkdir /etc/iwd
cat <<\EOF > /etc/iwd/main.conf
[General]
EnableNetworkConfiguration=true

[Settings]
AutoConnect=true
EOF