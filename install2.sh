#!/bin/sh
#ArchInstallNvidia by MD^ (Martin)
#file: install2.sh
#v1.0e

#We enable DHCP in case it wasn't enabled already
systemctl enable --now dhcpcd

#We ask the user to enter a username
echo -e "\n\nPlease enter your username: \nThis script does not verify if the username is valid, so make sure to enter a correct one.\nA good practice is a simple name in lowercase, without any number or special caracter."
read username
#We create a user with the provided username
useradd -m $username
passwd $username

#We update all packages
sudo pacman -Syu

#We install the nvidia drivers for a standard kernel release and some basic libraries (the rest will be downloaded with the --needed parameter)
sudo pacman -S --needed nvidia lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader

#We install everything needed for KDE Plasma, with a limited set of applications
sudo pacman -S xorg plasma sddm bluedevil konsole dolphin kcron ksystemlog partitionmanager ark okular kate kompare gwenview ktorrent kalendar kcalc elisa

#We enable some services on boot for the user to have a fully working system out of the box
systemctl enable sddm.service
systemctl enable NetworkManager
systemctl enable bluetooth.service

#Some manual work is required, these steps are a little more complicated then just adding a line at the end of a conf file
#For the pacman conf file, it is possible to do it by specifying the specific lines to make the changes, but it's bad practice because we risk making the script obsolete too quickly
echo -e "\n\nSTEP 1: We need to add our new user to the sudoer file, to do this ->\nUse the following command: EDITOR=nano visudo\nAdd this line with the correct username under the user privilege specification: NAMEOFUSER ALL=(ALL) ALL"
echo -e "\nSTEP 2: We want to allow the download of more divers packages of the arch repository, to do so->\nOpen the pacman configuration file by doing: nano /etc/pacman.conf\nMake sure all 4 of the core, extra, community, multilib source are uncommented"

echo -e "\n\nOnce both of these steps are done, you can reboot and delete the script from the home folder."
