#!/bin/sh
#ArchInstallNvidia by MD^ (Martin)
#file: install1.sh
#v1.0e

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
mkfs.fat    -F32                /dev/sda1
mkfs.btrfs  -L ArchSystem       /dev/sda2

#we mount these partitions
mount /dev/sda2 /mnt
mkdir           /mnt/boot
mount /dev/sda1 /mnt/boot


#Getting Linux installed
pacstrap /mnt base linux linux-firmware nano


#System mount points
genfstab -U /mnt >> /mnt/etc/fstab
cat                 /mnt/etc/fstab


#Download and prepare the next scripts
curl -LO raw.githubusercontent.com/00Martin/ArchInstallNvidia/experimental/install-archchroot.sh
curl -LO raw.githubusercontent.com/00Martin/ArchInstallNvidia/experimental/install2.sh
#We move the second script to the home folder so it is saved and ready to use on the next reboot
mv install2.sh /mnt/home
#We move the archchroot script inside root so we can run it inside the arch chroot environment
mv install-archchroot.sh /mnt/

#Run the next script inside arch-chroot
arch-chroot /mnt install-archchroot.sh

#We delete the archchroot file after it was run to keep the install clean,
rm /mnt/install-archchroot.sh

#Rebooting into our newly installed arch system, the user will have to run the next script which was put into the home folder
reboot


#If partitions are not ready, we stop
else
echo -e "\nPlease create your partitions and start the script again\n"
fi
