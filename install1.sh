#!/bin/sh
#v1.0

#To simply the script, we will ask the user to create the partitions first
#We assume the user knows how partitions work, and will create them properly as described
echo -e "\nCreate your partitions first with -> cfdisk /dev/sda\n\nYour partitions must look like this:"
echo -e "sda1 - boot efi, under 4GB, typically 512MB-2GB, 2GB recommended to allow multiple kernels\nsda2 - system, can fill up the rest of the disk\n\n"

#We ask the user if the partitions are created
echo "Have you done this ? [n/Y]"
read answer

#If the partitions are ready, we continue
if [ $answer == "Y" ]; then



#Set the keyboard as the user will have to change the root password
loadkeys fr_CH-latin1

#For information only, can help the user debug efi state, disks or network
ls /sys/firmware/efi/efivars
lsblk
ping -c 4 archlinux.org

#For time synchronization
timedatectl set-ntp true


#Set disk filesystem for boot and system
mkfs.fat -F32 /dev/sda1
mkfs.btrfs -L ArchSystem /dev/sda2

#we mount these partitions
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot


#Getting Linux installed
pacstrap /mnt base linux linux-firmware nano


#System mount points
genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab


#Set root fs
#The script stops there as we change the root fs
#To lower complexity, we make the user run the next script
arch-chroot /mnt



#The partitions are not ready, we stop
else
echo -e "\nPlease create your partitions and start the script again\n"
fi
