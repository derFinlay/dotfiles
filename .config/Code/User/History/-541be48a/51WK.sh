#!/bin/bash -e

echo "Installer for Arch Linux - sudo required"

echo "Installing pacman packages..."
pacman -Syu --noconfirm
pacman -S - < packages.txt

