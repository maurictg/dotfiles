# Setup Artix Linux using my dotfiles

## 1. Download ISO
Go to [https://artixlinux.org/download.php](https://artixlinux.org/download.php) and download the **Artix base OpenRC**.

1.1 Flash the ISO to a USB stick
1.2 Reboot
1.3 Boot from the USB and select "From stick/hdd" in the boot menu
1.4 Login with "artix" and password "artix"
1.5 Enter "su" to enter superuser mode

## 2. Partition disk

### Setup filesystem
Run `fdisk /dev/sda`
Enter: `g`, then enter `w` to write GPT table

### Create partitions
Enter `cfdisk /dev/sda`

Create these partitions
- EFI System: 300M
- Linux swap: 8G
- Linux home: nG (~100)
- Linux filesystem: remaining

Enter `fdisk -l` to check if everything is OK
It should look like this:

```
/dev/sda1: EFI
/dev/sda2: Swap
/dev/sda3: Home
/dev/sda4: Filesystem
```

### Format partitions
Enter the following commands:
```
mkfs.fat -F 32 /dev/sda1
fatlabel /dev/sda1 BOOT

mkswap -L SWAP /dev/sda2
mkfs.ext4 -L HOME /dev/sda3
mkfs.ext4 -L ROOT /dev/sda4
```

### Mount partitions
Enter the following commands:
```
swapon /dev/disk/by-label/SWAP
mount /dev/disk/by-label/ROOT /mnt

mkdir /mnt/home
mkdir /mnt/boot

mount /dev/disk/by-label/HOME /mnt/home
mount /dev/disk/by-label/BOOT /mnt/boot
```

## 3. Install linux
Check if network connection: `ping www.google.com`

### Setup Base:
Run the following commands:
```sh
# Install base
basestrap /mnt base openrc elogind-openrc

# Install linux kernel
basestrap /mnt linux linux-firmware
```

Generate fstab

`fstabgen -U /mnt >> /mnt/etc/fstab`

Check if fstab is correct:

`cat /mnt/etc/fstab`


It should contain HOME, ROOT, BOOT and SWAP label.

## 4. Setup system using chroot
Enter the following commands:
```sh
# Enter chroot
artix-chroot /mnt

# Set timezone
ln -sf /usr/share/zoneinfo/Europe/Amsterdam /etc/localtime
hwclock --systohc

# Set locale
echo “en_US.UTF-8 UTF-8” >> /etc/locale.gen
locale-gen
```

### Install grub bootloader
Enter the following commands:
```sh
# Install grub
pacman -S grub os-prober efibootmgr

# Setup
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub

# Create config
grub-mkconfig -o /boot/grub/grub.cfg
```

### User and network
Change root password using `passwd`

Setup network using the following commands:
``` sh
# Replace arti with your hostname
echo “arti” > /etc/hostname
echo “127.0.0.1    localhost” >> /etc/hosts
echo “::1               localhost” >> /etc/hosts
echo “hostname=\”$(cat /etc/hostname)\”” > /etc/conf.d/hostname
```

Install DHCP client

`pacman -S dhclient`

### Unmount and reboot
Enter the following commands
```sh
# Exit chroot
exit
umount -R /mnt
reboot
```

## 5. After reboot
Connect to internet: `dhclient`

### Install git and clone dotfiles
```
pacman -S git
git clone https://github.com/maurictg/dotfiles.git
cd dotfiles/installation
```

Start the installation
```
./install.sh
```

After the installation, copy the `dotfiles` folder from the root account to the user with `cp -r /root/dotfiles /home/yourusername/.config` and run `chown -R yourusername /home/yourusername/.config`. Finally, remote the dotfiles folder from the root account

To auto-start sway on login, uncomment `exec sway` from the .bashrc in the user home folder.