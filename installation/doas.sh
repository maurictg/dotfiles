#!/bin/sh
echo "=== Installing doas ==="

pacman -S opendoas
echo "permit persist :wheel" > /etc/doas.conf

pacman -Rcns sudo