# Martin's ArchLinux install for Nvidia

PLEASE READ ENTIRELY

This script is my personal Arch Linux install script for Nvidia hardware.
It is still in works, the script is not complete yet and will NOT work as of now.

A little resume of what my script does:

- For UEFI
- Single boot (it must NOT be used for dualbooting, it will erase your disk, you are warned)
- No swap
- System in American English with Swiss french keyboard
- Installs Intel ucode for Intel processors
- Installs Plasma KDE with a minimal amount of applications
- Uses Xorg X11 as wayland is still too unstable for Nvidia hardware

This install needs post, manual work for a fully installed setup.
It is not documented here because it is where the install becomes personalized to my hardware, and to me. 


HOW TO USE :
--> You only need to download install1.sh, the other files will be downloaded automatically to the home folder.
--> When the system reboots, go to your home folder and run the next install(number).sh script.
--> If any manual work is required during the execution, it'll be documented.


Feel free to use, copy or modify the script as you will.
I would recommend against executing the file as is, as it is designed for my configuration.

DISCLAIMER:
When you use, copy or modify any part of this script, you accept in good faith to be 100% responsible to what happens to your computer, and this even if the source file was not working as intended.
