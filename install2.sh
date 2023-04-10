#!/bin/sh
#ArchInstallNvidia by MD^ (Martin)
#file: install2.sh
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


#Systemd bootloader
bootctl --path=/boot install






