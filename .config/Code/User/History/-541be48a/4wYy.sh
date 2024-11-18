#!/bin/bash -e

echo "Installer for Arch Linux - sudo required"


# Update pacman database and install packages
echo "Updating pacman database..."
pacman -Syu --noconfirm
echo "Installing pacman packages..."
pacman -S - < pacman-packages.txt

# Install yay
echo "Installing yay..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

# Install yay packages
echo "Installing yay packages..."
yay -S - < yay-packages.txt