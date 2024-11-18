#!/bin/bash -e

echo "Installer for Arch Linux - sudo required"

# Set timezone
echo "Setting timezone..."
ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime

# Set time to auto update
echo "Setting time to auto update..."
timedatectl set-ntp true

# Set hardware clock
echo "Setting hardware clock..."
hwclock --systohc

# Set locale
echo "Setting locale..."
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen

# Set Keyboard layout
echo "Setting keyboard layout..."
echo "KEYMAP=de-latin1" > /etc/vconsole.conf
localectl set-keymap de-latin1
loadkeys de-latin1

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

# Install docker
echo "Installing docker..."

usermod -aG docker $USER


# Install docker-compose
echo "Installing docker-compose..."

# Download config files
echo "Downloading dotfiles..."
git clone https://your_repo.git
cp -r your_repo/* ~
rm -rf your_repo

# Enable System services
systemctl start docker
systemctl enable docker