#!/bin/sh
#version 0.1

echo -e "\nCreate your partitions first with -> cfdisk /dev/sda\n\nYour partitions must look like this:"
echo -e "sda1 - boot efi, under 4GB, typically 512MB-2GB, 2GB recommended to allow multiple kernels\nsda2 - system, can fill up the rest of the disk\n\n"

echo "Have you done this ? [n/Y]"
read answer

if [ $answer == "Y" ]; then
echo -e "\nnext\n"
else
echo -e "\nPlease create your partitions and start the script again\n"
fi
