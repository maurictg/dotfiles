#!/bin/sh
# REQUIRE: pacman
echo "=== Install development tools ==="

pacman -S dotnet-sdk dotnet-runtime dotnet-host aspnet-runtime rust go jdk-openjdk

echo "=== Post-install java ==="
archlinux-java status
printf "Enter java version shown above: "
read javaversion
archlinux-java set $javaversion

# visual-studio-code-bin