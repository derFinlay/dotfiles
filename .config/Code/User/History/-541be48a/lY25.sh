#!/bin/bash -e

echo "Installer for Arch Linux - sudo required"

echo "Updating pacman database..."
pacman -Syu --noconfirm
echo "Installing pacman packages..."
pacman -S - < packages.txt

