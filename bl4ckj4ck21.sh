#!/bin/bash
clear
printf "\n******************************************"
printf "\n* Bl4cKj4cK21's Post-Installation Script *"
printf "\n*              Version v1.1              *"
printf "\n******************************************"

# If not run with sudo then stop
if [ "$EUID" -ne 0 ]
  then printf "\n\nPlease run as root"
  exit
fi
echo ""
while true; do
    echo ""
    read -p "- Install USB-3 Missing Drivers (y/n/q) ?" yn
    case $yn in
        [Yy]* ) sudo pacman -Syy aic94xx-firmware wd719x-firmware upd72020x-fw;
                break;;
        [Nn]* ) break;;
        [QqXx]* ) printf "\n\nGood Bye";
                  exit;;
        * ) printf "\nPlease Answer Yes, No or Quit.\n";;
    esac
done

while true; do
    echo ""
    read -p "- Remove Bad Driver (y/n/q) ?" yn
    case $yn in
        [Yy]* ) sudo pacman -Rns 8188fu-kelebek333-dkms-git;
                break;;
        [Nn]* ) break;;
        [QqXx]* ) printf "\nGood Bye";
                  exit;;
        * ) printf "\nPlease Answer Yes, No or Quit.\n";;
    esac
done

while true; do
    echo ""
    read -p "- Install Default Softwares (y/n/q) ?" yn
    case $yn in
        [Yy]* ) sudo pacman -Syy nano leafpad libsecret gnome-keyring keypassxc vlc;
                break;;
        [Nn]* ) break;;
        [QqXx]* ) printf "\n\nGood Bye";
                  exit;;
        * ) printf "\nPlease Answer Yes, No or Quit.\n";;
    esac
done

while true; do
    echo ""
    read -p "- Creating Mounting Point Folders (y/n/q) ? " yn
    case $yn in
        [Yy]* ) sudo mkdir -m 777 /mnt/{Jeux_Linux,Linux,SSD_Linux,Films,Jeux,Jeux_SSD,Multimedia,Photos,Windows};
                break;;
        [Nn]* ) break;;
        [QqXx]* ) printf "\nGood Bye";
                  exit;;
        * ) printf "\nPlease Answer Yes, No or Quit.\n";;
    esac
done

while true; do
    echo ""
    read -p "- Auto-Mount Partition at Boot (y/n/q) ? " yn
    case $yn in
        [Yy]* ) sudo cp -v -u -i /etc/fstab /etc/fstab.bak;
                sudo cat fstab.txt >> /etc/fstab;
                if  hash nano 2>/dev/null;
                    then
                        sudo nano /etc/fstab
                fi
                break;;
        [Nn]* ) break;;
        [QqXx]* ) printf "\nGood Bye";
                  exit;;
        * ) printf "\nPlease Answer Yes, No or Quit.";;
    esac
done

while true; do
    echo ""
    read -p "- Do you want to autoset your Pacman.conf ? (y/n/q) ? " yn
    case $yn in
        [Yy]* ) if [ $(lsb_release -is) == "Garuda" ]
                    then
                        printf "\n     Garuda Linux Detected."
                        printf "\n     Configuration of Pacman.conf ..."
                        sudo cat garuda-pacman.conf > /etc/pacman.conf
                        if  hash nano 2>/dev/null;
                            then
                                sudo nano /etc/pacman.conf
                        fi
                        printf " Done\n"
                        break
                fi;;
        [Nn]* ) break;;
        [QqXx]* ) printf "\nGood Bye";
                  exit;;
        * ) printf "\nPlease Answer Yes, No or Quit.\n";;
    esac
done

while true; do
    echo ""
    read -p "- Do you want to autoset your Grub ? (y/n/q) ? " yn
    case $yn in
        [Yy]* ) if [ $(lsb_release -is) == "Garuda" ]
                    then
                        printf "\n     Garuda Linux Detected."
                        printf "\n     Configuration of Grub ..."
                        sudo cat garuda-grub > /etc/default/grub
                        printf " Done\n"
                        printf "     Installation of Grub ...\n\n"
                        sudo grub-mkconfig -o /boot/grub/grub.cfg
                        printf "\nDone\n"
                        break
                fi;;
        [Nn]* ) break;;
        [QqXx]* ) printf "\nGood Bye";
                  exit;;
        * ) printf "\nPlease Answer Yes, No or Quit.\n";;
    esac
done
printf "\nGood Bye"
