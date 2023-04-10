#!/bin/sh
#ArchInstallNvidia by MD^ (Martin)
#file: install-archchroot.sh
#v1.0e

#Set time zone to Switzerland
ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime

#Sychronize clocks
hwclock --systohc


#Set the locale
echo "en_US.UTF-8 UTF-8"    >>  /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8"     >   /etc/locale.conf

#Set keyboard for the system and Plasma on X11
echo "KEYMAP=fr_CH"     >   /etc/vconsole.conf
echo "XKBLAYOUT=ch"     >>  /etc/vconsole.conf
echo "XKBVARIANT=fr"    >>  /etc/vconsole.conf


#set hostname and hosts
echo "martinpc"                                         >   /etc/hostname
echo "127.0.0.1       localhost"                        >>  /etc/hosts
echo "::1             localhost"                        >>  /etc/hosts
echo "127.0.0.1       martinpc.localdomain    martinpc" >>  /etc/hosts


#BOOTLOADER: Systemd + config
bootctl --path=/boot install
echo "default arch"                 >>  /boot/loader/loader.conf
touch /boot/loader/entries/arch.conf
echo "title Arch Linux"             >   /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux"         >>  /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img"  >>  /boot/loader/entries/arch.conf
echo "options root=/dev/sda2 rw"    >>  /boot/loader/entries/arch.conf


#Installation of some packages that will be useful on the next boot
pacman -Sy --noconfirm dhcpcd ifplugd ntfs-3g intel-ucode networkmanager bluez pipewire-pulse

#We ask the user to change root password
passwd
